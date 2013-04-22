//
//  Course+Json.m
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-19.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import "Course+Json.h"

@implementation Course (Json)

-(id)jsonValue
{
    NSMutableDictionary *selfAsJson = [[NSMutableDictionary alloc] init];
    
    selfAsJson[@"_id"] = self._id;
    selfAsJson[@"course"] = self.courseName;
    selfAsJson[@"weekday"] = self.weekday;
    selfAsJson[@"time"] = self.time;
    selfAsJson[@"teacher"] = self.teacher;
    selfAsJson[@"classroom"] = self.classroom;
    selfAsJson[@"chapter"] = self.chapter;
    selfAsJson[@"message"] = self.message;
    
    
    
    return selfAsJson;
}


@end
