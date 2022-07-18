//
// ReceiptVerifyMobileResponse.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ReceiptVerifyMobileResponse:Codable, JSONEncodable, Hashable{

    public enum Status: String, Codable, CaseIterable {
        case ok = "ok"
        case fail = "fail"
    }
    /** ok indicates verify success and you should refer to expires_at key for expiration date */
    public var status: Status
    /** if present, this will be error message explained why verify fails */
    public var errmsg: String?
    public var receipts: [SubscribedObject]?

    public init(status: Status, errmsg: String? = nil, receipts: [SubscribedObject]? = nil) {
        self.status = status
        self.errmsg = errmsg
        self.receipts = receipts
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case status
        case errmsg
        case receipts
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(status, forKey: .status)
        try container.encodeIfPresent(errmsg, forKey: .errmsg)
        try container.encodeIfPresent(receipts, forKey: .receipts)
    }
}
