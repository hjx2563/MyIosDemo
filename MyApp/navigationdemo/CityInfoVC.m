//
//  CityInfoVC.m
//  MyApp
//
//  Created by huangjinxin on 2018/8/15.
//  Copyright © 2018年 ___FUdLLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CityInfoVC.h"

@interface CityInfoVC(){
    WKWebView *mWebView;
}
@end

@implementation CityInfoVC

- (void)viewDidLoad{
    [super viewDidLoad];
    NSLog(@"详情页，URL是%@", self.url);
    mWebView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    [mWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    
    [self.view addSubview:mWebView];
    
}


@end
