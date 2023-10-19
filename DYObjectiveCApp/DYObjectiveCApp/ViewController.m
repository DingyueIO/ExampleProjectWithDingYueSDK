//
//  ViewController.m
//  DYObjectiveCApp
//
//  Created by hua on 2022/7/6.
//

#import "ViewController.h"
#import "PTWebViewController.h"
@import DingYue_iOS_SDK;

@interface ViewController ()<DYMPayWallActionDelegate>
@property (weak, nonatomic) IBOutlet UIButton *goPurchaseButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
}
- (IBAction)goPurchaseAction:(id)sender {
    [DYMobileSDK trackWithEvent:@"evenName" extra:nil user:nil];

    //使用DingYue内购页
    Subscription *defaultProduct = [[Subscription alloc] initWithType:@"SUBSCRIPTION" name:@"WEEK" platformProductId:@"testWeek" subscriptionDescription:@"test" period:@"week" price:@"7.99" currencyCode:@"USD" countryCode:@"US"];
    [DYMobileSDK showVisualPaywallWithProducts:@[defaultProduct] rootController:self extras:@{} completion:^(NSString * receipt, NSArray<NSDictionary<NSString *,id> *> * purchasedInfo, DYMError * error) {
            
    }];
}

#pragma mark - DYMPayWallActionDelegate
//实现隐私政策和使用协议action
-(void)clickTermsActionWithBaseViewController:(UIViewController *)baseViewController {
    PTWebViewController *vc = [[PTWebViewController alloc] init];
    vc.url = @"https://www.caretiveapp.com/tou/XXXXX/";
    vc.title = @"Terms of Service";
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [baseViewController presentViewController:nav animated:YES completion:nil];
}
-(void)clickPrivacyActionWithBaseViewController:(UIViewController *)baseViewController {
    PTWebViewController *vc = [[PTWebViewController alloc] init];
    vc.url = @"https://www.caretiveapp.com/pp/XXXXX/";
    vc.title = @"Privacy Policy";
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [baseViewController presentViewController:nav animated:YES completion:nil];
}

- (void)clickCloseButtonWithBaseViewController:(UIViewController *)baseViewController {
    NSLog(@"点击了内购页上的关闭按钮");
}
- (void)payWallDidAppearWithBaseViewController:(UIViewController *)baseViewController {
    NSLog(@"订阅内购页显示");
}
- (void)payWallDidDisappearWithBaseViewController:(UIViewController *)baseViewController {
    NSLog(@"订阅内购页关闭");
}
@end
