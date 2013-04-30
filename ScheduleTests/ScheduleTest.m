//
//  ScheduleTest.m
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-26.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

//#import "ScheduleTest.h"
////#import "StudentService.h"
////#import "CourseService.h"
//#import "Student.h"
//#import "Course.h"
//#import "Admin.h"
////#import "Course+Json.h"
////#import "Student+Json.h"
//
//static NSString * const englishKey = @"english_key";
//static NSString * const historyKey = @"history_key";
//static NSString * const allSubjectsKey = @"allsubjects_key";
//static NSString *const mondayKey = @"monday_key";
//static NSString *const tuesdayKey = @"tuesday_key";
//static NSString *const wednesdayKey = @"wednesday_key";
//static NSString *const thursdayKey = @"thursday_key";
//static NSString *const fridayKey = @"friday_key";
//static NSString *const allWeekdaysKey = @"allweekdays_key";
//
//@implementation ScheduleTest
//
//{
//    StudentService *studentservice;
//    NSDictionary *students;
//    CourseService *courseservice;
//    NSDictionary *courses;
//}
//
//- (void)setUp
//{
//    studentservice = [[StudentService alloc] init];
//    students = @{englishKey: [[NSMutableSet alloc] init],
//                 historyKey:[[NSMutableSet alloc] init],
//                 allSubjectsKey: [[NSMutableSet alloc] init]};
//    
//    courseservice = [[CourseService alloc] init];
//    courses = @{mondayKey: [[NSMutableSet alloc] init],
//                tuesdayKey: [[NSMutableSet alloc] init],
//                wednesdayKey: [[NSMutableSet alloc] init],
//                thursdayKey: [[NSMutableSet alloc] init],
//                fridayKey: [[NSMutableSet alloc] init],
//                allWeekdaysKey: [[NSMutableSet alloc] init]};
//    
//}
//
//-(void)tearDown
//{
//    studentservice = nil;
//    students = nil;
//    courseservice = nil;
//    courses = nil;
//}
//
//
//
//- (void)testAddStudent
//{
//    Student *Amelie = [[Student alloc] initWithName:@"Amelie" allCourses:@"yes" history:@"yes" english:@"yes"];
//    
//    BOOL result = [studentservice addStudent:Amelie];
//    
//    STAssertTrue(result, @"Adding a student should be possible");
//}
//
//-(void)testAddCourse
//{
//    Course *historyMonday = [[Course alloc] initWithCourseName:@"history" weekday:@"monday" time:@"10-12" teacher:@"Bert Karlsson" classroom:@"1A" chapter:@"3-5" message:@"Ojoj" _id:[[NSUUID UUID] UUIDString]];
//    Admin *admin = [[Admin alloc] initWithUsername:@"admin" password:@"mySecretPassword"];
//    
//    BOOL result = [courseservice addCourse:historyMonday:admin];
//    
//    STAssertTrue(result, @"Adding a student should be possible");
//}
//
//-(void)testRemoveStudent
//{
//    Student *Amelie = [[Student alloc] initWithName:@"Amelie" allCourses:@"no" history:@"yes" english:@"no"];
//    
//    BOOL addResult = [studentservice addStudent:Amelie];
//    STAssertTrue(addResult, @"Student was added");
//    
//    BOOL deletedResult = [studentservice removeStudent:Amelie];
//    STAssertTrue(deletedResult, @"Student was deleted");
//}
//
//-(void)testSaveStudent
//{
//    Student *Amelie = [[Student alloc] initWithName:@"Amelie" allCourses:@"no" history:@"yes" english:@"no"];
//    
//    BOOL saveStudentResult = [studentservice saveStudent:Amelie];
//    STAssertTrue(saveStudentResult, @"Student was saved");
//    
//}
//
//-(void)testSaveCourse
//{
//    Course *historyMonday = [[Course alloc] initWithCourseName:@"history" weekday:@"monday" time:@"10-12" teacher:@"Bert Karlsson" classroom:@"1A" chapter:@"3-5" message:@"Ojoj" _id:[[NSUUID UUID] UUIDString]];
//    
//    BOOL saveCourseResult = [courseservice saveCourse:historyMonday];
//    STAssertTrue(saveCourseResult, @"Course was saved");
//    
//}
//
//-(void)testUpdateCourse
//{
//    Course *historyMonday = [[Course alloc] initWithCourseName:@"history" weekday:@"monday" time:@"10-12" teacher:@"Bert Karlsson" classroom:@"1A" chapter:@"3-5" message:@"Ojoj" _id:[[NSUUID UUID] UUIDString]];
//    
//    BOOL updateCourseResult = [courseservice updateCourse:historyMonday :@"1218190B-F843-4FDF-96A9-2A7309ECDE67" :@"1-93369076be98eaa0fbc1576972f80c0a"];
//    STAssertTrue(updateCourseResult, @"Course was updated");
//    
//}
//
//-(void)testDeleteCourse
//{
//    Course *historyMonday = [[Course alloc] initWithCourseName:@"history" weekday:@"monday" time:@"10-12" teacher:@"Bert Karlsson" classroom:@"1A" chapter:@"3-5" message:@"Ojoj" _id:[[NSUUID UUID] UUIDString]];
//    Admin *admin = [[Admin alloc] initWithUsername:@"admin" password:@"mySecretPassword"];
//    
//    BOOL addResult = [courseservice addCourse:historyMonday :admin];
//    STAssertTrue(addResult, @"Student was added");
//    
//    
//    BOOL deleteCourseResult = [courseservice deleteCourse:historyMonday :@"1218190B-F843-4FDF-96A9-2A7309ECDE67" :@"1-93369076be98eaa0fbc1576972f80c0a"];
//    STAssertTrue(deleteCourseResult, @"Course was deleted");
//}
//
////-(void)testGetFromDatabase
////{
////    BOOL result = [courseservice getFromDatabase:@"1218190B-F843-4FDF-96A9-2A7309ECDE67" onCompletion:^(NSArray *allReadCourses){
////                  for(id _id in allReadCourses){
////                      NSLog(@"%@", [[NSString alloc] initWithData:_id encoding:NSUTF8StringEncoding]);
////                 }}];
////} [[[NSRunLoop currentRunLoop] run]];
////
////    STAssertTrue(result, @"Course was updated");
////}
//
//
//-(void)testWeekSchedule
//{
//    Student *Amelie = [[Student alloc] initWithName:@"Amelie" allCourses:@"no" history:@"yes" english:@"no"];
//    
//    BOOL result = [courseservice weekSchedule:Amelie];
//    STAssertTrue(result, @"Student can see schedule for week");
//}
//
//
//-(void)testScheduleForDay
//{
//    Student *Amelie = [[Student alloc] initWithName:@"Amelie" allCourses:@"no" history:@"yes" english:@"no"];
//    
//    BOOL result = [courseservice scheduleForDay:@"monday":Amelie];
//    STAssertTrue(result, @"Student can see schedule for day");
//}
//
//
//-(void)testChapterForDay
//{
//    Student *Amelie = [[Student alloc] initWithName:@"Amelie" allCourses:@"no" history:@"yes" english:@"no"];
//    
//    BOOL result = [courseservice chapterForDay:@"monday":Amelie];
//    STAssertTrue(result, @"Student can see chapter for day");
//}
//
//
//-(void)testChaptersForWeek
//{
//    Student *Amelie = [[Student alloc] initWithName:@"Amelie" allCourses:@"no" history:@"yes" english:@"no"];
//    
//    BOOL result = [courseservice chaptersForWeek:Amelie];
//    STAssertTrue(result, @"Student can see chapters for week");
//}
//
//
//@end
