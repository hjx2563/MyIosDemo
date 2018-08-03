//
//  TableViewCustomCellVC.m
//  MyApp
//
//  Created by huangjinxin on 2018/7/19.
//  Copyright © 2018年 ___FUdLLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TableViewCustomCellVC.h"
#import "MyTableViewCell.h"

@interface TableViewCustomCellVC(){
    NSArray *listData;
}
@end

@implementation TableViewCustomCellVC
- (void)viewDidLoad{
    [super viewDidLoad];
    [self initData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"----------");
    return listData.count;
}

-(void) initData{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPatch = [bundle pathForResource:@"team" ofType:@"plist"];
    listData = [[NSArray alloc] initWithContentsOfFile:plistPatch];
    NSLog(@"%@", listData);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"=======================");
    static NSString *cellIdentifier = @"CellIdentifier";
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    NSInteger row = indexPath.row;
    NSDictionary *dic = [listData objectAtIndex:row];

    cell.cellLabel.text = [dic objectForKey:@"name"];
    NSLog(@"index是%ld, 值是%@", (long)row, [dic objectForKey:@"name"]);
    
    NSString *patch = [dic objectForKey:@"image"];
    patch = [patch stringByAppendingString:@".png"];
    NSLog(@"==========图片名字是：%@", patch);
    cell.cellImage.image = [UIImage imageNamed:patch];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *msg = [[listData objectAtIndex:[indexPath row]] objectForKey:@"name"];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:[@"点击的是" stringByAppendingString:msg] preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end


