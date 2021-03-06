//
//  Message.m
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-30.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import "Message.h"

@implementation Message

+(id) messageFromJson:(NSDictionary *)messageAsJson
{
    Message *message = [[self alloc] init];
    message._id = messageAsJson[@"_id"];
    message.receiver = messageAsJson[@"receiver"];
    message.type = messageAsJson[@"type"];
    message.studentsMessage = messageAsJson[@"studentsMessage"];
    message.privateMessage = messageAsJson[@"privateMessage"];
    return message;
}

-(id)init
{
    return [self initWithReceiver:@"" type:@"" studentsMessage:@"" privateMessage:@"" _id:@""];
}

-(id)initWithReceiver:(NSString *) receiver
                 type:(NSString *) type
             studentsMessage:(NSString *) studentsMessage
       privateMessage:(NSString *) privateMessage
              _id:(NSString*) _id;
{
    self = [super init];
    
    if (self) {
        self.receiver = receiver;
        self.type = type;
        self.studentsMessage = studentsMessage;
        self.privateMessage = privateMessage;
        self._id = _id;
    }
    return self;
}


@end
