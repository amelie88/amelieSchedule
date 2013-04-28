//
//  Student.m
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-08.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import "Student.h"


@implementation Student

+(id) studentFromJson:(NSDictionary *)studentAsJson
{
    Student *student = [[self alloc] init];
    student->__id = studentAsJson[@"_id"];
    student.name = studentAsJson[@"name"];
    student.type = studentAsJson[@"type"];
    student.allCourses = studentAsJson[@"allCourses"];
    student.history = studentAsJson[@"history"];
    student.english = studentAsJson[@"english"];
    return student;
}

-(id)init 
{
    return [self initWithName:@"" type:@"" allCourses:@"" history:@"" english:@""];
}

-(id)initWithName:(NSString *) name
             type:(NSString *) type
            allCourses:(NSString *) allCourses
               history:(NSString *) history
          english:(NSString*) english;
{
    self = [super init];
    
    if (self) {
        self.name = name;
        self.type = type;
        self.allCourses = allCourses;
        self.history = history;
        self.english = english;
        self->__id = [[NSUUID UUID] UUIDString];
    }
    return self;
}

-(NSUInteger)hash
{
    return 37 * [self._id hash];
}



@end
