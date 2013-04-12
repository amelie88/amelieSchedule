//
//  Course.m
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-08.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import "Course.h"


@implementation Course

-(id)init
{
    return[self initWithCourseName:@"" time:@"" teacher:@"" classroom:@"" chapter:@"" message:@""];
}


- (id)initWithCourseName:(NSString *)courseName
                 teacher:(NSString *)time
                    date:(NSString *)teacher
               classroom:(NSString *)classroom
                   chapter:(NSString *)chapter
                    message:(NSString *)message
{
    self = [super init];
    
    if (self) {
        self.courseName = courseName;
        self.time = time;
        self.teacher = teacher;
        self.classroom = classroom;
        self.chapter = chapter;
        self.message = message;
    }
    return self;
}



@end
