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
#import "Message.h"
#import "Course+Json.h"
#import "Student+Json.h"
#import "Message+Json.h"


@interface StudentAndCourseService : NSObject

typedef void (^AllResponse)(NSArray *allReadData);

-(id)initWithCourses:(NSArray*) courses;
-(id)initWithStudents:(NSArray*) students;
-(id)initWithMessages:(NSArray*) messages;

-(BOOL)addCourse:(Course*) course;
-(BOOL)addStudent:(Student*) student;
-(BOOL)addMessage:(Message*) message;

-(BOOL)saveCourse:(Course*) course : (NSString*) adminpassword;
-(BOOL)saveStudent:(Student*) student;
-(BOOL)saveMessage:(Message*) message : (NSString*) adminpassword;
;
-(BOOL)updateCourse:(Course*) course : (NSString*)courseId : (NSString*)revNumber : (NSString*)adminpassword;
-(BOOL)updateMessage:(Message*) message : (NSString*)messageId : (NSString*)revNumber : (NSString*)adminpassword;

-(BOOL)getWithId:(NSString *)dataId onCompletion:(AllResponse)allDataResponse;
-(BOOL)loadWithId:(NSString*)dataId;

-(BOOL)getWithView:(NSString *)view onCompletion:(AllResponse)allDataResponse;
-(BOOL)loadWithView:(NSString *)view;


-(BOOL)scheduleForWeek:(Student*) student;
-(BOOL)scheduleForDay:(NSString*) weekday : (Student*) student;

-(BOOL)chapterForDay:(NSString*) weekday : (Student*) student;
-(BOOL)chaptersForWeek:(Student*) student;

-(BOOL)updateMessages:(Message*) message : (NSString*)messageId : (NSString*)revNumber : (NSString*)studentsmessage : (NSString*)privatemessage : (NSString*)studentname : (NSString*) adminpassword;

-(BOOL)showMessages:(Student*) student : (Message*)message;


@end
