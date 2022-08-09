//
// AppleSearchAdsAttribution.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Apple Search Ads attribution object for Apple Search Ads Attribution API */
public struct AppleSearchAdsAttribution: Codable, JSONEncodable, Hashable {

    public enum IadConversationType: String, Codable, CaseIterable {
        case newdownload = "newdownload"
        case redownload = "redownload"
    }
    public enum IadKeywordMatchtype: String, Codable, CaseIterable {
        case board = "BOARD"
        case exact = "EXACT"
        case searchMatch = "SEARCH_MATCH"
    }
    /** True if the user clicked an Apple Search Ads impression up to 30 days before app download */
    public var iadAttribution: String?
    /** The organization that owns the campaign of which the corresponding ad was part. */
    public var iadOrgName: String?
    /** The organization ID that owns the campaign of which the corresponding ad was part. */
    public var iadOrgId: String?
    /** The ID of the campaign of which the corresponding ad was part. */
    public var iadCampaignId: String?
    /** The name of the campaign of which the corresponding ad was part. */
    public var iadCampaignName: String?
    /** The date and time when the user clicked a corresponding ad. */
    public var iadClickDate: String?
    /** The date and time when the user first downloaded your app. When the value of iad-conversion-type is redownload, this string represents the original purchase date. The purchase may or may not have been associated with an Apple Search Ad. */
    public var iadPurchaseDate: String?
    /** The date and time when the user downloaded your app by clicking an Apple Search Ad. */
    public var iadConversationDate: String?
    /** The type of conversion will either be a newdownload or a redownload. A redownload is a download of an app by users who have previously installed your app. */
    public var iadConversationType: IadConversationType?
    /** The name of the ad group of which the corresponding ad was part. */
    public var iadAdgroupName: String?
    /** The ID of the ad group of which the corresponding ad was part. */
    public var iadAdgroupId: String?
    /** The country or region associated with the campaign that drove the install. */
    public var iadCountryOrRegion: String?
    /** The keyword that drove the ad impression that led to the corresponding ad click. */
    public var iadKeyword: String?
    /** The ID of the keyword that drove the ad impression. */
    public var iadKeywordId: String?
    /** The match type of the keyword that drove the ad impression. Values are Broad, Exact, or Search Match. */
    public var iadKeywordMatchtype: IadKeywordMatchtype?
    /** The ID of the Creative Set of which the corresponding ad was part. */
    public var iadCreativesetId: String?
    /** The name of the Creative Set of which the corresponding ad was part. */
    public var iadCreativesetName: String?

    public init(iadAttribution: String? = nil, iadOrgName: String? = nil, iadOrgId: String? = nil, iadCampaignId: String? = nil, iadCampaignName: String? = nil, iadClickDate: String? = nil, iadPurchaseDate: String? = nil, iadConversationDate: String? = nil, iadConversationType: IadConversationType? = nil, iadAdgroupName: String? = nil, iadAdgroupId: String? = nil, iadCountryOrRegion: String? = nil, iadKeyword: String? = nil, iadKeywordId: String? = nil, iadKeywordMatchtype: IadKeywordMatchtype? = nil, iadCreativesetId: String? = nil, iadCreativesetName: String? = nil) {
        self.iadAttribution = iadAttribution
        self.iadOrgName = iadOrgName
        self.iadOrgId = iadOrgId
        self.iadCampaignId = iadCampaignId
        self.iadCampaignName = iadCampaignName
        self.iadClickDate = iadClickDate
        self.iadPurchaseDate = iadPurchaseDate
        self.iadConversationDate = iadConversationDate
        self.iadConversationType = iadConversationType
        self.iadAdgroupName = iadAdgroupName
        self.iadAdgroupId = iadAdgroupId
        self.iadCountryOrRegion = iadCountryOrRegion
        self.iadKeyword = iadKeyword
        self.iadKeywordId = iadKeywordId
        self.iadKeywordMatchtype = iadKeywordMatchtype
        self.iadCreativesetId = iadCreativesetId
        self.iadCreativesetName = iadCreativesetName
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case iadAttribution = "iad-attribution"
        case iadOrgName = "iad-org-name"
        case iadOrgId = "iad-org-id"
        case iadCampaignId = "iad-campaign-id"
        case iadCampaignName = "iad-campaign-name"
        case iadClickDate = "iad-click-date"
        case iadPurchaseDate = "iad-purchase-date"
        case iadConversationDate = "iad-conversation-date"
        case iadConversationType = "iad-conversation-type"
        case iadAdgroupName = "iad-adgroup-name"
        case iadAdgroupId = "iad-adgroup-id"
        case iadCountryOrRegion = "iad-country-or-region"
        case iadKeyword = "iad-keyword"
        case iadKeywordId = "iad-keyword-id"
        case iadKeywordMatchtype = "iad-keyword-matchtype"
        case iadCreativesetId = "iad-creativeset-id"
        case iadCreativesetName = "iad-creativeset-name"
    }

    // Encodable protocol methods
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(iadAttribution, forKey: .iadAttribution)
        try container.encodeIfPresent(iadOrgName, forKey: .iadOrgName)
        try container.encodeIfPresent(iadOrgId, forKey: .iadOrgId)
        try container.encodeIfPresent(iadCampaignId, forKey: .iadCampaignId)
        try container.encodeIfPresent(iadCampaignName, forKey: .iadCampaignName)
        try container.encodeIfPresent(iadClickDate, forKey: .iadClickDate)
        try container.encodeIfPresent(iadPurchaseDate, forKey: .iadPurchaseDate)
        try container.encodeIfPresent(iadConversationDate, forKey: .iadConversationDate)
        try container.encodeIfPresent(iadConversationType, forKey: .iadConversationType)
        try container.encodeIfPresent(iadAdgroupName, forKey: .iadAdgroupName)
        try container.encodeIfPresent(iadAdgroupId, forKey: .iadAdgroupId)
        try container.encodeIfPresent(iadCountryOrRegion, forKey: .iadCountryOrRegion)
        try container.encodeIfPresent(iadKeyword, forKey: .iadKeyword)
        try container.encodeIfPresent(iadKeywordId, forKey: .iadKeywordId)
        try container.encodeIfPresent(iadKeywordMatchtype, forKey: .iadKeywordMatchtype)
        try container.encodeIfPresent(iadCreativesetId, forKey: .iadCreativesetId)
        try container.encodeIfPresent(iadCreativesetName, forKey: .iadCreativesetName)
    }
}

