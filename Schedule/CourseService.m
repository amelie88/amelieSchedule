//
//  CourseService.m
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-12.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import "CourseService.h"
#import "Course.h"
#import "Student.h"


//static NSString * const englishKey = @"english_key";
//static NSString * const mathKey = @"math_key";
//static NSString * const historyKey = @"history_Key";

@implementation CourseService
{
    NSMutableArray *courses;
}

- (id)init
{
    return [self initWithCourses:@[]];
}

- (id)initWithCourses:(NSArray *)coursesToAdd
{
    self = [super init];
    
    if (self) { 
        courses = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)addCourse:(Course *)course
{ 
    [courses addObject:course];
}




//-(NSSet*) filterCoursesUsingPredicate:(NSPredicate *)predicate
//{
//    return [[self courses] filteredSetUsingPredicate:predicate];
//}

//NSPredicate *predicate = [NSPredicate predicateWithFormat:@"student.course == history];



-(void)weekSchedule:(Student *)student;
{   for (Course *course in courses) {
    if([student.course isEqualToString:course.courseName]) {
                NSLog(@"%@ %@ %@ %@ %@ %@ %@", course.courseName, course.weekday, course.time, course.teacher, course.classroom, course.chapter, course.message);
            }
        }
}

-(void)scheduleForDay:(NSString*)weekday : (Student*) student;
{   for (Course *course in courses) {
    if([course.weekday isEqualToString:weekday]) {
        NSLog(@"%@ %@ %@ %@ %@ %@ %@", course.courseName, course.weekday, course.time, course.teacher, course.classroom, course.chapter, course.message);
    }
}
}



@end
