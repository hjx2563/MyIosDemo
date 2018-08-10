//
//  PageNavigationVC.m
//  MyApp
//
//  Created by huangjinxin on 2018/8/9.
//  Copyright © 2018年 ___FUdLLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PageNavigationVC.h"

@interface PageNavigationVC(){
    NSInteger fWith;
    NSInteger fHeight;
}

@end


@implementation PageNavigationVC

- (void)viewDidLoad{
    [super viewDidLoad];
    fWith = self.view.frame.size.width;
    fHeight = self.view.frame.size.height;
    NSLog(@"fwith = %ld, @fheight = %ld", (long)fWith, (long)fHeight);
    
    self.uiPC = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.uiPC.dataSource = self;
    self.uiPC.delegate = self;
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"NavigationDemo" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"P1"];
    
    NSArray *arr = @[vc];
    [self.uiPC setViewControllers:arr direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil ];
    [self.view addSubview:self.uiPC.view];
    
    pageIndex = 0;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    pageIndex --;
    if(pageIndex < 0){
        pageIndex = 0;
        return nil;
    }
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"NavigationDemo" bundle:nil];
    NSString *identifier = [NSString stringWithFormat:@"P%d", pageIndex+1];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:identifier];
    return vc;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    pageIndex ++;
    if(pageIndex > 2){
        pageIndex = 2;
        return nil;
    }
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"NavigationDemo" bundle:nil];
    NSString *identifier = [NSString stringWithFormat:@"P%d", pageIndex+1];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:identifier];
    return vc;
}

- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation{
    self.uiPC.doubleSided = NO;
    return UIPageViewControllerSpineLocationMin;
}

@end
