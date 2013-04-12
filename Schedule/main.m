//
//  main.m
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-08.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "StudentService.h"
#import "Course.h"
#import "CourseService.h"
#import "Admin.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        CourseService *courseservice = [[CourseService alloc] init];
        StudentService *studentservice = [[StudentService alloc] init];
        Student *student1 = [[Student alloc] initWithLastName:@"Gereholt" firstName:@"Amelie" course:@"history"];
        Student *student2 = [[Student alloc] initWithLastName:@"Bergkvist" firstName:@"Kristoffer" course:@"history"];
        Student *student3 = [[Student alloc] initWithLastName:@"Hagfeldt" firstName:@"Jens" course:@"math"];
        Student *student4 = [[Student alloc] initWithLastName:@"Emma" firstName:@"Johansson" course:@"english"];
        
        
        
        [studentservice addStudent:student1];
        [studentservice addStudent:student2];
        [studentservice addStudent:student3];
        [studentservice addStudent:student4];
        
        
        
        Course *historyMonday = [[Course alloc] initWithCourseName:@"history" time:@"10-12" teacher:@"Bert Karlsson" classroom:@"1A" chapter:@"3-5" message:@"Hej alla barn"];
        Course *historyTuesday = [[Course alloc] initWithCourseName:@"history" time:@"12-14" teacher:@"Erik Jonsson" classroom:@"1B" chapter:@"7-8" message:@"Kom i tid!"];
        

        Course *english = [[Course alloc] initWithCourseName:@"english" time:@"11-12" teacher:@"Sara Jonsson" classroom:@"1B" chapter:@"4-5" message:@"Halloj"];
        
        [courseservice addCourse:historyMonday];
        [courseservice addCourse:historyTuesday];
        [courseservice addCourse:english];
        
//        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"course.courseName == history"];
//        for(Course *courses in [courseservice filterCoursesUsingPredicate:predicate]){
//                   NSLog(@"%@", courses.time);
//               }

        
       
        
//        [students removeStudent:student4 withId:@"8110212D-AF76-4945-A321-B21721A82873"];
//        NSLog(@"Student %@ %@ was removed", student4.firstName, student4.lastName);
        
                [courseservice historyWeekSchedule:student1];
        
    }
    return 0;
}

