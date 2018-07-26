//
//  GroupTableviewVC.m
//  MyApp
//
//  Created by huangjinxin on 2018/7/24.
//  Copyright © 2018年 ___FUdLLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GroupTableviewVC.h"
@interface GroupTableviewVC(){
    NSArray *listData;
    NSDictionary *dictData;
}
@end

@implementation GroupTableviewVC

- (void)viewDidLoad{
    [super viewDidLoad];
    [self initData];
}

-(void) initData{
    NSLog(@"初始化数据");
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"team_dictionary" ofType:@"plist"];

    dictData = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
//    NSLog(@"数据是%@", dictData);
    
    NSArray *tempList = [dictData allKeys];
    listData = [tempList sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"数组数组是%@",tempList);
     NSLog(@"数据是%@", listData);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *groupName = [listData objectAtIndex:section];
    NSArray *groupData = [dictData objectForKey:groupName];
    return [groupData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    NSInteger section = [indexPath section];
    NSInteger row = [indexPath row];
    
    NSString *groupName = [listData objectAtIndex:section];
    NSArray *groupItem = [dictData objectForKey:groupName];
    
    cell.textLabel.text = [groupItem objectAtIndex:row];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [listData count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *title = [listData objectAtIndex:section];
    return title;
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    NSMutableArray *listTitles = [[NSMutableArray alloc] initWithCapacity:[listData count]];
    for(NSString *item in listData){
        NSString *title = [item substringToIndex:1];
        [listTitles addObject:title];
    }

    return listTitles;
}


//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return 0;
//}


@end
