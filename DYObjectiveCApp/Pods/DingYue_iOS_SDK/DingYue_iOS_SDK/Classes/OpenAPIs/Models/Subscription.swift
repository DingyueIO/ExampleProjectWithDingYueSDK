//
// Subscription.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** subscription metadata object */
@objcMembers public class Subscription:NSObject, Codable, JSONEncodable {

    public enum ModelType: String, Codable, CaseIterable {
        case subscription = "SUBSCRIPTION"
        case consumable = "CONSUMABLE"
        case oneTimePurchase = "ONE_TIME_PURCHASE"
        case nonRenewal = "NON_RENEWAL"
    }
    public enum Period: String, Codable, CaseIterable {
        case week = "WEEK"
        case month = "MONTH"
        case twoMonth = "TWO_MONTH"
        case quarter = "QUARTER"
        case halfYear = "HALF_YEAR"
        case year = "YEAR"
    }
    public var type: String
    /** the name of the subscription */
    public var name: String
    /** an unique string represents the subscription. usually assigned from platform vendors */
    public var platformProductId: String
    /** Subscription Group ID that this subscription belongs to. iOS only */
    public var appleSubscriptionGroupId: String?
    /** subscription description on the market */
    public var subscriptionDescription: String?
    /** the length of renew period of subscription */
    public var period: String?
    /** the price of the subscription for one period */
    public var price: String
    public var currencyCode: String
    public var countryCode: String
    public var priceTier: [SubscriptionPriceTier]?
    /** indicates if this subscription supports grace period */
    public var gracePeriod: Bool?
    /** subscription icon URL */
    public var icon: String?
    /** After updating the pricing, is the renewal price of the previous purchase updated? */
    public var renewPriceChange: Bool?

    public init(type: String, name: String, platformProductId: String, appleSubscriptionGroupId: String? = nil, description: String? = nil, period: String? = nil, price: String, currencyCode: String, countryCode: String, priceTier: [SubscriptionPriceTier]? = nil, gracePeriod: Bool? = nil, icon: String? = nil, renewPriceChange: Bool? = nil) {
        self.type = type
        self.name = name
        self.platformProductId = platformProductId
        self.appleSubscriptionGroupId = appleSubscriptionGroupId
        self.subscriptionDescription = description
        self.period = period
        self.price = price
        self.currencyCode = currencyCode
        self.countryCode = countryCode
        self.priceTier = priceTier
        self.gracePeriod = gracePeriod
        self.icon = icon
        self.renewPriceChange = renewPriceChange
    }

    public func initWith(type: String, name: String, platformProductId: String, subscriptionDescription: String? = nil, period: String? = nil, price: String, currencyCode: String, countryCode: String) -> Subscription {
        let sub = self
        sub.type = type
        sub.name = name
        sub.platformProductId = platformProductId
        sub.appleSubscriptionGroupId = nil
        sub.subscriptionDescription = subscriptionDescription
        sub.period = period
        sub.price = price
        sub.currencyCode = currencyCode
        sub.countryCode = countryCode
        sub.priceTier = nil
        sub.gracePeriod = nil
        sub.icon = nil
        sub.renewPriceChange = nil
        return sub
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case name
        case platformProductId
        case appleSubscriptionGroupId
        case subscriptionDescription
        case period
        case price
        case currencyCode
        case countryCode
        case priceTier
        case gracePeriod
        case icon
        case renewPriceChange
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(name, forKey: .name)
        try container.encode(platformProductId, forKey: .platformProductId)
        try container.encodeIfPresent(appleSubscriptionGroupId, forKey: .appleSubscriptionGroupId)
        try container.encodeIfPresent(subscriptionDescription, forKey: .subscriptionDescription)
        try container.encodeIfPresent(period, forKey: .period)
        try container.encode(price, forKey: .price)
        try container.encode(currencyCode, forKey: .currencyCode)
        try container.encode(countryCode, forKey: .countryCode)
        try container.encodeIfPresent(priceTier, forKey: .priceTier)
        try container.encodeIfPresent(gracePeriod, forKey: .gracePeriod)
        try container.encodeIfPresent(icon, forKey: .icon)
        try container.encodeIfPresent(renewPriceChange, forKey: .renewPriceChange)
    }
}

