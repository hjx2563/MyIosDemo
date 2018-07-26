//
//  TableViewSearchVC.h
//  MyApp
//
//  Created by huangjinxin on 2018/7/23.
//  Copyright © 2018年 ___FUdLLUSERNAME___. All rights reserved.
//

#ifndef TableViewSearchVC_h
#define TableViewSearchVC_h

#import <UIKit/UIKit.h>

@interface TableViewSearchVC : UIViewController<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UITableView *mTableView;
@property (weak, nonatomic) IBOutlet UISearchBar *mSearchBar;

@property (nonatomic, retain) UISearchController *searchController;
@end

#endif /* TableViewSearchVC_h */
