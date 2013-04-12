//
//  Course.h
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-08.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Student;

@interface Course : NSObject
@property(nonatomic, copy) NSString *courseName;
@property(nonatomic, copy) NSString *time;
@property(nonatomic, copy) NSString *teacher;
@property(nonatomic, copy) NSString *classroom;
@property(nonatomic, copy) NSString *chapter;
@property(nonatomic, copy) NSString *message;

-(id)initWithCourseName:(NSString *) courseName
                time:(NSString *) time
                   teacher:(NSString *) teacher
              classroom:(NSString *) classroom
                  chapter:(NSString *) chapter
                  message:(NSString *) message;

//-(BOOL)writeThisDaysScheme;
//-(BOOL)writeThisWeeksScheme;
//-(BOOL)writeThisDaysTasks;
//-(BOOL)writeThisWeeksTasks;


@end
