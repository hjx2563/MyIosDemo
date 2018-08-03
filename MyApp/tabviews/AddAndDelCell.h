//
//  AddAndDelCell.h
//  MyApp
//
//  Created by huangjinxin on 2018/7/30.
//  Copyright © 2018年 ___FUdLLUSERNAME___. All rights reserved.
//

#ifndef AddAndDelCell_h
#define AddAndDelCell_h

#import <UIKit/UIKit.h>
@interface AddAndDelCell : UIViewController<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITableView *mTableView;
@property (strong, nonatomic) IBOutlet UITextField *mTextField;

@property (weak, nonatomic) IBOutlet UINavigationItem *mNavgationItem;

@property(strong, nonatomic) NSMutableArray *listData;

@end

#endif /* AddAndDelCell_h */
