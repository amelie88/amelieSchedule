//
//  Message.h
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-30.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject

@property (nonatomic, copy) NSString *receiver;
@property (nonatomic, copy) NSString *studentsMessage;
@property (nonatomic, copy) NSString *privateMessage;
@property (nonatomic, copy) NSString *_id;

-(id)initWithReceiver:(NSString *) receiver
             studentsMessage:(NSString *) studentsMessage
       privateMessage:(NSString *) privateMessage
              _id:(NSString *) _id; 


+(id)messageFromJson:(NSDictionary*) messageAsJson;

@end
