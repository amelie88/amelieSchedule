//
//  ScheduleTest.m
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-26.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import "ScheduleTest.h"
#import "StudentAndCourseService.h"
#import "Student.h"
#import "Course.h"
#import "Message.h"
#import "Course+Json.h"
#import "Student+Json.h"
#import "Message+Json.h"


static NSString * const allSubjectsKey = @"allsubjects_key";
static NSString *const allWeekdaysKey = @"allweekdays_key";
static NSString *const allMessagesKey = @"allmessages_key";

@implementation ScheduleTest

{
    StudentAndCourseService *service;
    NSDictionary *students;
    NSDictionary *courses;
    NSDictionary *messages;
    Student *student;
    Course *course;
    Message *message;
}

- (void)setUp
{
    service = [[StudentAndCourseService alloc] init];
    students = @{allSubjectsKey: [[NSMutableSet alloc] init]};
    courses = @{allWeekdaysKey: [[NSMutableSet alloc] init]};
    messages = @{allMessagesKey: [[NSMutableSet alloc] init]};
    student = [[Student alloc] initWithName:@"Amelie" type:@"Student" allCourses:@"Yes" history:@"Yes" english:@"Yes" _id:@"Amelie"];
    course = [[Course alloc] initWithCourseName:@"History" type:@"Course" weekday:@"Monday" time:@"10-12" teacher:@"Karin Bengtson" classroom:@"1A" chapter:@"1" _id:@"historyMonday"];
    message = [[Message alloc] initWithReceiver:@"Amelie" type:@"Message" studentsMessage:@"Hej alla" privateMessage:@"Hej elev" _id:@"myMessage"];
}

-(void)tearDown
{
    service = nil;
    courses = nil;
    students = nil;
    messages = nil;
}



- (void)testAddStudent
{
    BOOL result = [service addStudent:student];
    
    STAssertTrue(result, @"Adding a student should be possible");
}

-(void)testAddCourse
{
    BOOL result = [service addCourse:course];
    
    STAssertTrue(result, @"Adding a student should be possible");
}

-(void)testAddMessage
{
    BOOL result = [service addMessage:message];
    
    STAssertTrue(result, @"Adding a message should be possible");
}

-(void)testSaveCourse
{
    BOOL result = [service saveCourse:course:@"mypassword"];
    STAssertTrue(result, @"Course should be saved");
}

-(void)testSaveStudent
{
    BOOL result = [service saveStudent:student];
    STAssertTrue(result, @"Student should be saved");
}


-(void)testSaveMessage
{
    BOOL result = [service saveMessage:message:@"mypassword"];
    STAssertTrue(result, @"Message should be saved");
    
}

-(void)testUpdateCourse
{
    BOOL result = [service updateCourse:course :@"1218190B-F843-4FDF-96A9-2A7309ECDE67" :@"1-93369076be98eaa0fbc1576972f80c0a" :@"mypassword"];
    STAssertTrue(result, @"Course should be updated");
}

-(void)testUpdateMessage
{
    BOOL result = [service updateMessage:message :@"1218190B-F843-4FDF-96A9-2A7309ECDE67" :@"1-93369076be98eaa0fbc1576972f80c0a" :@"mypassword"];
    STAssertTrue(result, @"Message should be updated");
    
}

-(void)testLoadWithId
{
    BOOL result = [service loadWithId:@"Amelie"];
    STAssertTrue(result, @"Data should be fetched from DB");
}

-(void)testLoadWithView
{
    BOOL result = [service loadWithView:@"publicmessage]"];
    STAssertTrue(result, @"Data should be fetched from DB");
}


-(void)testScheduleForWeek
{
    BOOL result = [service scheduleForWeek:student];
    STAssertTrue(result, @"Student should see week schedule");
}


-(void)testScheduleForDay
{
    BOOL result = [service scheduleForDay:@"monday":student];
    STAssertTrue(result, @"Student should see schedule for day");
}


-(void)testChapterForDay
{
    BOOL result = [service chapterForDay:@"monday":student];
    STAssertTrue(result, @"Student should chapter for day");
}


-(void)testChaptersForWeek
{
    BOOL result = [service chaptersForWeek:student];
    STAssertTrue(result, @"Student should see chapters for week");
}

-(void)testUpdateMessages
{
    BOOL result = [service updateMessages:message :@"myMessage" :@"4-05eae4e791fab8665148b488e61d9e69" :@"Hej" :@"Huj" :@"Amelie" :@"mypassword"];
        STAssertTrue(result, @"Messages should be updated");
}

-(void)testShowMessages
{
    BOOL result = [service showMessages:student :message];
    STAssertTrue(result, @"Student should see messages");
}



@end
