import XCTest
@testable import PineamiteNetworking
import PineamiteNetworkingMocks

final class PineamiteNetworkingTests: XCTestCase {

    func testMockClientReturnsDTOs() async throws {
        let mock = MockHTTPClient(latency: .none)
        mock.register(.get, "/v1/entries", responseJSONNamed: "entries_success")

        struct GetEntries: Endpoint {
            typealias Response = [EntryDTO]
            var method: HTTPMethod { .get }
            var path: String { "/v1/entries" }
        }

        let decoder = DecoderFactory.makeJSONDecoder()
        let entries: [EntryDTO] = try await mock.send(GetEntries(), decoder: decoder)
        XCTAssertEqual(entries.count, 2)
        XCTAssertEqual(entries.first?.driverName, "Jane Doe")
    }
}
