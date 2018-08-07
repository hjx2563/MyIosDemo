//
//  RegisterViewController.m
//  MyApp
//
//  Created by huangjinxin on 2018/8/2.
//  Copyright © 2018年 ___FUdLLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RegisterViewController.h"
#import "StringUtils.h"

@interface RegisterViewController()
@end

@implementation RegisterViewController
- (IBAction)save:(id)sender {
    
    NSString *name =[self.nameTextFileld text];
    NSString *pwd =[self.pwdTextField text];
    
    NSLog(@"用户名是：%@，密码是%@", name, pwd);
    if([StringUtils isBlankString:name] || [StringUtils isBlankString:pwd]){
        NSLog(@"用户名或密码不能为空");
        [self alertMsg];
        return;
    } 
    
    if([self.delegate respondsToSelector:@selector(callback:password:)]){
        [self.delegate callback:name password:pwd];
    }
    
    [self dismissViewControllerAnimated:YES completion:self.saveInfo];
}

-(void) alertMsg{
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"提示" message:@"用户名或密码不能为空" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *aa = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [ac addAction:aa];
    [self presentViewController:ac animated:YES completion:nil];
}

- (IBAction)done:(id)sender {
    [self dismissViewControllerAnimated:YES completion:self.closeThisView];
}

-(void (^ __nullable)(void)) closeThisView{
    NSLog(@"RegisterViewController 退出");
    return nil;
}

-(void (^ __nullable)(void)) saveInfo{
    NSLog(@"保存退出");
    return nil;
}
@end
