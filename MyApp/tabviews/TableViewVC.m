//
//  TableViewVC.m
//  MyApp
//
//  Created by huangjinxin on 2018/7/18.
//  Copyright © 2018年 ___FUdLLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableViewVC.h"

@interface TableViewVC(){
    NSArray *data;
}
@end

@implementation TableViewVC

- (void)viewDidLoad{
    [super viewDidLoad];
    [self initTableView];
    [self initData];
    data = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"];
    self.myImageView.image = [UIImage imageNamed:@"Algeria.png"];
}

-(void) initData{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *teamPatch = [bundle pathForResource:@"team" ofType:@"plist"];
    self.listData = [[NSArray alloc] initWithContentsOfFile:teamPatch];
    
    NSLog(@"%@", self.listData);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"listdata是啥？？%@", self.listData);
    if(self.listData != nil){
        return self.listData.count;
    }
    return data.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
//    NSString *name = data[indexPath.row];
//    cell.textLabel.text = name;
    
    NSUInteger row = [indexPath row];
    NSDictionary *dic = [self.listData objectAtIndex:row];
    cell.textLabel.text = [dic objectForKey:@"name"];
    
    NSString *imagePatch = [dic objectForKey:@"image"];
    imagePatch = [imagePatch stringByAppendingString:@".png"];
    cell.imageView.image = [UIImage imageNamed:imagePatch];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *txt = [[self.listData objectAtIndex:([indexPath row])] objectForKey:@"name"];
    NSLog(@"点击的是%@", txt);
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"消息" message:txt preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:cancel];
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
    }

-(void) initTableView{
    NSLog(@"初始化tableview");
}

@end
