//
//  TableViewVC.h
//  MyApp
//
//  Created by huangjinxin on 2018/7/18.
//  Copyright © 2018年 ___FUdLLUSERNAME___. All rights reserved.
//

#ifndef TableViewVC_h
#define TableViewVC_h

#import <UIKit/UIKit.h>
#import "MyTableViewCell.h"

@interface TableViewVC : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *listData;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;

@end

#endif /* TableViewVC_h */
