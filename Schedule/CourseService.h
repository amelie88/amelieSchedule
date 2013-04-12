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

@interface CourseService : NSObject

-(id)initWithCourses:(NSArray *) courses;

-(void)addCourse:(Course *)course;

//-(Course *) removeCourse:(Course *)course withId:(NSString *) courseId;


-(NSSet*)filterCoursesUsingPredicate:(NSPredicate*)predicate;

-(void)weekSchedule:(Student*) student;

@end
