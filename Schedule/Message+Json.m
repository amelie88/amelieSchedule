//
//  Message+Json.m
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-30.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import "Message+Json.h"

@implementation Message (Json)

-(id)jsonValue
{
    NSMutableDictionary *selfAsJson = [[NSMutableDictionary alloc] init];
    
    selfAsJson[@"_id"] = self._id;
    selfAsJson[@"receiver"] = self.receiver;
    selfAsJson[@"type"] = self.type;
    selfAsJson[@"studentsMessage"] = self.studentsMessage;
    selfAsJson[@"privateMessage"] = self.privateMessage;
    
    return selfAsJson;
}

@end
