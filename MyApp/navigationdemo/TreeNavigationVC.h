//
//  TreeNavigationVC.h
//  MyApp
//
//  Created by huangjinxin on 2018/8/9.
//  Copyright © 2018年 ___FUdLLUSERNAME___. All rights reserved.
//

#ifndef TreeNavigationVC_h
#define TreeNavigationVC_h

#import <UIKit/UIKit.h>

@interface TreeNavigationVC : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSDictionary *dict;
@property (weak, nonatomic) IBOutlet UITableView *mTableview;
@end

#endif /* TreeNavigationVC_h */
