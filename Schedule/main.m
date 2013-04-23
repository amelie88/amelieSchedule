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
#import "Storage.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        CourseService *courseservice = [[CourseService alloc] init];
        StudentService *studentservice = [[StudentService alloc] init];

        
        Student *Amelie = [[Student alloc] initWithName:@"Amelie" allCourses:@"yes" history:@"yes" english:@"yes"];
        Student *Kristoffer = [[Student alloc] initWithName:@"Kristoffer" allCourses:@"yes" history:@"yes" english:@"no"];
        Student *Jens = [[Student alloc] initWithName:@"Jens" allCourses:@"yes" history:@"no" english:@"yes"];
        Student *Emma = [[Student alloc] initWithName:@"Emma" allCourses:@"no" history:@"no" english:@"yes"];
        
        
        
        [studentservice addStudent:Amelie];
        [studentservice addStudent:Kristoffer];
        [studentservice addStudent:Jens];
        [studentservice addStudent:Emma];
        
    
        
        Course *historyMonday = [[Course alloc] initWithCourseName:@"history" weekday:@"monday" time:@"10-12" teacher:@"Bert Karlsson" classroom:@"1A" chapter:@"3-5" message:@"Hej alla barn"];
        Course *historyTuesday = [[Course alloc] initWithCourseName:@"history" weekday:@"tuesday" time:@"12-14" teacher:@"Erik Jonsson" classroom:@"1B" chapter:@"7-8" message:@"Kom i tid!"];
        Course *historyWednesday = [[Course alloc] initWithCourseName:@"history" weekday:@"wednesday" time:@"13-14" teacher:@"Bert Karlsson" classroom:@"7C" chapter:@"4-6" message:@"Gör uppgifter!"];
        Course *historyThursday = [[Course alloc] initWithCourseName:@"history" weekday:@"thursday" time:@"14-15" teacher:@"Burt Karlsson" classroom:@"8C" chapter:@"4-6" message:@"Vikarie"];
        Course *mathMonday = [[Course alloc] initWithCourseName:@"math" weekday:@"monday" time:@"14-15" teacher:@"Sara Karlsson" classroom:@"8C" chapter:@"4-6" message:@"Vikarie"];
       

        Course *englishMonday = [[Course alloc] initWithCourseName:@"english" weekday:@"monday" time:@"11-12" teacher:@"Sara Jonsson" classroom:@"1B" chapter:@"4-5" message:@"Halloj"];
        
        [courseservice addCourse:historyMonday];
        [courseservice addCourse:historyTuesday];
        [courseservice addCourse:historyWednesday];
        [courseservice addCourse:historyThursday];
        [courseservice addCourse:mathMonday];
        [courseservice addCourse:englishMonday];
        
       
       
        
        [courseservice weekSchedule:Jens];
//        [courseservice scheduleForDay:@"friday":Amelie];
        

        
//        [studentservice saveStudent:Amelie];
//        [courseservice saveCourse:historyMonday];

        
//        [studentservice getFromDatabase:@"E0866A94-3C41-4D73-B836-74307F9A0BCF" onCompletion:^(NSArray *allReadStudents) {
//            
//            for(id _id in allReadStudents){
//                NSLog(@"%@", [[NSString alloc] initWithData:_id encoding:NSUTF8StringEncoding]);
//            }
//        }];
//    }
//    [[NSRunLoop currentRunLoop] run];
//    
//    
//    
//        [courseservice getFromDatabase:@"501C4909-1247-44C8-8728-D0F665774EEF" onCompletion:^(NSArray *allReadCourses) {
//        
//          for(id _id in allReadCourses){
//              NSLog(@"%@", [[NSString alloc] initWithData:_id encoding:NSUTF8StringEncoding]);
//          }
//      }];
//  }
//  [[NSRunLoop currentRunLoop] run];


    }
    return 0;
}