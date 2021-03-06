//
// FirstReceiptVerifyPostObjectAllOf.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct FirstReceiptVerifyPostObjectAllOf: Codable, JSONEncodable, Hashable {

    /** which subscription generates this receipt */
    public var platformProductId: String
    public var price: String
    public var currencyCode: String
    public var countryCode: String

    public init(platformProductId: String, price: String, currencyCode: String, countryCode: String) {
        self.platformProductId = platformProductId
        self.price = price
        self.currencyCode = currencyCode
        self.countryCode = countryCode
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case platformProductId
        case price
        case currencyCode
        case countryCode
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(platformProductId, forKey: .platformProductId)
        try container.encode(price, forKey: .price)
        try container.encode(currencyCode, forKey: .currencyCode)
        try container.encode(countryCode, forKey: .countryCode)
    }
}

