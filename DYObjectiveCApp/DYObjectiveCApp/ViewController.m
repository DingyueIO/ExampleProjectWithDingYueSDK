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
}
- (IBAction)goPurchaseAction:(id)sender {
    //使用DingYue内购页
    [DYMobileSDK showVisualPaywallWithProducts:nil rootController:self completion:^(NSString * recipt, NSArray<NSDictionary<NSString *,id> *> * subs, DYMError * error) {
        if (error == nil) {
            //购买成功
            NSLog(@"(DingYueSDK): 购买成功");
            NSLog(@"(DingYueSDK): 购买收据：%@",recipt);
            NSLog(@"(DingYueSDK): 购买产品信息：%@",subs);
        }
    }];
}

#pragma mark - DYMPayWallActionDelegate
//实现隐私政策和使用协议action
-(void)clickTermsActionWithBaseViewController:(UIViewController *)baseViewController {
    PTWebViewController *vc = [[PTWebViewController alloc] init];
    vc.url = @"https://www.caretiveapp.com/tou/1543367096/";
    vc.title = @"Terms of Service";
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [baseViewController presentViewController:nav animated:YES completion:nil];
}
-(void)clickPrivacyActionWithBaseViewController:(UIViewController *)baseViewController {
    PTWebViewController *vc = [[PTWebViewController alloc] init];
    vc.url = @"https://www.caretiveapp.com/pp/1543367096/";
    vc.title = @"Privacy Policy";
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [baseViewController presentViewController:nav animated:YES completion:nil];
}

@end
