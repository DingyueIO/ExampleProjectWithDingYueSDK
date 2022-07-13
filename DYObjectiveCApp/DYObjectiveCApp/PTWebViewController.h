//
//  PTWebViewController.h
//  PhotoTranslate
//
//  Created by GM on 2020/7/24.
//  Copyright © 2020 GM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface PTWebViewController : UIViewController

@property (nonatomic, strong) NSString *url;
@property (strong, nonatomic) WKWebView *webView;
@property (nonatomic, strong) UIProgressView *myProgressView;// 进度条
@end

NS_ASSUME_NONNULL_END
