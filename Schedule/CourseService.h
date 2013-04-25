//
//  CourseService.h
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-12.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Course.h"
#import "Student.h"
#import "StudentService.h"
#import "Admin.h"


@interface CourseService : NSObject

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

-(BOOL)getFromDatabase:(NSString*)courseId onCompletion:(AllCoursesResponse) allCoursesResponse;

@end
