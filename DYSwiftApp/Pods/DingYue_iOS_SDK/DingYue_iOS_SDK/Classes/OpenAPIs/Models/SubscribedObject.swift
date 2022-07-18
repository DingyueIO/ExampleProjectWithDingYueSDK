//
// SubscribedObject.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct SubscribedObject: Codable, JSONEncodable, Hashable {

    /** the status of the operation */
    public var platformProductId: String
    public var originalTransactionId: String?
    public var expiresAt: Int64?

    public init(platformProductId: String, originalTransactionId: String? = nil, expiresAt: Int64? = nil) {
        self.platformProductId = platformProductId
        self.originalTransactionId = originalTransactionId
        self.expiresAt = expiresAt
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case platformProductId
        case originalTransactionId
        case expiresAt
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(platformProductId, forKey: .platformProductId)
        try container.encodeIfPresent(originalTransactionId, forKey: .originalTransactionId)
        try container.encodeIfPresent(expiresAt, forKey: .expiresAt)
    }
}
