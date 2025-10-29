import Foundation

public enum HTTPMethod: String {
    case get = "GET", post = "POST", put = "PUT", patch = "PATCH", delete = "DELETE"
}

/// A declarative description of an API endpoint.
public protocol Endpoint {
    associatedtype Response: Decodable
    var method: HTTPMethod { get }
    var path: String { get }               // e.g. "/v1/entries"
    var query: [URLQueryItem] { get }      // default []
    var headers: [String: String] { get }  // default [:]
    func body() throws -> Data?            // default nil
}

public extension Endpoint {
    var query: [URLQueryItem] { [] }
    var headers: [String: String] { [:] }
    func body() throws -> Data? { nil }
}
