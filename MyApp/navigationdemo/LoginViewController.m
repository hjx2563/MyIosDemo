//
//  LoginViewController.m
//  MyApp
//
//  Created by huangjinxin on 2018/8/2.
//  Copyright © 2018年 ___FUdLLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginViewController.h"

@interface LoginViewController()
@end

@implementation LoginViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    NSLog(@"进入登录页面");
}
- (IBAction)doRegister:(id)sender {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"NavigationDemo" bundle:nil];
    RegisterViewController *rvc = [sb instantiateViewControllerWithIdentifier:@"registervc"];
    rvc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    rvc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    rvc.delegate = self;
    [self presentViewController:rvc animated:YES completion:nil];
}

- (void)callback:(NSString *)name password:(NSString *)password{
    NSLog(@"姓名是：%@, 密码居然明文:%@", name, password);
}
@end
