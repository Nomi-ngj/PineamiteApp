import Foundation
import PineamiteNetworking

public final class MockHTTPClient: HTTPClient {
    public enum Latency {
        case none, milliseconds(UInt64)
    }

    public let baseURL: URL = URL(string: "https://mock.local")!
    private let latency: Latency
    private var routes: [String: Data] = [:]
    private var statuses: [String: Int] = [:]

    public init(latency: Latency = .none) {
        self.latency = latency
    }

    public func register(_ method: HTTPMethod, _ path: String, responseData: Data, status: Int = 200) {
        let key = "\(method.rawValue) \(path)"
        routes[key] = responseData
        statuses[key] = status
    }

    public func registerJSON(_ method: HTTPMethod, _ path: String, object: Encodable, status: Int = 200) throws {
        let data = try JSONEncoder().encode(AnyEncodable(object))
        register(method, path, responseData: data, status: status)
    }

    public func register(_ method: HTTPMethod, _ path: String, responseJSONNamed name: String, in bundle: Bundle? = nil, status: Int = 200) {
        
        let bundleToUse = bundle ?? Bundle.module   // use default here
        let url = bundleToUse.url(forResource: name, withExtension: "json")!
        let data = try! Data(contentsOf: url)
        register(method, path, responseData: data, status: status)
    }

    public func send<E, D>(_ endpoint: E, decoder: D) async throws -> E.Response where E : Endpoint, D : TopLevelDecoder, D.Input == Data {
        // Simulate latency
        if case .milliseconds(let ms) = latency {
            try? await Task.sleep(nanoseconds: ms * 1_000_000)
        }
        let key = "\(endpoint.method.rawValue) \(endpoint.path)"
        let status = statuses[key] ?? 404
        let data = routes[key]
        if !(200...299).contains(status) {
            throw APIError.http(status: status, message: data.flatMap { String(data: $0, encoding: .utf8) }, data: data)
        }
        guard let data else {
            throw APIError.invalidRequest("No mock response registered for \(key)")
        }
        return try decoder.decode(E.Response.self, from: data)
    }
}

// Helper to encode unknown Encodable
private struct AnyEncodable: Encodable {
    let _encode: (Encoder) throws -> Void
    init(_ wrapped: Encodable) { self._encode = wrapped.encode }
    func encode(to encoder: Encoder) throws { try _encode(encoder) }
}
