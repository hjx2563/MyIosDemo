//
//  TableViewSearchVC.m
//  MyApp
//
//  Created by huangjinxin on 2018/7/23.
//  Copyright © 2018年 ___FUdLLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableViewSearchVC.h"

@interface TableViewSearchVC(){
    NSArray *tableviewData;
    NSMutableArray *filterResult;
}
@end


@implementation TableViewSearchVC

- (void)viewDidLoad{
    [super viewDidLoad];
    NSLog(@"带搜索的tableiew");
    [self initData];
}

-(void)initData{
    NSLog(@"初始化列表数据");
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"team" ofType:@"plist"];
    tableviewData = [NSArray arrayWithContentsOfFile:plistPath];
    NSLog(@"获取的数据是%@", tableviewData);
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(tableviewData == nil){
        return 0;
    } else {
        if(self.mSearchBar.text.length > 0) {
            if(filterResult !=nil) {
                return filterResult.count;
            } else {
                return 0;
            }
        }
         return tableviewData.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    NSString *identifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    NSDictionary *dict;
    if(self.mSearchBar.text.length > 0){
        dict = [filterResult objectAtIndex:[indexPath row]];;
    } else {
        dict = [tableviewData objectAtIndex:[indexPath row]];;
    }
    
    cell.textLabel.text = [dict objectForKey:@"name"];
    
    NSString *imagePath = [dict objectForKey:@"image"];
    imagePath = [imagePath stringByAppendingString:@".png"];
    cell.imageView.image = [UIImage imageNamed:imagePath];
    
    
    return cell;
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSLog(@"进行搜索");
    NSString *key = self.searchController.searchBar.text;
    NSPredicate *prediccate = [NSPredicate predicateWithFormat:@"name CONTAINS[cd] %@ || image CONTAINS[cd] %@",key, key];
    
    if(filterResult != nil) {
        [filterResult removeAllObjects];
    }
    
    filterResult = [NSMutableArray arrayWithArray:[tableviewData filteredArrayUsingPredicate:prediccate]];
    
    [self.mTableView reloadData];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
//    NSLog(@"变了 %@", searchBar.text);
    
    NSPredicate *prediccate = [NSPredicate predicateWithFormat:@"name CONTAINS[cd] %@ || image CONTAINS[cd] %@",searchText, searchText];
    
    if(searchText.length > 0){
        if(filterResult != nil) {
            [filterResult removeAllObjects];
        }
        
        filterResult = [NSMutableArray arrayWithArray:[tableviewData filteredArrayUsingPredicate:prediccate]];
    }
    
    [self.mTableView reloadData];
}


@end
