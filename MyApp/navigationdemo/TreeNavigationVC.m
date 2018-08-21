//
//  TreeNavigationVC.m
//  MyApp
//
//  Created by huangjinxin on 2018/8/9.
//  Copyright © 2018年 ___FUdLLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TreeNavigationVC.h"
#import "StringUtils.h"
#import "TreeSecondVC.h"

@interface TreeNavigationVC(){
    NSArray *dataArr;
}
@end

@implementation TreeNavigationVC

- (void)viewDidLoad{
    [super viewDidLoad];
    [self initData];
}

-(void) initData{
    dataArr = @[@"sdfsdfds"];
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"provinces_cities" ofType:@"plist"];
    NSLog(@"path = %@",path);
    self.dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    dataArr = [self.dict allKeys];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    cell.textLabel.text = [dataArr objectAtIndex:[indexPath row]];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataArr.count;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"segue.identifier = %@", segue.identifier);
    if([segue.identifier isEqualToString: @"showCitiListIdentifier"]){
        TreeSecondVC *vc = segue.destinationViewController;
        NSIndexPath *indexPath = [self.mTableview indexPathForSelectedRow];
        NSInteger index = [indexPath row];
        NSString *key = [dataArr objectAtIndex:index];
        NSArray *list = [self.dict objectForKey:key];
        vc.listData = list;
        vc.title = key;
    }
}


@end

