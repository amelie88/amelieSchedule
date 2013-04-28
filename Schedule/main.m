//
//  main.m
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-08.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
//#import "StudentService.h"
#import "Course.h"
//#import "CourseService.h"
#import "Admin.h"
#import "Course+Json.h"
#import "Student+Json.h"
#import "StudentAndCourseService.h"


int main(int argc, const char * argv[])
{

    @autoreleasepool { 
        

//        CourseService *courseservice = [[CourseService alloc] init];
//        StudentService *studentservice = [[StudentService alloc] init];
        StudentAndCourseService *service = [[StudentAndCourseService alloc] init];
//////
//////        
//       Student *Amelie = [[Student alloc] initWithName:@"Amelie" allCourses:@"yes" history:@"yes" english:@"yes"];
//        Student *Kristoffer = [[Student alloc] initWithName:@"Kristoffer" type:@"student" allCourses:@"yes" history:@"yes" english:@"no"];
//        Student *Jens = [[Student alloc] initWithName:@"Jens" allCourses:@"yes" history:@"yes" english:@"no"];
//        Student *Emma = [[Student alloc] initWithName:@"Emma" allCourses:@"yes" history:@"no" english:@"no"];
////

////        
//        [service addStudent:Amelie];
//        [service addStudent:Kristoffer];
//        [service addStudent:Jens];
 //      [service addStudent:Amelie];
//
//        
  //      [service addAllStudents];
//
//
//        Course *historyMonday = [[Course alloc] initWithCourseName:@"history" weekday:@"monday" time:@"10-12" teacher:@"Bert Karlsson" classroom:@"1A" chapter:@"3-5" message:@"Ojoj" _id:@"historyMonday"];
//        Course *historyTuesday = [[Course alloc] initWithCourseName:@"history" type:@"course" weekday:@"tuesday" time:@"12-14" teacher:@"Erik Jonsson" classroom:@"1B" chapter:@"7-8" message:@"Kom i tid!" _id:@"historyTuesday"];
//        Course *historyWednesday = [[Course alloc] initWithCourseName:@"history" weekday:@"wednesday" time:@"13-14" teacher:@"Bert Karlsson" classroom:@"7C" chapter:@"4-6" message:@"Gör uppgifter!" _id:[[NSUUID UUID] UUIDString]];
//        Course *historyThursday = [[Course alloc] initWithCourseName:@"history" weekday:@"thursday" time:@"14-15" teacher:@"Burt Karlsson" classroom:@"8C" chapter:@"4-6" message:@"Vikarie" _id:[[NSUUID UUID] UUIDString]];
//        Course *englishMonday = [[Course alloc] initWithCourseName:@"english" weekday:@"monday" time:@"11-12" teacher:@"Sara Jonsson" classroom:@"1B" chapter:@"4-5" message:@"Halloj" _id:[[NSUUID UUID] UUIDString]];
//        Course *englishTuesday = [[Course alloc] initWithCourseName:@"english" weekday:@"tuesday" time:@"11-12" teacher:@"Sara Jonsson" classroom:@"1B" chapter:@"4-5" message:@"Work hard" _id:[[NSUUID UUID] UUIDString]];
 //       Course *englishWednesday = [[Course alloc] initWithCourseName:@"english" weekday:@"wednesday" time:@"11-12" teacher:@"Sara Jonsson" classroom:@"1B" chapter:@"4-5" message:@"Sjuk" _id:[[NSUUID UUID] UUIDString]];

 //      Admin *admin = [[Admin alloc] initWithUsername:@"admin1" password:@"mySecretPassword"];
//        
//        
 //      [service addCourse:historyMonday:admin];
  //      [service addCourse:historyTuesday:admin];
//        [service addCourse:historyWednesday:admin];
//        [service addCourse:historyThursday:admin];
//        [service addCourse:englishMonday:admin];
//        [service addCourse:englishTuesday:admin];
//       [service addCourse:englishWednesday:admin];
        
//        [service loadEverythingFromDB];
        
        [service loadCourseFromDB:@"historyTuesday"];

        
//        [service loadAllCoursesFromDB:@"course_db"];
//        [service loadAllStudentsFromDB:@"student_db"];
        
//        [service chapterForDay:@"wednesday" :Jens];
//    [service loadEverythingFromDB];
//        [courseservice chaptersForWeek:Emma];
        
//        [courseservice checkId:historyMonday];
 //       [service saveStudent:Kristoffer];
       
        
//        [service weekSchedule:Jens];
 //       [courseservice scheduleForDay:@"monday":Amelie];
        
        
//        [studentservice saveStudent:Jens];
//        [service saveCourse:englishMonday];
//        [courseservice updateCourse:historyMonday : @"1218190B-F843-4FDF-96A9-2A7309ECDE67"];
        
//        [courseservice deleteCourse:historyMonday :@"D8793FFE-328B-43EB-912C-00998835A597" :@"3-06e53e4f2fce646c36a0403a3ff668bd"];
        
        

//        [studentservice getAllStudentsFromDatabase:@"student_db" onCompletion:^(NSArray *allReadStudents) {
//                        for(id name in allReadStudents){
//                            NSLog(@"%@", [[NSString alloc] initWithData:name encoding:NSUTF8StringEncoding]);
//                        }}];
//                }[[NSRunLoop currentRunLoop] run];

//        [studentservice loadAllStudentsFromDB:@"student_db"];

    
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