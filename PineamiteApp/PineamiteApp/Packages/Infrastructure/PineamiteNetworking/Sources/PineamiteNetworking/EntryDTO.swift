import Foundation

public struct EntryDTO: Codable, DomainMappable, Equatable {
    public let id: Int
    public let driverName: String
    public let carClass: String

    public init(id: Int, driverName: String, carClass: String) {
        self.id = id
        self.driverName = driverName
        self.carClass = carClass
    }

    public struct DomainModel: Equatable {
        public let id: Int
        public let driver: String
        public let carClass: String
        public init(id: Int, driver: String, carClass: String) {
            self.id = id; self.driver = driver; self.carClass = carClass
        }
    }

    public var toDomain: DomainModel {
        .init(id: id, driver: driverName, carClass: carClass)
    }
}
