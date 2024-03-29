//
//  AppDelegate.swift
//  DYSwiftApp
//
//  Created by hua on 2022/7/6.
//

import UIKit
import AdSupport
import AppTrackingTransparency
import DingYue_iOS_SDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //DingYueSDK 激活
        DYMobileSDK.activate { results, error in
            print(results)
        }
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        requestIDFA()
    }
}
extension AppDelegate {
    func requestIDFA() {
        //IDFA权限
        if #available(iOS 14, *) {
            let state = ATTrackingManager.trackingAuthorizationStatus
            if state == .notDetermined {
                ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
                    var idfa = ""
                    if status == .authorized {
                        idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString
                    }
                    DYMobileSDK.reportIdfa(idfa: idfa)
                })
            }else if state == .authorized {
                let idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString
                DYMobileSDK.reportIdfa(idfa: idfa)
            }
        } else {
            DYMobileSDK.reportIdfa(idfa: ASIdentifierManager.shared().advertisingIdentifier.uuidString)
        }
    }
}
