//
//  PageController.h
//  MyApp
//
//  Created by huangjinxin on 2018/8/6.
//  Copyright © 2018年 ___FUdLLUSERNAME___. All rights reserved.
//

#ifndef PageController_h
#define PageController_h

#import <UIKit/UIKit.h>

@interface PageController : UIViewController<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIPageControl *mPageControl;
@property (weak, nonatomic) IBOutlet UIScrollView *mScroller;

@property (weak, nonatomic) UIView *page1;
@property (weak, nonatomic) UIView *page2;
@property (weak, nonatomic) UIView *page3;

- (IBAction)pageChange:(id)sender;
@end

#endif /* PageController_h */
