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
    return[self initWithCourseName:@"" teacher:@"" date:@"" classroom:@"" chapter:@"" message:@""];
}

- (id)initWithCourseName:(NSString *)courseName
                 teacher:(NSString *)teacher
                    date:(NSString *)date
               classroom:(NSString *)classroom
                   chapter:(NSString *)chapter
                    message:(NSString *)message
{
    self = [super init];
    
    if (self) {
        self.courseName = courseName;
        self.teacher = teacher;
        self.date = date;
        self.classroom = classroom;
        self.chapter = chapter;
        self.message = message;
    }
    return self;
}

//-(BOOL)writeThisDaysScheme
//{
//    NSLog(@"I %@ ska du läsa %@", self.courseName, self.dayScheme);
//}
//
//-(BOOL)writeThisWeeksScheme
//{
//    NSLog(@"I %@ ska du läsa %@", self.courseName, self.weekScheme);
//}

-(BOOL)writeThisDaysTasks
{
    NSLog(@"%@ A new %@-assigniment from %@: %@.", self.date, self.courseName, self.teacher, self.chapter);
    return YES;
}

//-(BOOL)writeThisWeeksTasks
//{
//    NSLog(@"I %@ ska du denna vecka läsa: %@",self.tasks, self.courseName);
//}




@end
