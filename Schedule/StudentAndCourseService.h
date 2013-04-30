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
#import "Admin.h"
//#import "CourseService.h"
//#import "StudentService.h"
#import "Course+Json.h"
#import "Student+Json.h"

@interface StudentAndCourseService : NSObject

-(id)initWithCourses:(NSArray *) courses;
-(id)initWithStudents:(NSArray *) students;

-(BOOL)addCourse:(Course *)course : (Admin*) admin;
-(BOOL)addStudent:(Student *)student;

-(BOOL)saveCourse:(Course *)course;
-(BOOL) saveStudent:(Student*) student;

-(BOOL)updateCourse:(Course *)course : (NSString*)courseId : (NSString*)revNumber;

-(BOOL)deleteCourse:(Course *)course : (NSString*)courseId : (NSString*)revNumber;
-(BOOL)removeStudent:(Student *)student;

-(BOOL)scheduleForWeek:(Student*) student;
-(BOOL)scheduleForDay:(NSString*)weekday : (Student*) student;

-(BOOL)chapterForDay:(NSString*)weekday : (Student*) student;
-(BOOL)chaptersForWeek:(Student*)student;




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


-(void)allStudentsMessage:(NSString*) message : (Admin*)admin;

-(void)updateCourseMessage:(Course*)course : (NSString*)courseId : (NSString*)revNumber : (NSString*) newmessage : (NSString*) adminpassword;












@end
