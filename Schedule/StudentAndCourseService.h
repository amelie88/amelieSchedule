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
-(BOOL)addCourse:(Course *)course : (Admin*) admin;
-(BOOL)saveCourse:(Course *)course;
-(BOOL)updateCourse:(Course *)course : (NSString*)courseId : (NSString*)revNumber;
-(BOOL)deleteCourse:(Course *)course : (NSString*)courseId : (NSString*)revNumber;
-(BOOL)weekSchedule:(Student*) student;
-(BOOL)scheduleForDay:(NSString*)weekday : (Student*) student;
-(BOOL)chapterForDay:(NSString*)weekday : (Student*) student;
-(BOOL)chaptersForWeek:(Student*)student;
-(void)loopThroughCourses;
-(NSSet*)allCourses;

-(void)checkId:(Course*)course;

typedef void (^AllCoursesResponse)(NSArray *allReadCourses);

-(BOOL)getCourseFromDatabase:(NSString*)courseId onCompletion:(AllCoursesResponse) allCoursesResponse;
-(void)getAllCoursesFromDatabase:(NSString*)course onCompletion:(AllCoursesResponse) allCoursesResponse;

-(void)loadAllCoursesFromDB:(NSString*)database;

-(void)loadEverythingFromDB;


-(void)allStudentsMessage:(NSString*) message : (Admin*)admin;


-(id)initWithStudents:(NSArray *) students;
-(BOOL)addStudent:(Student *)student;

-(BOOL) removeStudent:(Student *)student;

-(BOOL) saveStudent:(Student*) student;

-(void) read;
-(NSSet*) allStudents;

typedef void (^AllStudentsResponse)(NSArray *allReadStudents);

-(void)getStudentFromDatabase:(NSString*)studentId onCompletion:(AllStudentsResponse) allStudentsResponse;

-(void)getAllStudentsFromDatabase:(NSString*)database onCompletion:(AllStudentsResponse) allStudentsResponse;

-(void)getAllStudentsCoursesFromDatabase:(NSString*)database onCompletion:(AllStudentsResponse) allStudentsResponse;

-(void)loadAllStudentsCoursesFromDB:(NSString*)database;

@end
