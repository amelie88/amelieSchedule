//
//  StudentAndCourseService.h
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-27.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Course.h"
//#import "CourseService.h"
//#import "StudentService.h"
#import "Course+Json.h"
#import "Student+Json.h"
#import "Message+Json.h"
#import "Message.h"

@interface StudentAndCourseService : NSObject

-(id)initWithCourses:(NSArray *) courses;
-(id)initWithStudents:(NSArray *) students;
-(id)initWithMessages:(NSArray *) messages;

-(BOOL)addCourse:(Course *)course : (NSString*)adminpassword;
-(BOOL)addStudent:(Student *)student;
-(BOOL)addMessage:(Message *)message;

-(BOOL)saveCourse:(Course *)course;
-(BOOL)saveStudent:(Student*) student;
-(BOOL)saveMessage:(Message*) message;

-(BOOL)updateStudent:(Student*)student : (NSString*)courseId : (NSString*)revNumber;

-(BOOL)deleteCourse:(Course *)course : (NSString*)courseId : (NSString*)revNumber;
-(BOOL)removeStudent:(Student *)student;

-(BOOL)scheduleForWeek:(Student*) student;
-(BOOL)scheduleForDay:(NSString*)weekday : (Student*) student;

-(BOOL)chapterForDay:(NSString*)weekday : (Student*) student;
-(BOOL)chaptersForWeek:(Student*)student;

-(void)updatePrivateMessage:(Message*)message : (NSString*)messageId : (NSString*)revNumber : (NSString*)newmessage : (NSString*)studentname : (NSString*) adminpassword;

-(void)updateStudentsMessage:(Message*)message : (NSString*)messageId : (NSString*)revNumber : (NSString*)newmessage : (NSString*) adminpassword;

-(void)updateMessages : (Message*)message : (NSString*)messageId : (NSString*)revNumber : (NSString*)studentsmessage : (NSString*)privatemessage : (NSString*)studentname : (NSString*) adminpassword;

typedef void (^AllResponse)(NSArray *allReadData);

-(BOOL)getCourseWithId:(NSString*)courseId onCompletion:(AllResponse) allDataResponse;
-(void)loadCourseWithId:(NSString*)courseId;

-(void)getStudentWithId:(NSString*)studentId onCompletion:(AllResponse) allDataResponse;
-(void)loadStudentWithId:(NSString*)studentId;

-(void)getAllCourses:(NSString*)course onCompletion:(AllResponse) allDataResponse;
-(void)getAllStudents:(NSString*)database onCompletion:(AllResponse) allDataResponse;




-(void)getAllStudentsCoursesFromDatabase:(NSString*)database onCompletion:(AllResponse) allDataResponse;
-(void)loadAllStudentsCoursesFromDB:(NSString*)database;

-(void)loadAllCoursesFromDB:(NSString*)database;
-(void)loadAllStudentsFromDB:(NSString*)database;
-(void)loadEverythingFromDB;


-(void)allStudentsMessage:(NSString*) message : (NSString*)password;

-(void)updateStudentMessage:(Student*)student : (NSString*)studentId : (NSString*)revNumber : (NSString*) newmessage : (NSString*) adminpassword;

-(void)getStudentsAndCoursesWithView:(NSString *)view onCompletion:(AllResponse)allDataResponse;
-(void)loadAllStudentsCoursesWithView:(NSString *)view;

-(void)logOutCourses;














@end
