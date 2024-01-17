//
//  AppDelegate.m
//  DYObjectiveCApp
//
//  Created by hua on 2022/7/6.
//

#import "AppDelegate.h"
#import <AppTrackingTransparency/AppTrackingTransparency.h>
#import <AdSupport/ASIdentifierManager.h>
@import DingYue_iOS_SDK;


@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //激活DingYue SDK
    [DYMobileSDK activateWithCompletion:^(NSDictionary<NSString *,id> * results, NSError * error) {
        if (error == nil) {
//            bool isUseNativePaywall = results[@"isUseNativePaywall"];
//            NSString *nativePaywallId = results[@"nativePaywallId"];
//
//            //当要用本地内购页时需要提前设置本地内购页路径
//            if (isUseNativePaywall && nativePaywallId && ![nativePaywallId isEqual:@""]) {
//                //本地内购页要以 nativePaywallId 为包名
//                NSString *nativePaywallPackage = results[@"nativePaywallId"];
//                NSString *nativePaywallPath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@".html" inDirectory:nativePaywallPackage];
//                NSString *basePath = [NSString stringWithFormat:@"%@%@",[[NSBundle mainBundle] bundlePath],nativePaywallPackage];
//                [DYMobileSDK loadNativePaywallWithPaywallFullPath:nativePaywallPath basePath:basePath];
//            }


            if (results) {
                NSLog(@"%@", results);
                //网页自定义开关
                NSArray<SwitchItem *> *switchs = results[@"switchs"];
                //购买过的有效产品
                NSArray<NSDictionary<NSString *,id>*> *subscribedOjects = results[@"subscribedOjects"];
                //是否使用本地内购页
                BOOL isUseNativePaywall = results[@"isUseNativePaywall"];
                if (isUseNativePaywall == YES) {
                    //本地内购页ID（内购页包名）
                    NSString *nativePaywallId = results[@"nativePaywallId"];
                    //使用本地内购页的话，需要工程师提前通过‘[DYMobileSDK loadNativePaywallWithPaywallFullPath: basePath:]’方法设置本地内购页Path
                }
            }
        }
    }];
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [self requestIDFA];
}

- (void)requestIDFA{
    if (@available(iOS 14.0, *)) {
        ATTrackingManagerAuthorizationStatus states = [ATTrackingManager trackingAuthorizationStatus];
        if (states == ATTrackingManagerAuthorizationStatusNotDetermined) {
            [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
                if (status == ATTrackingManagerAuthorizationStatusAuthorized) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (status == ATTrackingManagerAuthorizationStatusAuthorized) {
                            NSString *idfa = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
                            [DYMobileSDK reportIdfaWithIdfa:idfa];
                        }
                    });
                }
            }];
        } else if (states == ATTrackingManagerAuthorizationStatusAuthorized) {
            NSString *idfa = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
            [DYMobileSDK reportIdfaWithIdfa:idfa];
        }
    } else {
        if ([[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled]) {
            NSString *idfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
            [DYMobileSDK reportIdfaWithIdfa:idfa];
        }
    }
}

@end
