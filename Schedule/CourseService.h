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


@interface CourseService : NSObject

-(id)initWithCourses:(NSArray *) courses;
-(void)addCourse:(Course *)course;
-(void)saveCourse:(Course *)course;
-(void)updateCourse:(Course *)course : (NSString*)courseId : (NSString*)revNumber;
-(void)deleteCourse:(Course *)course : (NSString*)courseId : (NSString*)revNumber;
-(void)weekSchedule:(Student*) student;
-(void)scheduleForDay:(NSString*)weekday : (Student*) student;
-(void)chapterForDay:(NSString*)weekday : (Student*) student;
-(void)chaptersForWeek:(Student*)student;
-(NSSet*)allCourses;

-(void)checkId:(Course*)course;


typedef void (^AllCoursesResponse)(NSArray *allReadCourses);

-(void)getFromDatabase:(NSString*)courseId onCompletion:(AllCoursesResponse) allCoursesResponse;

@end
