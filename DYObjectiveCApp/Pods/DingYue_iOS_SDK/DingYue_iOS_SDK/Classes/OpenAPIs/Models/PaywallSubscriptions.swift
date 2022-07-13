//
// PaywallSubscriptions.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct PaywallSubscriptions: Codable, JSONEncodable, Hashable {

    public var subscriptionId: String?
    public var subscription: Subscription?

    public init(subscriptionId: String? = nil, subscription: Subscription? = nil) {
        self.subscriptionId = subscriptionId
        self.subscription = subscription
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case subscriptionId
        case subscription
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(subscriptionId, forKey: .subscriptionId)
        try container.encodeIfPresent(subscription, forKey: .subscription)
    }
}

