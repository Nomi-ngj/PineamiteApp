

public protocol TopLevelDecoder {
    associatedtype Input
    func decode<T>(_ type: T.Type, from: Input) throws -> T where T : Decodable
}
