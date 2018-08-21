//
//  TreeSecondVC
//  MyApp
//
//  Created by huangjinxin on 2018/8/14.
//  Copyright © 2018年 ___FUdLLUSERNAME___. All rights reserved.
//

#ifndef TreeSecondVC_h
#define TreeSecondVC_h
#import <UIKit/UIKit.h>

@interface TreeSecondVC : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSArray *listData;
@property (weak, nonatomic) IBOutlet UITableView *mTableView;
@end

#endif /* TreeSecondVC */
