//
//  LabelAndButtonVC.h
//  MyApp
//
//  Created by huangjinxin on 2018/7/13.
//  Copyright © 2018年 ___FUdLLUSERNAME___. All rights reserved.
//

#ifndef LabelAndButtonVC_h
#define LabelAndButtonVC_h

#import <UIKit/UIKit.h>
@interface LabelAndButtonVC :UIViewController
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
- (IBAction)changeLabelTxt:(id)sender;
@end


#endif /* LabelAndButtonVC_h */
