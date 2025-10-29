import Foundation

public protocol HTTPClient {
    var baseURL: URL { get }
    func send<E: Endpoint, D: TopLevelDecoder>(_ endpoint: E, decoder: D) async throws -> E.Response where D.Input == Data
}

public final class URLSessionHTTPClient: HTTPClient {
    public let baseURL: URL
    private let session: URLSession
    private let requestBuilder: RequestBuilder

    public init(baseURL: URL, session: URLSession = .shared) {
        self.baseURL = baseURL
        self.session = session
        self.requestBuilder = RequestBuilder(baseURL: baseURL)
    }

    public func send<E: Endpoint, D: TopLevelDecoder>(_ endpoint: E, decoder: D) async throws -> E.Response where D.Input == Data {
        let request = try requestBuilder.makeRequest(endpoint)
        let (data, response) = try await session.data(for: request)
        try APIError.throwIfHTTPError(response: response, data: data)
        return try decoder.decode(E.Response.self, from: data)
    }
}
