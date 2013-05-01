//
//  main.m
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-08.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Course.h"
#import "Message.h"
#import "Course+Json.h"
#import "Student+Json.h"
#import "Message+Json.h"
#import "StudentAndCourseService.h"


int main(int argc, const char * argv[])
{

    @autoreleasepool { 
        


        StudentAndCourseService *service = [[StudentAndCourseService alloc] init];
        
//        Student *Amelie = [[Student alloc] initWithName:@"Amelie" type:@"Student" allCourses:@"Yes" history:@"No" english:@"No" message:@"" _id:@"Amelie"];
//        Student *Kristoffer = [[Student alloc] initWithName:@"Kristoffer" type:@"Student" allCourses:@"Yes" history:@"Yes" english:@"No" message:@"" _id:@"Kristoffer"];
//        Student *Jens = [[Student alloc] initWithName:@"Jens" type:@"Student" allCourses:@"Yes" history:@"Yes" english:@"No" message:@"" _id:@"Jens"];
//        Student *Emma = [[Student alloc] initWithName:@"Emma" type:@"Student" allCourses:@"No" history:@"No" english:@"Yes" message:@"" _id:@"Emma"];
//
//        
//        [service addStudent:Amelie];
//        [service addStudent:Kristoffer];
//        [service addStudent:Jens];
//        [service addStudent:Emma];
////
////        
//  //      [service addAllStudents];
////
////
//
//        Course *historyMonday = [[Course alloc] initWithCourseName:@"History" type:@"Course" weekday:@"Monday" time:@"10-12" teacher:@"Karin Bengtson" classroom:@"1A" message:@"" chapter:@"1" _id:@"historyMonday"];
//        Course *historyTuesday = [[Course alloc] initWithCourseName:@"History" type:@"Course" weekday:@"Tuesday" time:@"12-14" teacher:@"Erik Jonsson" classroom:@"1A" message:@"" chapter:@"2" _id:@"historyTuesday"];
//       Course *historyWednesday = [[Course alloc] initWithCourseName:@"History" type:@"Course" weekday:@"Wednesday" time:@"13-14" teacher:@"Karin Bengtson" classroom:@"1A" message:@"" chapter:@"3" _id:@"historyWednesday"];
//        Course *historyThursday = [[Course alloc] initWithCourseName:@"History" type:@"Course" weekday:@"Thursday" time:@"14-15" teacher:@"Karin Bengtson" classroom:@"1A"message:@"" chapter:@"4" _id:@"historyThursday"];
////        Course *historyFriday = [[Course alloc] initWithCourseName:@"History" type:@"Course" weekday:@"Friday" time:@"14-15" teacher:@"Karin Bengtson" classroom:@"1A" chapter:@"5" _id:@"historyFriday"];
////
//        Course *englishMonday = [[Course alloc] initWithCourseName:@"English" type:@"Course" weekday:@"Monday" time:@"11-12" teacher:@"Sara Jonsson" classroom:@"1B" message:@"" chapter:@"2" _id:@"englishMonday"];
//        Course *englishTuesday = [[Course alloc] initWithCourseName:@"English" type:@"Course" weekday:@"Tuesday" time:@"10-11" teacher:@"Sara Jonsson" classroom:@"1B" message:@"" chapter:@"3" _id:@"englishTuesday"];
//        Course *englishWednesday = [[Course alloc] initWithCourseName:@"English" type:@"Course" weekday:@"Wednesday" time:@"11-12" teacher:@"Sara Jonsson" classroom:@"1B" message:@"" chapter:@"4" _id:@"englishWednesday"];
//
//        
//       [service addCourse:historyMonday:@"mypassword"];
//    [service addCourse:historyTuesday:@"mypassword"];
//      [service addCourse:historyWednesday:@"mypassword"];
//        [service addCourse:historyThursday:@"mypassword"];
//        [service addCourse:englishMonday:@"mypassword"];
//       [service addCourse:englishTuesday:@"mypassword"];
//      [service addCourse:englishWednesday:@"mypassword"];
        
        Message *myMessage = [[Message alloc] initWithReceiver:@"" studentsMessage:@"" privateMessage:@"" _id:@"myMessage"];
        
        //klar
//        [service saveMessage:myMessage];
        
        //klar
        [service updateMessages:myMessage :@"myMessage" :@"3-1ec6daf4c4ae19ae1fc872aa88f13c10" :@"Message to all students" :@"Message to one student" :@"Amelie" :@"mypassword"];
        
//        [service updateStudentsMessage:myMessage :@"myMessage" :@"2-ca51088a3e874a25ecf13b61d11aaf47" :@"Meddelande alla" :@"mypassword"];
        
        //funkar, men måste göra en ny view
//        [service loadEverythingFromDB];
        
    //[service loadCourseWithId:@"historyTuesday"];
        
        // klar
//        [service updateCourse:historyFriday :@"historyFriday" :@"3-4d7e0c4a3e81cf3853dc8ccf41ad2903"];
        
        //klar
//       [service loadCourseWithId:@"historyFriday"];
//        [service loadStudentWithId:@"Amelie"];
        
        //klar
//       [service updateStudentMessage:Kristoffer :@"Kristoffer" :@"2-0e42a0c2fc438ec16b446706aeb28c64" :@"Kom i tid" :@"mypassword"];
        
        //klar för lokalt
//        [service allStudentsMessage:@"Hello" :@"mypassword"];
        
        
        //klar for lokalt
//        [service scheduleForDay:@"Wednesday" : Emma];
        
        //klar for lokalt
//        [service chapterForDay:@"Wednesday":Emma];
        
//    [service loadEverythingFromDB];
//        [courseservice chaptersForWeek:Emma];
        

//        [service loadAllStudentsCoursesWithView:@"courses"];
        
        //klar
 //       [service scheduleForWeek:Jens];
        
 //       [courseservice scheduleForDay:@"monday":Amelie];
        
//        [service logOutCourses];
        
        
        
        

    }
    return 0;
}