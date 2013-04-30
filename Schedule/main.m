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
        


        StudentAndCourseService *service = [[StudentAndCourseService alloc] init];
//////
//////        
//        Student *Amelie = [[Student alloc] initWithName:@"Amelie" type:@"Student" allCourses:@"Yes" history:@"No" english:@"No" _id:@"Amelie"];
//        Student *Kristoffer = [[Student alloc] initWithName:@"Kristoffer" type:@"Student" allCourses:@"Yes" history:@"Yes" english:@"No" _id:@"Kristoffer"];
//        Student *Jens = [[Student alloc] initWithName:@"Jens" type:@"Student" allCourses:@"Yes" history:@"Yes" english:@"No" _id:@"Jens"];
 //       Student *Emma = [[Student alloc] initWithName:@"Emma" type:@"Student" allCourses:@"Yes" history:@"No" english:@"No" _id:@"Emma"];

        
//        [service addStudent:Amelie];
 //       [service addStudent:Kristoffer];
//        [service addStudent:Jens];
 //      [service addStudent:Emma];
//
//        
  //      [service addAllStudents];
//
//
//        Course *historyMonday = [[Course alloc] initWithCourseName:@"History" type:@"Course" weekday:@"Monday" time:@"10-12" teacher:@"Karin Bengtson" classroom:@"1A" chapter:@"1" message:@"hej" _id:@"historyMonday"];
//        Course *historyTuesday = [[Course alloc] initWithCourseName:@"History" type:@"Course" weekday:@"Tuesday" time:@"12-14" teacher:@"Erik Jonsson" classroom:@"1A" chapter:@"2" message:@"Testar" _id:@"historyTuesday"];
//        Course *historyWednesday = [[Course alloc] initWithCourseName:@"History" type:@"Course" weekday:@"Wednesday" time:@"13-14" teacher:@"Karin Bengtson" classroom:@"1A" chapter:@"3" message:@"" _id:@"historyWednesday"];
//        Course *historyThursday = [[Course alloc] initWithCourseName:@"History" type:@"Course" weekday:@"Thursday" time:@"14-15" teacher:@"Karin Bengtson" classroom:@"1A" chapter:@"4" message:@"" _id:@"historyThursday"];
        Course *historyFriday = [[Course alloc] initWithCourseName:@"History" type:@"Course" weekday:@"Friday" time:@"14-15" teacher:@"Karin Bengtson" classroom:@"1A" chapter:@"5" message:@"" _id:@"historyFriday"];
        
//        Course *englishMonday = [[Course alloc] initWithCourseName:@"English" type:@"Course" weekday:@"Monday" time:@"11-12" teacher:@"Sara Jonsson" classroom:@"1B" chapter:@"2" message:@"" _id:@"englishMonday"];
//        Course *englishTuesday = [[Course alloc] initWithCourseName:@"English" type:@"Course" weekday:@"Tuesday" time:@"10-11" teacher:@"Sara Jonsson" classroom:@"1B" chapter:@"3" message:@"" _id:@"englishTuesday"];
//        Course *englishWednesday = [[Course alloc] initWithCourseName:@"English" type:@"Course" weekday:@"Wednesday" time:@"11-12" teacher:@"Sara Jonsson" classroom:@"1B" chapter:@"4" message:@"" _id:@"englishWednesday"];

//    Admin *admin = [[Admin alloc] initWithUsername:@"admin1" password:@"mySecretPassword"];
//        
//        
//       [service addCourse:historyMonday:admin];
 //       [service addCourse:historyTuesday:admin];
 //      [service addCourse:historyWednesday:admin];
//        [service addCourse:historyThursday:admin];
//        [service addCourse:englishMonday:admin];
//       [service addCourse:englishTuesday:admin];
//      [service addCourse:englishWednesday:admin];
        
//        [service loadEverythingFromDB];
        
    //[service loadCourseWithId:@"historyTuesday"];
        
        // klar
//        [service updateCourse:historyFriday :@"historyFriday" :@"3-4d7e0c4a3e81cf3853dc8ccf41ad2903"];
        
        //klar
//       [service loadCourseWithId:@"historyFriday"];
        [service loadStudentWithId:@"Amelie"];
        
        //klar
//       [service updateCourseMessage:historyFriday :@"historyFriday" :@"2-09d4c1b56d47c10349f77c8d43c5a823" :@"Kom i tid" :@"mypassword"];
        
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
        
        

    }
    return 0;
}