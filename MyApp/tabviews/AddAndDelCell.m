//
//  AddAndDelCell.m
//  MyApp
//
//  Created by huangjinxin on 2018/7/30.
//  Copyright © 2018年 ___FUdLLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddAndDelCell.h"

@interface AddAndDelCell()
@end

@implementation AddAndDelCell

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.mNavgationItem.rightBarButtonItem = self.editButtonItem;
    self.mNavgationItem.title = @"插入和删除";
    
    self.mTextField.hidden = YES;
    self.mTextField.delegate = self;
    
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    
    self.listData = [[NSMutableArray alloc] initWithObjects:@"黑龙江", @"吉林", @"辽宁", nil];
    
    [self initRefresh];
}

-(void) initRefresh{
    UIRefreshControl *refControl = [[UIRefreshControl alloc] init];
    [refControl addTarget:self action:@selector(RefreshData:) forControlEvents:UIControlEventValueChanged];
    [self.mTableView addSubview:refControl];
    [refControl beginRefreshing];
    [self RefreshData:refControl];
}

-(void)RefreshData:(UIRefreshControl*)control{
    NSLog(@"刷新数据");
    [self.mTableView reloadData];
    [control endRefreshing];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];
    [self.mTableView setEditing:editing animated:YES];
    if(editing){
        self.mTextField.hidden = NO;
    } else {
        self.mTextField.hidden = YES;
        self.mTextField.text = @"";
        
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.listData count] + 1;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    BOOL isLast = [self.listData count] == [indexPath row];
    if(isLast){
        return UITableViewCellEditingStyleInsert;
    } else {
        return UITableViewCellEditingStyleDelete;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    BOOL isLast = [self.listData count] == [indexPath row];
    if(isLast){
        self.mTextField.frame = CGRectMake(10,0,300,44);
        self.mTextField.text = @"";
        [cell.contentView addSubview:self.mTextField];
        cell.textLabel.text = @"";
    } else {
        cell.textLabel.text = [self.listData objectAtIndex:[indexPath row]];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete) {
        [self.listData removeObjectAtIndex:[indexPath row]];
        [self.mTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if(editingStyle == UITableViewCellEditingStyleInsert) {
        NSString *text = self.mTextField.text;
        [self.listData insertObject:text atIndex:[self.listData count]];
        [self.mTableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    NSLog(@"操作后的数据%@", self.listData);
    [self.mTableView reloadData];
}
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    BOOL isLast = [self.listData count] == [indexPath row];
    if(isLast){
        return false;
    } else {
        return true;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    UITableViewCell *cell = (UITableViewCell *) [[textField superview] superview];
    [self.mTableView setContentOffset:CGPointMake(0.0, cell.frame.origin.y) animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    NSString *stringToMove = [self.listData objectAtIndex:[sourceIndexPath row]];
    [self.listData insertObject:stringToMove atIndex:[destinationIndexPath row]];
}

@end

