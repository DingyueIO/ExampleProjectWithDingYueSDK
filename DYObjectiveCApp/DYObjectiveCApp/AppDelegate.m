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
    //激活session report
    [DYMobileSDK activateWithCompletion:^(NSArray<SwitchItem *> * switchItems, NSArray<NSDictionary<NSString *,id> *> * results, NSError * error) {
        if (error == nil) {
            //激活成功
            NSLog(@"(DingYueSDK):激活成功");
            NSLog(@"(DingYueSDK): switchItems  %@",switchItems);
            NSLog(@"(DingYueSDK): subscribedProducts  %@",results);
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
