import Foundation

public enum APIError: Error, LocalizedError {
    case invalidRequest(String)
    case transport(URLError)
    case http(status: Int, message: String?, data: Data?)
    case decoding(DecodingError)
    case unknown(Error)

    public var errorDescription: String? {
        switch self {
        case .invalidRequest(let s): return "Invalid request: \(s)"
        case .transport(let e): return "Network error: \(e.localizedDescription)"
        case .http(let status, let message, _): return "HTTP \(status): \(message ?? "No message")"
        case .decoding(let e): return "Decoding error: \(e.localizedDescription)"
        case .unknown(let e): return "Unknown error: \(e.localizedDescription)"
        }
    }

    static func throwIfHTTPError(response: URLResponse?, data: Data?) throws {
        guard let http = response as? HTTPURLResponse else { return }
        guard !(200...299).contains(http.statusCode) else { return }
        let message = data.flatMap { String(data: $0, encoding: .utf8) }
        throw APIError.http(status: http.statusCode, message: message, data: data)
    }
}

extension APIError: Equatable {
    public static func == (lhs: APIError, rhs: APIError) -> Bool {
        switch (lhs, rhs) {
        case let (.invalidRequest(a), .invalidRequest(b)):
            return a == b

        case let (.transport(a), .transport(b)):
            // URLError is Equatable (by code)
            return a.code == b.code

        case let (.http(s1, m1, _), .http(s2, m2, _)):
            // ignore Data? when comparing
            return s1 == s2 && m1 == m2

        case (.decoding, .decoding):
            // DecodingError isn’t Equatable; compare descriptions
            return lhs.localizedDescription == rhs.localizedDescription

        case let (.unknown(e1), .unknown(e2)):
            // Compare NSError domain/code if possible
            let n1 = e1 as NSError
            let n2 = e2 as NSError
            return n1.domain == n2.domain && n1.code == n2.code

        default:
            return false
        }
    }
}
