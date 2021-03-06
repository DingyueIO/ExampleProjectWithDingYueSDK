//
//  UserProperties.swift
//  DingYueMobileSDK
//
//  Created by 靖核 on 2022/2/10.
//
#if canImport(AdSupport)
import AdSupport
#endif

#if canImport(AppTrackingTransparency)
import AppTrackingTransparency
#endif

#if canImport(AdServices)
import AdServices
#endif

#if canImport(iAd)
import iAd
#endif

#if canImport(FCUUID)
import FCUUID
#endif

import Foundation
#if canImport(UIKit)
import UIKit
#elseif os(macOS)
import AppKit
#endif

public typealias Parameters = [String: Any]

class UserProperties {
    private(set) static var staticUuid = UUID().stringValue
    class func resetStaticUuid() {
        staticUuid = UUID().stringValue
    }

    static var uuid: String {
        return UUID().stringValue//will have different value for every new instance
    }
    static var requestUUID: String {
        return FCUUID.uuidForDevice() ?? ""
    }
    static var userAgent: String {
        return "user-agent"
    }
    static var appID: String = ""
    static var idfa: String? {
        // Get and return IDFA
        if DYMobileSDK.idfaCollectionDisabled == false, #available(iOS 9.0, macOS 10.14, *) {
            if #available(iOS 14, *) {
                if ATTrackingManager.trackingAuthorizationStatus == .authorized {
                    return ASIdentifierManager.shared().advertisingIdentifier.uuidString
                } else {
                    return nil
                }
            } else {
                if ASIdentifierManager.shared().isAdvertisingTrackingEnabled {
                    return ASIdentifierManager.shared().advertisingIdentifier.uuidString
                }else{
                    return nil
                }
            }
        } else {
            return nil
        }
    }
    static var idfv: String?  {
        guard let identifierForVendor = UIDevice.current.identifierForVendor?.uuidString else {
            return nil
        }
        return identifierForVendor
    }

    static var connection: UniqueUserObject.Connection = .unknown

    static var sdkVersion: String {
        return DYMConstants.Versions.SDKVersion
    }

    static var sdkVersionBuild: Int {
        return DYMConstants.Versions.SDKBuild
    }

    static var appBuild: String? {
        return Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    }

    static var appVersion: String? {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    static var pallwallPath:String?{
        return createPaywallDir()
    }
    class func createPaywallDir() -> String? {
        let DocumentPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let filePath = DocumentPaths[0].appending("/PayWalWeb")
        var isDir : ObjCBool = false
        if FileManager.default.fileExists(atPath: filePath, isDirectory: &isDir) {
            if isDir.boolValue{
                DYMLogManager.logMessage("paywall directory already exists")
                return filePath
            }else{
                return nil
            }
        }else{
            do {
                try FileManager.default.createDirectory(atPath: filePath, withIntermediateDirectories: false, attributes: nil)
                return filePath
            } catch {
                DYMLogManager.logError(error)
                return nil
            }
        }
    }
    static var device: String {
        #if os(macOS) || targetEnvironment(macCatalyst)
        let matchingDict = IOServiceMatching("IOPlatformExpertDevice")
        let service = IOServiceGetMatchingService(kIOMasterPortDefault, matchingDict)
        defer { IOObjectRelease(service) }

        if let modelData = IORegistryEntryCreateCFProperty(service,
                                                           "model" as CFString,
                                                           kCFAllocatorDefault, 0).takeRetainedValue() as? Data,
           let cString = modelData.withUnsafeBytes({ $0.baseAddress?.assumingMemoryBound(to: UInt8.self) }) {
            return String(cString: cString)
        } else {
            return "unknown device"
        }
        #else
        return UIDevice.modelName
        #endif
    }

    static var locale: String {
        return Locale.preferredLanguages.first ?? Locale.current.identifier
    }

    static var OS: String {
        #if os(macOS) || targetEnvironment(macCatalyst)
        return "macOS \(ProcessInfo().operatingSystemVersionString)"
        #else
        return "\(UIDevice.current.systemName) \(UIDevice.current.systemVersion)"
        #endif
    }

    static var platform: String {
        #if os(macOS) || targetEnvironment(macCatalyst)
        return "macOS"
        #else
        return UIDevice.current.systemName
        #endif
    }

    static var timezone: String {
        return TimeZone.current.identifier
    }

//    static var deviceIdentifier: String? {
//        #if os(macOS) || targetEnvironment(macCatalyst)
//        let matchingDict = IOServiceMatching("IOPlatformExpertDevice")
//        let platformExpert = IOServiceGetMatchingService(kIOMasterPortDefault, matchingDict)
//        defer { IOObjectRelease(platformExpert) }
//
//        guard platformExpert != 0 else { return nil }
//        return IORegistryEntryCreateCFProperty(platformExpert,
//                                               kIOPlatformUUIDKey as CFString,
//                                               kCFAllocatorDefault, 0).takeRetainedValue() as? String
//        #else
//        return UIDevice.current.identifierForVendor?.uuidString
//        #endif
//    }

    static var deviceToken: String? {
        guard let token = DYMobileSDK.apnsTokenString else {
            return nil
        }
        return token
    }


    #if os(iOS)
    class func appleSearchAdsAttribution(completion: @escaping (Parameters?, Error?) -> Void) {
        ADClient.shared().requestAttributionDetails { (attribution, error) in
            if let attribution = attribution {
                completion(attribution, error)
            } else {
                modernAppleSearchAdsAttribution(completion: completion)
            }
        }
    }

    private class func modernAppleSearchAdsAttribution(completion: @escaping (Parameters?, Error?) -> Void) {
        if #available(iOS 14.3, *) {
            do {
                let attributionToken = try AAAttribution.attributionToken()
                let request = NSMutableURLRequest(url: URL(string:"https://api-adservices.apple.com/api/v1/")!)
                request.httpMethod = "POST"
                request.setValue("text/plain", forHTTPHeaderField: "Content-Type")
                request.httpBody = Data(attributionToken.utf8)
                let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, _, error) in
                    guard let data = data else {
                        completion(nil, error)
                        return
                    }
                    do {
                        let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Parameters
                        completion(result, nil)
                    } catch {
                        completion(nil, error)
                    }
                }
                task.resume()
            } catch  {
                completion(nil, error)
            }
        } else {
            completion(nil, nil)
        }
    }
    #endif
}
