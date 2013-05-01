//
//  Student+Json.m
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-16.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import "Student+Json.h"

@implementation Student (Json)

-(id)jsonValue
{
    NSMutableDictionary *selfAsJson = [[NSMutableDictionary alloc] init];
    
    selfAsJson[@"_id"] = self._id;
    selfAsJson[@"name"] = self.name;
    selfAsJson[@"type"] = self.type;
    selfAsJson[@"allCourses"] = self.allCourses;
    selfAsJson[@"history"] = self.history;
    selfAsJson[@"english"] = self.english;
    selfAsJson[@"message"] = self.message;
    
    return selfAsJson;
}

@end
