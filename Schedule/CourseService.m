//
//  CourseService.m
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-12.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import "CourseService.h"
#import "Student.h"

@implementation CourseService

static NSString * const englishKey = @"english_key";
static NSString * const mathKey = @"math_key";
static NSString * const historyKey = @"history_Key";

@implementation CourseService
{
    NSDictionary *courses;
}
//comment
- (id)init
{
    return [self initWithCourses:@[]];
}

- (id)initWithCourses:(NSArray *)coursesToAdd
{
    self = [super init];
    
    if (self) {
        courses = @{englishKey: [[NSMutableSet alloc] init],
                     mathKey: [[NSMutableSet alloc] init],
                     historyKey: [[NSMutableSet alloc] init]
                     };
    }
    return self;
}

-(BOOL)addCourse:(Course *)course
{
    if([student.course isEqualToString:@"english"]){
        [students[englishKey] addObject:student];
    } else if ([student.course isEqualToString:@"math"]){
        [students[mathKey] addObject:student];
    } else {
        [students[historyKey] addObject:student];
    }
    return YES;
}

-(Student *) removeStudent:(Student *)student withId:(NSString *)studentId
{
    if(students[studentId])
    {
        Student *removedStudent = students[studentId];
        
        if([student.course isEqualToString:@"english"]){
            [students[englishKey] removeObject:student];
            return removedStudent;
        } else if ([student.course isEqualToString:@"math"]){
            [students[mathKey] removeObject:student];
            return removedStudent;
        } else {
            [students[historyKey] removeObject:student];
            return removedStudent;
        }
    }
    return nil;
}



@end
