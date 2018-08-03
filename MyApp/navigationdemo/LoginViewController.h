//
//  LoginViewController.h
//  MyApp
//
//  Created by huangjinxin on 2018/8/2.
//  Copyright © 2018年 ___FUdLLUSERNAME___. All rights reserved.
//

#ifndef LoginViewController_h
#define LoginViewController_h

#import <UIKit/UIKit.h>
#import "RegisterViewController.h"
@interface LoginViewController : UIViewController<CallBackDelegete>
- (IBAction)doRegister:(id)sender;
@end

#endif /* LoginViewController_h */
