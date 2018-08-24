//
//  NoteDAO.h
//  MyApp
//
//  Created by huangjinxin on 2018/8/21.
//  Copyright © 2018年 ___FUdLLUSERNAME___. All rights reserved.
//

#ifndef NodeDAO_h
#define NodeDAO_h

#import "Node.h"

@interface NodeDAO : NSObject
+(NodeDAO *) nodeInstance;
-(void) createEditableCopyOfDatabaseIfNeed;
-(NSString *) applicaionDocumentsDisctoryFile;
-(int) create;
-(int) insert;
-(Node *) getDataByKey:(NSString*)key;
-(NSArray*) getAllData;
@end


#endif /* NoteDAO_h */
