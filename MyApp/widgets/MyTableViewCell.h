//
//  MyTableView.h
//  MyApp
//
//  Created by huangjinxin on 2018/7/18.
//  Copyright © 2018年 ___FUdLLUSERNAME___. All rights reserved.
//

#ifndef MyTableViewCell_h
#define MyTableViewCell_h


#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cellImage;

@property (weak, nonatomic) IBOutlet UILabel *cellLabel;
@end

#endif /* MyTableView_h */
