//
//  LabelAndButtonVC.m
//  MyApp
//
//  Created by huangjinxin on 2018/7/13.
//  Copyright © 2018年 ___FUdLLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LabelAndButtonVC.h"

@interface LabelAndButtonVC()
@end

@implementation LabelAndButtonVC
- (IBAction)changeLabelTxt:(id)sender {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate *datenow = [NSDate date];
    NSString *labelTxt = [formatter stringFromDate:datenow];
    self.myLabel.text = labelTxt;
}
@end
