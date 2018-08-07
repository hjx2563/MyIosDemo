//
//  LoginViewController.m
//  MyApp
//
//  Created by huangjinxin on 2018/8/2.
//  Copyright © 2018年 ___FUdLLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginViewController.h"

#import "StringUtils.h"

@interface LoginViewController(){
    NSString *mName;
    NSString *pwd;
}
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

- (IBAction)doLogin:(id)sender {
    NSString *nameInput = self.myNameTxt.text;
    NSString *pwdInput = self.myPwdTxt.text;
    if([StringUtils isBlankString:nameInput] || [StringUtils isBlankString:pwdInput]){
        NSLog(@"用户名或密码不能为空");
        [self alertMsg:@"提示" msg:@"用户名或密码不能为空"];
        return;
    }
    
    if([StringUtils isBlankString:mName] || [StringUtils isBlankString:pwd]){
        NSLog(@"没注册");
        [self alertMsg:@"提示" msg:@"你还没注册，点击注册"];
        return;
    }
    
    if(mName != nameInput || pwdInput != pwd){
        NSLog(@"用户名密码不对");
        [self alertMsg:@"提示" msg:@"用户名密码不对"];
        return;
    }
    
    NSLog(@"登录成功了，干了半天，还这德行，你啥也看不到");
     [self alertMsg:@"提示" msg:@"登录成功了，干了半天，还这德行，你啥也看不到"];
    
}

- (void)callback:(NSString *)name password:(NSString *)password{
    NSLog(@"姓名是：%@, 密码居然明文:%@", name, password);
    mName = name;
    pwd = password;
}

-(void)alertMsg:(NSString *)title msg:(NSString *)msg{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
