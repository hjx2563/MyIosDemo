//
//  TableViewCustomCellVC.h
//  MyApp
//
//  Created by huangjinxin on 2018/7/19.
//  Copyright © 2018年 ___FUdLLUSERNAME___. All rights reserved.
//

#ifndef TableViewCustomCellVC_h
#define TableViewCustomCellVC_h

#import <UIKit/UIKit.h>
@interface TableViewCustomCellVC : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *mImageView;
@end

#endif /* TableViewCustomCellVC_h */
