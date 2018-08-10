//
//  PageNavigationVC.h
//  MyApp
//
//  Created by huangjinxin on 2018/8/9.
//  Copyright © 2018年 ___FUdLLUSERNAME___. All rights reserved.
//

#ifndef PageNavigationVC_h
#define PageNavigationVC_h
#import <UIKit/UIKit.h>

@interface PageNavigationVC : UIViewController <UIPageViewControllerDelegate, UIPageViewControllerDataSource>{
    int pageIndex;
}

@property(nonatomic, strong) UIPageViewController *uiPC;
@end

#endif /* PageNavigationVC_h */
