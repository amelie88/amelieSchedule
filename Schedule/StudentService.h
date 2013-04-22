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
#import "Storage.h"



@interface StudentService : NSObject 

-(id)initWithStudents:(NSArray *) students;
-(BOOL)addStudent:(Student *)student;

-(Student *) removeStudent:(Student *)student withId:(NSString *) _id;

-(void) saveStudent:(Student*) student;

-(void) read;
-(NSSet*) allStudents;

typedef void (^AllStudentsResponse)(NSArray *allReadStudents);

-(void)getFromDatabase:(NSString*)studentId onCompletion:(AllStudentsResponse) allStudentsResponse;

@end
