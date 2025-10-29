# PineamiteNetworking

A lightweight, async/await-first networking layer for Swift apps.

**Includes**:
- `HTTPClient` protocol + `URLSessionHTTPClient` implementation
- `RequestBuilder` & `Endpoint` for composing requests
- `APIError` (+ decoding of backend errors)
- JSON `DecoderFactory` (ISO8601 + snake_case supported)
- DTOs + mappers pattern (no hard dependency on your Domain module)
- Mocks & fixtures for previews/tests

## Installation (Swift Package Manager)

In Xcode: **File → Add Package Dependencies…**  
Use the repository URL where you host this package (e.g. GitHub).

> For this demo bundle, you can unzip and `git init` it, then add the local path or push to GitHub.

## Usage

```swift
import PineamiteNetworking

struct GetEntriesEndpoint: Endpoint {
    typealias Response = [EntryDTO]

    var method: HTTPMethod { .get }
    var path: String { "/v1/entries" }
    var query: [URLQueryItem] { [] }
    var headers: [String: String] { [:] }
}

let client = URLSessionHTTPClient(baseURL: URL(string: "https://api.example.com")!)
let decoder = DecoderFactory.makeJSONDecoder()

let entriesDTO: [EntryDTO] = try await client.send(GetEntriesEndpoint(), decoder: decoder)
let entries = entriesDTO.map(\.toDomain)
```

### Mapping DTOs → Domain

```swift
public struct EntryDTO: Codable, DomainMappable {
    public let id: Int
    public let driverName: String
    public let carClass: String

    public struct DomainModel {
        public let id: Int
        public let driver: String
        public let carClass: String
    }

    public var toDomain: DomainModel {
        .init(id: id, driver: driverName, carClass: carClass)
    }
}
```

### Testing with Mocks

```swift
import PineamiteNetworkingMocks

let mock = MockHTTPClient(latency: .milliseconds(50))
mock.register(.get, "/v1/entries", responseJSONNamed: "entries_success")
let entries: [EntryDTO] = try await mock.send(GetEntriesEndpoint(), decoder: DecoderFactory.makeJSONDecoder())
```

## License

MIT
