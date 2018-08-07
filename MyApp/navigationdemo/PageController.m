//
//  PageController.m
//  MyApp
//
//  Created by huangjinxin on 2018/8/6.
//  Copyright © 2018年 ___FUdLLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PageController.h"
@interface PageController(){
    float scrollerWidth;
    float scrollerHeight;
}
@end

@implementation PageController

- (void)viewDidLoad{
    [super viewDidLoad];
    scrollerWidth = self.view.frame.size.width;
    scrollerHeight = self.view.frame.size.height;
    self.mScroller.contentSize = CGSizeMake(scrollerWidth * 3, scrollerHeight);
    self.mScroller.frame = self.view.frame;
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"NavigationDemo" bundle:nil];
    UIViewController *p1 = [sb instantiateViewControllerWithIdentifier:@"P1"];
    self.page1 = p1.view;
    self.page1.frame = CGRectMake(0.0f, 0.0f, scrollerWidth, scrollerHeight);
    
    UIViewController *p2 = [sb instantiateViewControllerWithIdentifier:@"P2"];
    self.page2 = p2.view;
    self.page2.frame = CGRectMake(scrollerWidth, 0.0f, scrollerWidth, scrollerHeight);
    
    UIViewController *p3 = [sb instantiateViewControllerWithIdentifier:@"P3"];
    self.page3 = p3.view;
    self.page3.frame = CGRectMake(2*scrollerWidth, 0.0f,scrollerWidth, scrollerHeight);
    
    self.mScroller.delegate = self;
    
    [self.mScroller addSubview:self.page1];
    [self.mScroller addSubview:self.page2];
    [self.mScroller addSubview:self.page3];

}

- (IBAction)pageChange:(id)sender {
    [UIView animateWithDuration:0.3f animations:^{
        NSInteger whichPage = self.mPageControl.currentPage;
        self.mScroller.contentOffset = CGPointMake(scrollerWidth * whichPage, 0.0f); }];
}

- (void)scrollViewDidScroll:(UIScrollView *)aScrollView{
    CGPoint offset = aScrollView.contentOffset;
    self.mPageControl.currentPage = offset.x / scrollerWidth;
}
@end
