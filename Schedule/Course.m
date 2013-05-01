//
//  Course.m
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-08.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import "Course.h"


@implementation Course

+(id) courseFromJson:(NSDictionary *)courseAsJson
{
    Course *course = [[self alloc] init];
    course._id = courseAsJson[@"_id"];
    course.courseName = courseAsJson[@"courseName"];
    course.type = courseAsJson[@"type"];
    course.weekday = courseAsJson[@"time"];
    course.time = courseAsJson[@"time"];
    course.message = courseAsJson[@"message"];
    return course;
}

-(id)init
{
    return[self initWithCourseName:@"" type:@"" weekday:@"" time:@"" teacher:@"" classroom:@"" message:@"" chapter:@"" _id:@""];
}


- (id)initWithCourseName:(NSString *)courseName
                    type:(NSString *)type
                 weekday:(NSString *)weekday
                    time:(NSString *)time
                 teacher:(NSString *)teacher
               classroom:(NSString *)classroom
                 message:(NSString *)message
                 chapter:(NSString *)chapter
                     _id:(NSString *)_id

{
    self = [super init];
    
    if (self) {
        self.courseName = courseName;
        self.type = type;
        self.weekday = weekday;
        self.time = time;
        self.teacher = teacher;
        self.classroom = classroom;
        self.message = message;
        self.chapter = chapter;
        self._id = _id;
    }
    return self;
}

 

@end
