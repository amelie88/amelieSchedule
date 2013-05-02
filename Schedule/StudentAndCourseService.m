//
//  StudentAndCourseService.m
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-27.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import "StudentAndCourseService.h"


static NSString *const allWeekdaysKey = @"allweekdays_key";
static NSString * const allSubjectsKey = @"allsubjects_key";
static NSString * const allMessagesKey = @"allmessages_key";


@implementation StudentAndCourseService
{
    NSDictionary *courses;
    NSDictionary *students;
    NSDictionary *messages;
    NSOperationQueue *queue;

}

- (id)init
{
    return [self initWithCourses:@[]];
}


- (id)initWithCourses:(NSArray *)coursesToAdd
{
    self = [super init];
    
    if (self) {
        courses = @{allWeekdaysKey: [[NSMutableSet alloc] init]};
        queue = [[NSOperationQueue alloc] init];
        
        for(Course* course in coursesToAdd) {
            [self addCourse:course];
        }
    }
    return self;
}


- (id)initWithStudents:(NSArray *)studentsToAdd
{
    self = [super init];
    
    if (self) {
        students = @{allSubjectsKey: [[NSMutableSet alloc] init]};
        queue = [[NSOperationQueue alloc] init];
        
        for(Student *student in studentsToAdd) {
            [self addStudent:student];
        }
    }
    return self;
}


- (id)initWithMessages:(NSArray *)messagesToAdd
{
    self = [super init];
    
    if (self) {
        messages = @{allMessagesKey: [[NSMutableSet alloc] init]};
        queue = [[NSOperationQueue alloc] init];
        
        for(Message *message in messagesToAdd) {
            [self addMessage:message];
        }
    }
    return self;
}


-(BOOL)addCourse:(Course *)course
{
    if (courses[course._id]){
        return NO;
    } else {
    [courses[allWeekdaysKey] addObject:course];
    return YES;
    }
}

-(BOOL)addStudent:(Student *)student
{
    if (students[student._id]){
        return NO;
    } else {
        [students[allSubjectsKey] addObject:student];
        return YES;
    }
}

-(BOOL)addMessage:(Message *)message
{
    if (messages[message._id]){
        return NO;
    } else {
    [messages[allMessagesKey] addObject:message];
    return YES;
    }
}




-(BOOL)saveCourse:(Course *)course : (NSString*) adminpassword
{if ([adminpassword isEqualToString:@"mypassword"]){
    if (!([course.courseName isEqualToString:@""] || [course.classroom isEqualToString:@""] || [course.teacher isEqualToString:@""] || [course.time isEqualToString:@""] || [course.type isEqualToString:@""] || [course.weekday isEqualToString:@""] || [course._id isEqualToString:@""] || [course.chapter isEqualToString:@""])){
    
    NSDictionary *courseAsJson = [self serializeCourseToJson:course];
    NSData *courseAsData = [NSJSONSerialization dataWithJSONObject:courseAsJson options:NSJSONWritingPrettyPrinted error:NULL];
    
    NSURL *url = [NSURL URLWithString:@"http://amelie.iriscouch.com/studentcourse_db"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:courseAsData];
    
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:nil];
    [connection start];
    
    NSRunLoop *loop = [NSRunLoop currentRunLoop];
    [loop run];
    
    return YES;
}
}return NO;
}



-(BOOL)saveStudent:(Student*) student
{if (!([student.name isEqualToString:@""] || [student.type isEqualToString:@""] || [student.allCourses isEqualToString:@""] || [student.history isEqualToString:@""] || [student.english isEqualToString:@""] || [student._id isEqualToString:@""])){
    
    NSDictionary *studentAsJson = [self serializeStudentToJson:student];
    NSData *studentAsData = [NSJSONSerialization dataWithJSONObject:studentAsJson options:NSJSONWritingPrettyPrinted error:NULL];
    
    NSURL *url = [NSURL URLWithString:@"http://amelie.iriscouch.com/studentcourse_db"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:studentAsData];
    
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:nil];
    [connection start];
    
    NSRunLoop *loop = [NSRunLoop currentRunLoop];
    [loop run];
    
    return YES;
    } return NO;
}


-(BOOL)saveMessage:(Message*) message : (NSString*) adminpassword
{if ([adminpassword isEqualToString:@"mypassword"]){
    if (!([message.receiver isEqualToString:@""] || [message.type isEqualToString:@""]|| [message.studentsMessage isEqualToString:@""] || [message.privateMessage isEqualToString:@""] || [message._id isEqualToString:@""])){
    
    NSDictionary *messageAsJson = [self serializeMessageToJson:message];
    NSData *messageAsData = [NSJSONSerialization dataWithJSONObject:messageAsJson options:NSJSONWritingPrettyPrinted error:NULL];
    
    NSURL *url = [NSURL URLWithString:@"http://amelie.iriscouch.com/studentcourse_db"];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:messageAsData];
    
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:nil];
    [connection start];
    
    NSRunLoop *loop = [NSRunLoop currentRunLoop];
    [loop run];
    
    return YES;
}
}return NO;
}

