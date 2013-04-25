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
//
//        
        Student *Amelie = [[Student alloc] initWithName:@"Amelie" allCourses:@"yes" history:@"yes" english:@"yes"];
        Student *Kristoffer = [[Student alloc] initWithName:@"Kristoffer" allCourses:@"yes" history:@"yes" english:@"no"];
        Student *Jens = [[Student alloc] initWithName:@"Jens" allCourses:@"no" history:@"yes" english:@"no"];
        Student *Emma = [[Student alloc] initWithName:@"Emma" allCourses:@"yes" history:@"no" english:@"no"];

        
        
        [studentservice addStudent:Amelie];
        [studentservice addStudent:Kristoffer];
        [studentservice addStudent:Jens];
        [studentservice addStudent:Emma];
        
        
        
    

        Course *historyMonday = [[Course alloc] initWithCourseName:@"history" weekday:@"monday" time:@"10-12" teacher:@"Bert Karlsson" classroom:@"1A" chapter:@"3-5" message:@"Ojoj" _id:[[NSUUID UUID] UUIDString]];
        Course *historyTuesday = [[Course alloc] initWithCourseName:@"history" weekday:@"tuesday" time:@"12-14" teacher:@"Erik Jonsson" classroom:@"1B" chapter:@"7-8" message:@"Kom i tid!" _id:[[NSUUID UUID] UUIDString]];
        Course *historyWednesday = [[Course alloc] initWithCourseName:@"history" weekday:@"wednesday" time:@"13-14" teacher:@"Bert Karlsson" classroom:@"7C" chapter:@"4-6" message:@"Gör uppgifter!" _id:[[NSUUID UUID] UUIDString]];
        Course *historyThursday = [[Course alloc] initWithCourseName:@"history" weekday:@"thursday" time:@"14-15" teacher:@"Burt Karlsson" classroom:@"8C" chapter:@"4-6" message:@"Vikarie" _id:[[NSUUID UUID] UUIDString]];
        Course *mathMonday = [[Course alloc] initWithCourseName:@"math" weekday:@"monday" time:@"14-15" teacher:@"Sara Karlsson" classroom:@"8C" chapter:@"4-6" message:@"Vikarie" _id:[[NSUUID UUID] UUIDString]];
        Course *englishMonday = [[Course alloc] initWithCourseName:@"english" weekday:@"monday" time:@"11-12" teacher:@"Sara Jonsson" classroom:@"1B" chapter:@"4-5" message:@"Halloj" _id:[[NSUUID UUID] UUIDString]];
        Course *englishTuesday = [[Course alloc] initWithCourseName:@"english" weekday:@"tuesday" time:@"11-12" teacher:@"Sara Jonsson" classroom:@"1B" chapter:@"4-5" message:@"Work hard" _id:[[NSUUID UUID] UUIDString]];
        Course *englishWednesday = [[Course alloc] initWithCourseName:@"english" weekday:@"wednesday" time:@"11-12" teacher:@"Sara Jonsson" classroom:@"1B" chapter:@"4-5" message:@"Sjuk" _id:[[NSUUID UUID] UUIDString]];

        Admin *admin = [[Admin alloc] initWithUsername:@"admin1" password:@"mySecretPassword"];
        
        
        [courseservice addCourse:historyMonday:admin];
        [courseservice addCourse:historyTuesday:admin];
        [courseservice addCourse:historyWednesday:admin];
        [courseservice addCourse:historyThursday:admin];
        [courseservice addCourse:mathMonday:admin];
        [courseservice addCourse:englishMonday:admin];
        [courseservice addCourse:englishTuesday:admin];
        [courseservice addCourse:englishWednesday:admin];

        
        
//        [courseservice chapterForDay:@"tuesday" :Emma];
//        [courseservice chaptersForWeek:Emma];
        
//        [courseservice checkId:historyMonday];
       
        
        [courseservice weekSchedule:Amelie];
 //       [courseservice scheduleForDay:@"monday":Amelie];
        
        
//        [studentservice saveStudent:Emma];
//        [courseservice saveCourse:englishWednesday];
//        [courseservice updateCourse:historyMonday : @"1218190B-F843-4FDF-96A9-2A7309ECDE67"];
        
//        [courseservice deleteCourse:historyMonday :@"D8793FFE-328B-43EB-912C-00998835A597" :@"3-06e53e4f2fce646c36a0403a3ff668bd"];

//        [studentservice getAllStudentsFromDatabase:@"student_db" onCompletion:^(NSArray *allReadStudents) {
//                        for(id _id in allReadStudents){
//                            NSLog(@"%@", [[NSString alloc] initWithData:_id encoding:NSUTF8StringEncoding]);
//                        }}];
//                }[[NSRunLoop currentRunLoop] run];

        
//        [studentservice getFromDatabase:@"DC188C02-69BE-4437-BE98-F026FDA41D23" onCompletion:^(NSArray *allReadStudents) {
//            for(id _id in allReadStudents){
//                NSLog(@"%@", [[NSString alloc] initWithData:_id encoding:NSUTF8StringEncoding]);
//            }}];
//    }[[NSRunLoop currentRunLoop] run];
    
//
//    
//    
//        [courseservice getFromDatabase:@"D8793FFE-328B-43EB-912C-00998835A597" onCompletion:^(NSArray *allReadCourses){
//          for(id _id in allReadCourses){
//              NSLog(@"%@", [[NSString alloc] initWithData:_id encoding:NSUTF8StringEncoding]);
//          }}];
//  } [[NSRunLoop currentRunLoop] run];


    }
    return 0;
}