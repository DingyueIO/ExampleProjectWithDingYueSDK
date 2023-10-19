//
//  PTWebViewController.m
//  PhotoTranslate
//
//  Created by GM on 2020/7/24.
//  Copyright © 2020 GM. All rights reserved.
//

#import "PTWebViewController.h"

@interface PTWebViewController ()


@end

@implementation PTWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 进度条
//    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
//    [self.view addSubview:self.myProgressView];

    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.myProgressView.frame), self.view.frame.size.width, self.view.frame.size.height - CGRectGetMaxY(self.myProgressView.frame))];
    [self.view addSubview:self.webView];

    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:self.url]];
    [self.webView loadRequest:request];
    
}
//// 计算wkWebView进度条
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
//    if ([keyPath isEqualToString:@"estimatedProgress"]) {
//        CGFloat newprogress = [[change objectForKey:NSKeyValueChangeNewKey] doubleValue];
//        self.myProgressView.alpha = 1.0f;
//        [self.myProgressView setProgress:newprogress animated:YES];
//        if (newprogress >= 1.0f) {
//            [UIView animateWithDuration:0.3f
//                                  delay:0.3f
//                                options:UIViewAnimationOptionCurveEaseOut
//                             animations:^{
//                                 self.myProgressView.alpha = 0.0f;
//                             }
//                             completion:^(BOOL finished) {
//                                 [self.myProgressView setProgress:0 animated:NO];
//                             }];
//        }
//        
//    } else {
//        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
//    }
//}
//
//#pragma mark - getter and setter
//- (UIProgressView *)myProgressView{
//    if (_myProgressView == nil) {
//        _myProgressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 1)];
//        _myProgressView.tintColor = [UIColor blueColor];
//        _myProgressView.trackTintColor = [UIColor whiteColor];
//    }
//    
//    return _myProgressView;
//}

@end
