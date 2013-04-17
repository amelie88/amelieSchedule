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
    
    selfAsJson[@"studentId"] = self.studentId;
    selfAsJson[@"lastName"] = self.lastName;
    selfAsJson[@"firstName"] = self.firstName;
    selfAsJson[@"course"] = self.course;
    
    return selfAsJson; 
}

@end
