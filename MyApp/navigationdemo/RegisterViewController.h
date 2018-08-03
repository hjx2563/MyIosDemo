//
//  RegisterViewController.h
//  MyApp
//
//  Created by huangjinxin on 2018/8/2.
//  Copyright © 2018年 ___FUdLLUSERNAME___. All rights reserved.
//

#ifndef RegisterViewController_h
#define RegisterViewController_h

#import <UIKit/UIKit.h>

@protocol CallBackDelegete<NSObject>
@optional -(void) callback:(NSString*)name password:(NSString *)password;
@end

@interface RegisterViewController : UIViewController
- (IBAction)save:(id)sender;
- (IBAction)done:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *nameTextFileld;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (assign,nonatomic)id<CallBackDelegete> delegate;
@end

#endif /* RegisterViewController_h */