-(BOOL)updateCourse:(Course*)course : (NSString*)courseId : (NSString*)revNumber : (NSString*)adminpassword
{if ([adminpassword isEqualToString:@"mypassword"]){
    if (!([course.courseName isEqualToString:@""] || [course.classroom isEqualToString:@""] || [course.teacher isEqualToString:@""] || [course.time isEqualToString:@""] || [course.type isEqualToString:@""] || [course.weekday isEqualToString:@""] || [course._id isEqualToString:@""] || [course.chapter isEqualToString:@""])){
    NSDictionary *courseAsJson = [self serializeCourseToJson:course];
    NSData *courseAsData = [NSJSONSerialization dataWithJSONObject:courseAsJson options:NSJSONWritingPrettyPrinted error:NULL];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://amelie.iriscouch.com/studentcourse_db/%@?rev=%@", courseId, revNumber]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];
    
    [request setHTTPMethod:@"PUT"];
    [request setHTTPBody:courseAsData];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:nil];
    [connection start];
    
    NSRunLoop *loop = [NSRunLoop currentRunLoop];
    [loop run];
    
    return YES;
}
}return NO;
}


-(BOOL)updateMessage:(Message*)message : (NSString*)messageId : (NSString*)revNumber : (NSString*)adminpassword
{if ([adminpassword isEqualToString:@"mypassword"]){
    if (!([message.receiver isEqualToString:@""] || [message.studentsMessage isEqualToString:@""] || [message.privateMessage isEqualToString:@""] || [message._id isEqualToString:@""])){
    
    NSDictionary *messageAsJson = [self serializeMessageToJson:message];
    NSData *messageAsData = [NSJSONSerialization dataWithJSONObject:messageAsJson options:NSJSONWritingPrettyPrinted error:NULL];

    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://amelie.iriscouch.com/studentcourse_db/%@?rev=%@", messageId, revNumber]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];
    
    [request setHTTPMethod:@"PUT"];
    [request setHTTPBody:messageAsData];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];

    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:nil];
    [connection start];
    
    NSRunLoop *loop = [NSRunLoop currentRunLoop];
    [loop run];
    
    }return YES;
}return NO;
}


-(BOOL)getWithId:(NSString *)dataId onCompletion:(AllResponse)allDataResponse
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://amelie.iriscouch.com/studentcourse_db/%@", dataId]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
        NSArray *readData = @[data];
        allDataResponse(readData);
    }];
    return YES;
}

-(BOOL)loadWithId:(NSString*)dataId
{if(dataId){
    [self getWithId:dataId onCompletion:^(NSArray *allReadData) {
        for(id name in allReadData){
            NSLog(@"%@", [[NSString alloc] initWithData:name encoding:NSUTF8StringEncoding]);
        }}];
    [[NSRunLoop currentRunLoop] run];
    return YES;
} return NO;
}

-(BOOL)getWithView:(NSString *)view onCompletion:(AllResponse)allDataResponse
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://amelie.iriscouch.com/studentcourse_db/_design/studentcourse_db/_view/%@", view]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
        NSArray *readData = @[data];
        allDataResponse(readData);
    }];
    return YES;
}

-(BOOL)loadWithView:(NSString *)view
{if(view) {
    [self getWithView:view onCompletion:^(NSArray *allReadData) {
        for(id name in allReadData){
            NSLog(@"%@", [[NSString alloc] initWithData:name encoding:NSUTF8StringEncoding]);
        }}];
    [[NSRunLoop currentRunLoop] run];
    return YES;
} return NO;
}


-(BOOL)scheduleForWeek:(Student *)student;
{ if (student) {
    for (Course *course in courses[allWeekdaysKey])
    { if([student.allCourses isEqualToString:@"Yes"])
    {
        NSLog(@"%@ %@: Time:%@, Teacher:%@, Classroom:%@, Read chapter:%@", course.courseName, course.weekday, course.time, course.teacher, course.classroom, course.chapter);
    }
    else if ([student.history isEqualToString:@"Yes"])
    {if ([course.courseName isEqualToString:@"History"])
       {
            NSLog(@"%@ %@: Time:%@, Teacher:%@, Classroom:%@, Read chapter:%@", course.courseName, course.weekday, course.time, course.teacher, course.classroom, course.chapter);
        }
    }
    else if([student.english isEqualToString:@"Yes"])
    {if ([course.courseName isEqualToString:@"English"])
        {
            NSLog(@"%@ %@: Time:%@, Teacher:%@, Classroom:%@, Read chapter:%@", course.courseName, course.weekday, course.time, course.teacher, course.classroom, course.chapter);
        }
      }
   }return YES;
} return NO;
}


