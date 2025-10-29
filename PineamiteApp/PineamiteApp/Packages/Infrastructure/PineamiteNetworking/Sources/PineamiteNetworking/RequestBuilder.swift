import Foundation

public struct RequestBuilder {
    public let baseURL: URL

    public init(baseURL: URL) { self.baseURL = baseURL }

    public func makeRequest<E: Endpoint>(_ endpoint: E) throws -> URLRequest {
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)
        let combinedPath = baseURL.path.appending(endpoint.path)
        components?.path = combinedPath
        components?.queryItems = endpoint.query.isEmpty ? nil : endpoint.query

        guard let url = components?.url else {
            throw APIError.invalidRequest("Invalid URL components for \(endpoint.path)")
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.httpBody = try endpoint.body()
        endpoint.headers.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }
        return request
    }
}
