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
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"WidgetStoryboard" bundle:nil];
    
    WidgetListViewController *vc = [story instantiateViewControllerWithIdentifier:@"widgetVC"];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end
