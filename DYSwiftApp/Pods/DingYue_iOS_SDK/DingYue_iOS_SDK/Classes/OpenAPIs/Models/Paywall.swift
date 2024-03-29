//
// Paywall.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** an object describing the purchase page configuration */
public struct Paywall: Codable, JSONEncodable, Hashable {

    /** name */
    public var name: String
    /** paywall version number */
    public var version: Double
    public var subscriptions: [PaywallSubscriptions]
    public var downloadUrl: String
    public var previewUrl: String?
    public var customize: Bool
    public var configurations: [PaywallConfiguration]?

    public init(name: String, version: Double, subscriptions: [PaywallSubscriptions], downloadUrl: String, previewUrl: String? = nil, customize: Bool, configurations: [PaywallConfiguration]? = nil) {
        self.name = name
        self.version = version
        self.subscriptions = subscriptions
        self.downloadUrl = downloadUrl
        self.previewUrl = previewUrl
        self.customize = customize
        self.configurations = configurations
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case version
        case subscriptions
        case downloadUrl
        case previewUrl
        case customize
        case configurations
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(version, forKey: .version)
        try container.encode(subscriptions, forKey: .subscriptions)
        try container.encode(downloadUrl, forKey: .downloadUrl)
        try container.encodeIfPresent(previewUrl, forKey: .previewUrl)
        try container.encode(customize, forKey: .customize)
        try container.encode(configurations, forKey: .configurations)
    }
}

