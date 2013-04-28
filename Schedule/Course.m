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
    return course;
}

-(id)init
{
    return[self initWithCourseName:@"" type:@"" weekday:@"" time:@"" teacher:@"" classroom:@"" chapter:@"" message:@"" _id:@""];
}


- (id)initWithCourseName:(NSString *)courseName
                    type:(NSString *)type
                 weekday:(NSString *)weekday
                    time:(NSString *)time
                 teacher:(NSString *)teacher
               classroom:(NSString *)classroom
                 chapter:(NSString *)chapter
                 message:(NSString *)message
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
        self.chapter = chapter;
        self.message = message;
        self._id = _id;
    }
    return self;
}

//-(NSUInteger)hash
//{
//    return 37 * [self._id hash];
//}

@end
