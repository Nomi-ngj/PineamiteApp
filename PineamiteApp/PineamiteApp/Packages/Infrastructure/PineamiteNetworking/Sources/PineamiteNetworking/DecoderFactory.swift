import Foundation

public enum DecoderFactory {
    public static func makeJSONDecoder(dateStrategy: JSONDecoder.DateDecodingStrategy = .iso8601,
                                       keyStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateStrategy
        decoder.keyDecodingStrategy = keyStrategy
        return decoder
    }

    public static func makeSnakeCaseJSONDecoder() -> JSONDecoder {
        makeJSONDecoder(keyStrategy: .convertFromSnakeCase)
    }
}
