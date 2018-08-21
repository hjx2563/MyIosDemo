//
//  TreeSecondVC.m
//  MyApp
//
//  Created by huangjinxin on 2018/8/14.
//  Copyright © 2018年 ___FUdLLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TreeSecondVC.h"
#import "CityInfoVC.h"

@interface TreeSecondVC()
@end

@implementation TreeSecondVC

- (void)viewDidLoad{
    [super viewDidLoad];
    NSLog(@"进来？？数据是%@", self.listData);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.listData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"初始化列表");
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    NSString *label = [[self.listData objectAtIndex:[indexPath row]] objectForKey:@"name"];
    cell.textLabel.text = label;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *selectData =[self.listData objectAtIndex:[indexPath row]];

    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"NavigationDemo" bundle:nil];
    CityInfoVC *vc = [sb instantiateViewControllerWithIdentifier:@"CityInfoVC"];

    vc.title =[selectData objectForKey:@"name"];
    vc.url = [selectData objectForKey:@"url"];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
