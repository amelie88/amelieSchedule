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
        
        Student *Amelie = [[Student alloc] initWithName:@"Amelie" type:@"Student" allCourses:@"Yes" history:@"Yes" english:@"Yes" _id:@"Amelie"];
        Student *Kristoffer = [[Student alloc] initWithName:@"Kristoffer" type:@"Student" allCourses:@"No" history:@"Yes" english:@"No" _id:@"Kristoffer"];
        Student *Jens = [[Student alloc] initWithName:@"Jens" type:@"Student" allCourses:@"Yes" history:@"Yes" english:@"Yes" _id:@"Jens"];
        Student *Emma = [[Student alloc] initWithName:@"Emma" type:@"Student" allCourses:@"No" history:@"No" english:@"Yes" _id:@"Emma"];

        
        [service addStudent:Amelie];
        [service addStudent:Kristoffer];
        [service addStudent:Jens];
        [service addStudent:Emma];

//      [service saveStudent:Emma];
       
        Course *historyMonday = [[Course alloc] initWithCourseName:@"History" type:@"Course" weekday:@"Monday" time:@"10-12" teacher:@"Karin Bengtson" classroom:@"1A" chapter:@"1" _id:@"historyMonday"];
        Course *historyTuesday = [[Course alloc] initWithCourseName:@"History" type:@"Course" weekday:@"Tuesday" time:@"12-14" teacher:@"Erik Jonsson" classroom:@"1A" chapter:@"2" _id:@"historyTuesday"];
       Course *historyWednesday = [[Course alloc] initWithCourseName:@"History" type:@"Course" weekday:@"Wednesday" time:@"13-15" teacher:@"Karin Bengtson" classroom:@"1C" chapter:@"3" _id:@"historyWednesday"];
        Course *historyThursday = [[Course alloc] initWithCourseName:@"History" type:@"Course" weekday:@"Thursday" time:@"14-15" teacher:@"Karin Bengtson" classroom:@"1A" chapter:@"4" _id:@"historyThursday"];
        Course *historyFriday = [[Course alloc] initWithCourseName:@"History" type:@"Course" weekday:@"Friday" time:@"14-15" teacher:@"Karin Bengtson" classroom:@"1A" chapter:@"5" _id:@"historyFriday"];

        Course *englishMonday = [[Course alloc] initWithCourseName:@"English" type:@"Course" weekday:@"Monday" time:@"11-12" teacher:@"Sara Jonsson" classroom:@"1C" chapter:@"2" _id:@"englishMonday"];
        Course *englishTuesday = [[Course alloc] initWithCourseName:@"English" type:@"Course" weekday:@"Tuesday" time:@"10-11" teacher:@"Sara Jonsson" classroom:@"1B" chapter:@"3" _id:@"englishTuesday"];
        Course *englishWednesday = [[Course alloc] initWithCourseName:@"English" type:@"Course" weekday:@"Wednesday" time:@"11-12" teacher:@"Sara Jonsson" classroom:@"1B" chapter:@"4" _id:@"englishWednesday"];
        Course *englishThursday = [[Course alloc] initWithCourseName:@"English" type:@"Course" weekday:@"Thursday" time:@"08-10" teacher:@"Sara Jonsson" classroom:@"1B" chapter:@"5" _id:@"englishThursday"];
        Course *englishFriday = [[Course alloc] initWithCourseName:@"English" type:@"Course" weekday:@"Friday" time:@"12-14" teacher:@"Sara Jonsson" classroom:@"1B" chapter:@"5" _id:@"englishFriday"];

       
        [service addCourse:historyMonday];
        [service addCourse:historyTuesday];
        [service addCourse:historyWednesday];
        [service addCourse:historyThursday];
        [service addCourse:historyFriday];
        [service addCourse:englishMonday];
        [service addCourse:englishTuesday];
        [service addCourse:englishWednesday];
        [service addCourse:englishThursday];
        [service addCourse:englishFriday];

//      [service saveCourse:englishWednesday :@"mypassword"];

        
        Message *myMessage = [[Message alloc] initWithReceiver:@"Amelie" type:@"Message" studentsMessage:@"Message to all students" privateMessage:@"Private message" _id:@"myMessage"];
        
        [service addMessage:myMessage];
        
//      [service saveMessage:myMessage :@"mypassword"];
        
        

//       En elev ska kunna se sitt schema för dagen:
//       [service scheduleForDay:@"Wednesday" : Amelie];
        
//       En elev ska kunna se sitt schema för veckan:
//       [service scheduleForWeek:Jens];
        
//       En elev ska kunna se läsanvisningar för dagen:
//       [service chapterForDay:@"Wednesday":Emma];
        
//       En elev ska kunna se läsanvisningar för veckan:
//       [service chaptersForWeek:Kristoffer];
        
//       En administratör ska kunna lägga in ett nytt schema för en viss kurs:
//        (Jag har tagit bort denna från DB så att du kan lägga till.)
//       [service saveCourse:englishFriday :@"mypassword"];
        
//       En administratör ska kunna ändra information i ett schema:
//       (Gör ändringarna, hämta den, använd revnumret för att uppdatera)
//       [service loadWithId:@"historyWednesday"];
//       [service updateCourse:historyWednesday :@"historyWednesday" :@"2-ba1844c71c3afb49285b0cc23fb65566" :@"mypassword"];
        
//       En administratör ska kunna lägga in ett meddelande till alla elever:
//       [service loadWithId:@"myMessage"];
//       [service updateMessages: myMessage :@"myMessage" :@"2-462d9ba08075fe8851a56c8247f136dc" :@"New message to all students" :@"New message to one student" :@"Amelie" :@"mypassword"];

//       En administratör ska kunna lägga in ett meddelande till en viss elev
//       [service loadWithId:@"myMessage"];
//       [service updateMessages:myMessage :@"myMessage" :@"3-1ec6daf4c4ae19ae1fc872aa88f13c10" :@"New message to all students" :@"New message to one student" :@"Amelie" :@"mypassword"];

//       Bara den som man lagt in det privata meddelandet till kan se båda meddelandena.
//       [service showMessages:Kristoffer :myMessage];
//       [service showMessages:Amelie :myMessage];
        




    }
    return 0;
}