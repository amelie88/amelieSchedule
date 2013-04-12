//
//  StudentService.h
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-08.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Course.h"
#import "Admin.h"



@interface StudentService : NSObject

-(id)initWithStudents:(NSArray *) students;

-(BOOL)addStudent:(Student *)student;

-(Student *) removeStudent:(Student *)student withId:(NSString *) studentId;

-(void)weekdaySchedule:(NSString*)weekday : (Student*) student;

//-(void)updateMessage:(NSString*)message : (Admin*) admin;

//-(Student *) updateStudentWithId:(NSString *) studentId;
//-(void)logAllStudents:(NSDictionary *)students;


@end
