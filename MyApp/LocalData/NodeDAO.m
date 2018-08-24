//
//  NodeDAO.m
//  MyApp
//
//  Created by huangjinxin on 2018/8/21.
//  Copyright © 2018年 ___FUdLLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NodeDAO.h"

@interface NodeDAO()

@end

@implementation NodeDAO
static NodeDAO *instance = nil;

+(NodeDAO *)nodeInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[NodeDAO alloc] init];
        [instance createEditableCopyOfDatabaseIfNeed];
    });
    return instance;
}

-(NSString *)applicaionDocumentsDisctoryFile{
    return nil;
}

-(void)createEditableCopyOfDatabaseIfNeed{
    NSFileManager *manager = [NSFileManager defaultManager];
    NSString *filePath = [self applicaionDocumentsDisctoryFile];
    
    BOOL dbExists = [manager fileExistsAtPath:filePath];
    if(!dbExists) {
        NSString *defaultPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"NotesList.plist"];
        NSError *error;
        BOOL success = [manager copyItemAtPath:defaultPath toPath:filePath error:&error];
        
        if(!success) {
            NSAssert1(0, @"读取错误", [error localizedDescription]);
        }
        
    }
}


- (int)create{
    return true;
}

-(int)insert{
    return true;
}

-(NSArray *)getAllData{
    return nil;
}

- (Node *)getDataByKey:(NSString *)key{
    return nil;
}


@end

