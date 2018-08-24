//
//  ViewController.m
//  MyApp
//
//  Created by huangjinxin on 2018/7/12.
//  Copyright © 2018年 ___FUdLLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "WidgetListViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)openWidgetList:(id)sender {
    NSLog(@"进入控件列表页");
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"TableviewDemoStoryboard" bundle:nil];
    
    WidgetListViewController *vc = [story instantiateViewControllerWithIdentifier:@"TableViewVC"];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (IBAction)openNavigation:(id)sender {
    NSLog(@"进入试图控制器页");
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"NavigationDemo" bundle:nil];
    
    WidgetListViewController *vc = [story instantiateViewControllerWithIdentifier:@"NavigationDemo"];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)showLocalData:(id)sender {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"LocalData" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"NoteDAO"];
    
    [self.navigationController pushViewController:vc animated:YES];
}


@end