-(BOOL)scheduleForDay:(NSString*)weekday : (Student*) student;
{ if(weekday && student){
    for (Course *course in courses[allWeekdaysKey])
    { if([student.allCourses isEqualToString:@"Yes"])
        {if([course.weekday isEqualToString:weekday])
         {
            NSLog(@"%@ %@: Time:%@, Teacher:%@, Classroom:%@, Read chapter:%@", course.courseName, course.weekday, course.time, course.teacher, course.classroom, course.chapter);
         }
        } else if ([student.history isEqualToString:@"Yes"])
    {if([course.courseName isEqualToString:@"History"])
       {if([course.weekday isEqualToString:weekday])
        {
            NSLog(@"%@ %@: Time:%@, Teacher:%@, Classroom:%@, Read chapter:%@", course.courseName, course.weekday, course.time, course.teacher, course.classroom, course.chapter);
        }
      }
    } else if ([student.english isEqualToString:@"Yes"])
        {if([course.courseName isEqualToString:@"English"])
        {if ([course.weekday isEqualToString:weekday])
        {
            NSLog(@"%@ %@: Time:%@, Teacher:%@, Classroom:%@, Read chapter:%@", course.courseName, course.weekday, course.time, course.teacher, course.classroom, course.chapter);
        }
        }
      }
    } return YES;
} return NO;
}


-(BOOL)chapterForDay:(NSString *)weekday :(Student *)student
{if (weekday && student){
    for (Course *course in courses[allWeekdaysKey])
    { if([student.allCourses isEqualToString:@"Yes"])
      {if([course.weekday isEqualToString:weekday])
      {
          NSLog(@"%@ %@: Read chapter %@", course.courseName, course.weekday, course.chapter);
      }
  } else if ([student.history isEqualToString:@"Yes"])
    {if([course.courseName isEqualToString:@"History"])
    {if([course.weekday isEqualToString:weekday])
     {
        NSLog(@"%@ %@: Read chapter %@", course.courseName, course.weekday, course.chapter);
     }
    }
  } else if ([student.english isEqualToString:@"Yes"])
    {if([course.courseName isEqualToString:@"English"])
    {if ([course.weekday isEqualToString:weekday])
    {
        NSLog(@"%@ %@: Read chapter %@", course.courseName, course.weekday, course.chapter);
    }
    }
  }
} return YES;
} return NO;
}


-(BOOL)chaptersForWeek:(Student *)student
{if (student){
    for (Course *course in courses[allWeekdaysKey])
    { if([student.allCourses isEqualToString:@"Yes"])
     {
       NSLog(@"%@ %@: Read chapter %@", course.courseName, course.weekday, course.chapter);
     }
    else if ([student.history isEqualToString:@"Yes"])
    {if ([course.courseName isEqualToString:@"History"])
    {
        NSLog(@"%@ %@: Read chapter %@", course.courseName, course.weekday, course.chapter);
    }
   }else if([student.english isEqualToString:@"Yes"])
   {if ([course.courseName isEqualToString:@"English"])
    {
        NSLog(@"%@ %@: Read chapter %@", course.courseName, course.weekday, course.chapter);
    }
   }
  } return YES;
} return NO;
}


-(BOOL)updateMessages : (Message*)message : (NSString*)messageId : (NSString*)revNumber : (NSString*)studentsmessage : (NSString*)privatemessage : (NSString*)studentname : (NSString*) adminpassword
{
    if ([adminpassword isEqualToString:@"mypassword"]){
        if (message && messageId && revNumber && studentsmessage && privatemessage && studentname && adminpassword){
        
        message.privateMessage = privatemessage;
        message.studentsMessage = studentsmessage;
        message.receiver = studentname;
            [self updateMessage: message: messageId :revNumber:@"mypassword"];
    }return YES;
    } return NO;
}


-(BOOL)showMessages:(Student*)student : (Message*)message
{if (student && message){
    if (student.name == message.receiver)
{
    [self loadWithView:@"publicandprivatemessage"];
    
} else {
    [self loadWithView:@"publicmessage"];
     
} return YES;
} return NO;
}

-(id)serializeCourseToJson:(id) object
{
    NSObject *result = [[NSObject alloc] init];
    result = [object jsonValue];
    return result;
}

-(id)serializeStudentToJson:(id) object
{
    NSObject *result = [[NSObject alloc] init];
    result = [object jsonValue];
    return result;
}

-(id)serializeMessageToJson:(id) object
{
    NSObject *result = [[NSObject alloc] init];
    result = [object jsonValue];
    return result;
}



@end
