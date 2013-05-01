//
//  StudentAndCourseService.m
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-27.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import "StudentAndCourseService.h"


//static NSString *const mondayKey = @"monday_key";
//static NSString *const tuesdayKey = @"tuesday_key";
//static NSString *const wednesdayKey = @"wednesday_key";
//static NSString *const thursdayKey = @"thursday_key";
//static NSString *const fridayKey = @"friday_key";
static NSString *const allWeekdaysKey = @"allweekdays_key";


//static NSString * const englishKey = @"english_key";
//static NSString * const historyKey = @"history_key";
static NSString * const allSubjectsKey = @"allsubjects_key";

static NSString * const allMessagesKey = @"allmessages_key";


@implementation StudentAndCourseService
{
    NSDictionary *courses;
    NSOperationQueue *queue;
    
    NSDictionary *students;
    NSDictionary *messages;

}

- (id)init
{
    return [self initWithCourses:@[]];
}

- (id)initWithCourses:(NSArray *)coursesToAdd
{
    self = [super init];
    
    if (self) {
        courses = @{
//                    mondayKey: [[NSMutableSet alloc] init],
//                    tuesdayKey: [[NSMutableSet alloc] init],
//                    wednesdayKey: [[NSMutableSet alloc] init],
//                    thursdayKey: [[NSMutableSet alloc] init],
//                    fridayKey: [[NSMutableSet alloc] init],
                    allWeekdaysKey: [[NSMutableSet alloc] init]
                    };
        queue = [[NSOperationQueue alloc] init];
        
        for(Course* course in coursesToAdd) {
            [self addCourse:course : nil];
        }
    }
    return self;
}


//- (id)init
//{
//    return [self initWithStudents:@[]];
//}

- (id)initWithStudents:(NSArray *)studentsToAdd
{
    self = [super init];
    
    if (self) {
        students = @{
//                     englishKey: [[NSMutableSet alloc] init],
//                     historyKey: [[NSMutableSet alloc] init],
                     allSubjectsKey: [[NSMutableSet alloc] init]
                     
                     };
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
        messages = @{
                     //                     englishKey: [[NSMutableSet alloc] init],
                     //                     historyKey: [[NSMutableSet alloc] init],
                     allMessagesKey: [[NSMutableSet alloc] init]
                     
                     };
        queue = [[NSOperationQueue alloc] init];
        
        for(Message *message in messagesToAdd) {
            [self addMessage:message];
        }
        
    }
    return self;
}


-(BOOL)addCourse:(Course *)course : (NSString*)adminpassword
{ if([adminpassword isEqualToString:@"mypassword"]){
    
    [courses[allWeekdaysKey] addObject:course];
}
    return YES;
}


-(BOOL)addStudent:(Student *)student
{
        [students[allSubjectsKey] addObject:student];

    return YES;
}

-(BOOL)addMessage:(Message *)message : (NSString*)adminpassword
{ if([adminpassword isEqualToString:@"mypassword"]){
    
    [messages[allMessagesKey] addObject:message];
}
    return YES;
}




-(BOOL)saveCourse:(Course *)course
{
    
    NSDictionary *courseAsJson = [self serializeCourseToJson:course];
    NSData *courseAsData = [NSJSONSerialization dataWithJSONObject:courseAsJson options:NSJSONWritingPrettyPrinted error:NULL];
    
    //initialize url that is going to be fetched.
    NSURL *url = [NSURL URLWithString:@"http://amelie.iriscouch.com/studentcourse_db"];
    
    //initialize a request from url
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];
    
    //set http method
    [request setHTTPMethod:@"POST"];
    
    //initialize a post data
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    //set post data of request
    [request setHTTPBody:courseAsData];
    
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:nil];
    [connection start];
    
    NSRunLoop *loop = [NSRunLoop currentRunLoop];
    [loop run];
    
    return YES;
}

-(BOOL)saveStudent:(Student*) student
{
    
    NSDictionary *studentAsJson = [self serializeStudentToJson:student];
    NSData *studentAsData = [NSJSONSerialization dataWithJSONObject:studentAsJson options:NSJSONWritingPrettyPrinted error:NULL];
    
    //initialize url that is going to be fetched.
    NSURL *url = [NSURL URLWithString:@"http://amelie.iriscouch.com/studentcourse_db"];
    
    //initialize a request from url
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];
    
    //set http method
    [request setHTTPMethod:@"POST"];
    
    //initialize a post data
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    //set post data of request
    [request setHTTPBody:studentAsData];
    
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:nil];
    [connection start];
    
    NSRunLoop *loop = [NSRunLoop currentRunLoop];
    [loop run];
    
    return YES;
}

-(BOOL)saveMessage:(Message*) message
{
    
    NSDictionary *messageAsJson = [self serializeMessageToJson:message];
    NSData *messageAsData = [NSJSONSerialization dataWithJSONObject:messageAsJson options:NSJSONWritingPrettyPrinted error:NULL];
    
    //initialize url that is going to be fetched.
    NSURL *url = [NSURL URLWithString:@"http://amelie.iriscouch.com/studentcourse_db"];
    
    //initialize a request from url
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];
    
    //set http method
    [request setHTTPMethod:@"POST"];
    
    //initialize a post data
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    //set post data of request
    [request setHTTPBody:messageAsData];
    
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:nil];
    [connection start];
    
    NSRunLoop *loop = [NSRunLoop currentRunLoop];
    [loop run];
    
    return YES;
}



-(BOOL)updateStudent:(Student*)student : (NSString*)studentId : (NSString*)revNumber
{
    NSDictionary *studentAsJson = [self serializeCourseToJson:student];
    NSData *studentAsData = [NSJSONSerialization dataWithJSONObject:studentAsJson options:NSJSONWritingPrettyPrinted error:NULL];
    
    //initialize url that is going to be fetched.
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://amelie.iriscouch.com/studentcourse_db/%@?rev=%@", studentId, revNumber]];
    
    //initialize a request from url
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];
    
    //set http method
    [request setHTTPMethod:@"PUT"];
    
    //set post data of request
    [request setHTTPBody:studentAsData];
    
    //initialize a post data
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//    [request setValue:@"hejsan" forHTTPHeaderField:@"message"];
    
    
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:nil];
    [connection start];
    
    NSRunLoop *loop = [NSRunLoop currentRunLoop];
    [loop run];
    
    return YES;
}

-(BOOL)updateMessage:(Message*)message : (NSString*)messageId : (NSString*)revNumber
{
    NSDictionary *messageAsJson = [self serializeMessageToJson:message];
    NSData *messageAsData = [NSJSONSerialization dataWithJSONObject:messageAsJson options:NSJSONWritingPrettyPrinted error:NULL];
    
    //initialize url that is going to be fetched.
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://amelie.iriscouch.com/studentcourse_db/%@?rev=%@", messageId, revNumber]];
    
    //initialize a request from url
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];
    
    //set http method
    [request setHTTPMethod:@"PUT"];
    
    //set post data of request
    [request setHTTPBody:messageAsData];
    
    //initialize a post data
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    //    [request setValue:@"hejsan" forHTTPHeaderField:@"message"];
    
    
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:nil];
    [connection start];
    
    NSRunLoop *loop = [NSRunLoop currentRunLoop];
    [loop run];
    
    return YES;
}

-(void)updateMessages : (Message*)message : (NSString*)messageId : (NSString*)revNumber : (NSString*)studentsmessage : (NSString*)privatemessage : (NSString*)studentname : (NSString*) adminpassword
{
    if ([adminpassword isEqualToString:@"mypassword"]){

        message.privateMessage = privatemessage;
        message.studentsMessage = studentsmessage;
        message.receiver = studentname;
        [self updateMessage: message: messageId :revNumber];
        
    }
}

//-(void)updateStudentsMessage:(Message*)message : (NSString*)messageId : (NSString*)revNumber : (NSString*)newmessage : (NSString*) adminpassword
//
//{ if ([adminpassword isEqualToString:@"mypassword"]){
//    
//    message.studentsMessage = newmessage;
//    message.receiver = @"Everyone";
//    [self updateMessage:message :messageId :revNumber];
//}
//}



-(BOOL)deleteCourse:(Course *)course :(NSString *)courseId :(NSString *)revNumber
{
    NSDictionary *courseAsJson = [self serializeCourseToJson:course];
    NSData *courseAsData = [NSJSONSerialization dataWithJSONObject:courseAsJson options:NSJSONWritingPrettyPrinted error:NULL];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://amelie.iriscouch.com/studentcourse_db/%@?rev=%@", courseId, revNumber]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];
    
    [request setHTTPMethod:@"DELETE"];
    
    [request setHTTPBody:courseAsData];
    
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:nil];
    [connection start];
    
    NSRunLoop *loop = [NSRunLoop currentRunLoop];
    [loop run];
    
    return YES;
}

// merge deleteCourse and removestudent, both parts are needed
-(BOOL)removeStudent:(Student *)student
{
//    if([student.allCourses isEqualToString:@"yes"])
//    {
        [students[allSubjectsKey] removeObject:student];
//    }
//    else if ([student.history isEqualToString:@"yes"])
//    {
//        [students[historyKey] removeObject:student];
//    }
//    else if ([student.english isEqualToString:@"yes"])
//    {
//        [students[englishKey] removeObject:student];

    return YES;
}


-(BOOL)getCourseWithId:(NSString *)courseId
          onCompletion:(AllResponse)allDataResponse
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://amelie.iriscouch.com/studentcourse_db/%@", courseId]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
        //Parse response from Json to custom job object and add it to an NSArray
        NSArray *readData = @[data];
        
        // Execute the block which was sent as an argument. This will "call back" to caller
        allDataResponse(readData);
    }];
    return YES;
}



-(void)getStudentWithId:(NSString *)studentId onCompletion:(AllResponse)allDataResponse
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://amelie.iriscouch.com/studentcourse_db/%@", studentId]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
        //Parse response from Json to custom job object and add it to an NSArray
        NSArray *readData = @[data];
        
        // Execute the block which was sent as an argument. This will "call back" to caller
        allDataResponse(readData);
    }];
}


-(void)getAllCoursesFromDatabase:(NSString *)database onCompletion:(AllResponse)allDataResponse
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://amelie.iriscouch.com/%@/_design/studentcourse_db/_view/course", database]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
        //Parse response from Json to custom job object and add it to an NSArray
        NSArray *readData = @[data];
        
        // Execute the block which was sent as an argument. This will "call back" to caller
        allDataResponse(readData);
    }];
}

//-(void)getAllStudentsFromDatabase:(NSString *)database onCompletion:(AllStudentsResponse)allStudentsResponse
//{
//    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://amelie.iriscouch.com/%@/_design/student_db/_view/names", database]];
//    
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
//    
//    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    
//    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
//        //Parse response from Json to custom job object and add it to an NSArray
//        NSArray *readStudents = @[data];
//        
//        // Execute the block which was sent as an argument. This will "call back" to caller
//        allStudentsResponse(readStudents);
//    }];
//}




// Can this one replace loadCoursesFromDB and loa
//-(void)loadStudentsOrCourses:(NSString*)studentsorcourses
//{
//    [self getStudentsOrCoursesWithView:studentsorcourses onCompletion:^(NSArray *allReadData) {
//        for(id name in allReadData){
//            NSLog(@"%@", [[NSString alloc] initWithData:name encoding:NSUTF8StringEncoding]);
//        }}];
//    [[NSRunLoop currentRunLoop] run];
//}




-(void)loadCourseWithId:(NSString*)courseId
{
    [self getCourseWithId:courseId onCompletion:^(NSArray *allReadData) {
        for(id name in allReadData){
            NSLog(@"%@", [[NSString alloc] initWithData:name encoding:NSUTF8StringEncoding]);
        }}];
    [[NSRunLoop currentRunLoop] run];
}


-(void)loadStudentWithId:(NSString*)studentId
{
    [self getStudentWithId:studentId onCompletion:^(NSArray *allReadData) {
        for(id name in allReadData){
            NSLog(@"%@", [[NSString alloc] initWithData:name encoding:NSUTF8StringEncoding]);
        }}];
    [[NSRunLoop currentRunLoop] run];
}


-(void)loadEverythingFromDB
{
    [self loadAllStudentsCoursesWithView:@"idrev"];
}

-(void)loadAllStudentsCoursesWithView:(NSString *)view
{
    [self getStudentsAndCoursesWithView:view onCompletion:^(NSArray *allReadData) {
        for(id name in allReadData){
            NSLog(@"%@", [[NSString alloc] initWithData:name encoding:NSUTF8StringEncoding]);
        }}];
    [[NSRunLoop currentRunLoop] run];
}


-(void)getStudentsAndCoursesWithView:(NSString *)view onCompletion:(AllResponse)allDataResponse
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://amelie.iriscouch.com/studentcourse_db/_design/studentcourse_db/_view/%@", view]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
        //Parse response from Json to custom job object and add it to an NSArray
        NSArray *readData = @[data];
        
        // Execute the block which was sent as an argument. This will "call back" to caller
        allDataResponse(readData);
    }];
}



//-(void)getEverythingFromDatabase:(NSString *)database onCompletion:(AllStudentsResponse)allStudentsResponse
//{
//    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://amelie.iriscouch.com/%@/_design/student_db/_view/names", database]];
//
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
//
//    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//
//    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
//        //Parse response from Json to custom job object and add it to an NSArray
//        NSArray *readStudents = @[data];
//
//        // Execute the block which was sent as an argument. This will "call back" to caller
//        allStudentsResponse(readStudents);
//    }];



-(BOOL)scheduleForWeek:(Student *)student;
{
    for (Course *course in courses[allWeekdaysKey])
    { if([student.allCourses isEqualToString:@"Yes"])
    {
        NSLog(@"%@ %@ %@ %@ %@ %@", course.courseName, course.weekday, course.time, course.teacher, course.classroom, course.chapter);
//[self loadAllStudentsCoursesWithView:@"courses"];
    }
    else if ([student.history isEqualToString:@"Yes"])
    {
        if ([course.courseName isEqualToString:@"History"])
        {
            NSLog(@"%@ %@ %@ %@ %@ %@", course.courseName, course.weekday, course.time, course.teacher, course.classroom, course.chapter);
            //en till view
        }
    }
        
    else if([student.english isEqualToString:@"Yes"])
    {
        if ([course.courseName isEqualToString:@"English"])
        {
            NSLog(@"%@ %@ %@ %@ %@ %@", course.courseName, course.weekday, course.time, course.teacher, course.classroom, course.chapter);
            //en till view
        }
    }
    }
    return YES;
}

-(void)logOutCourses
{
    for(Course *course in courses[allWeekdaysKey])
    {
        NSLog(@"%@", course.type);
    }
}


//
//
//
-(BOOL)scheduleForDay:(NSString*)weekday : (Student*) student;
{
    for (Course *course in courses[allWeekdaysKey])
    {
        if([student.allCourses isEqualToString:@"Yes"])
        {if([course.weekday isEqualToString:weekday])
        {
            NSLog(@"%@ %@ %@ %@ %@ %@", course.courseName, course.weekday, course.time, course.teacher, course.classroom, course.chapter);
        }
        } else if ([student.history isEqualToString:@"Yes"])
        {if([course.courseName isEqualToString:@"History"])
        {if([course.weekday isEqualToString:weekday])
        {
            NSLog(@"%@ %@ %@ %@ %@ %@", course.courseName, course.weekday, course.time, course.teacher, course.classroom, course.chapter);
        }
        }
        } else if ([student.english isEqualToString:@"Yes"])
        {if([course.courseName isEqualToString:@"English"])
        {if ([course.weekday isEqualToString:weekday])
        {
            NSLog(@"%@ %@ %@ %@ %@ %@", course.courseName, course.weekday, course.time, course.teacher, course.classroom, course.chapter);
        }
        }
        }
    } return YES;
}


-(BOOL)chapterForDay:(NSString *)weekday :(Student *)student
{for (Course *course in courses[allWeekdaysKey])
{
    if([student.allCourses isEqualToString:@"Yes"])
    {if([course.weekday isEqualToString:weekday])
    {
        NSLog(@"%@ %@ %@", course.weekday, course.courseName, course.chapter);
    }
    } else if ([student.history isEqualToString:@"Yes"])
    {if([course.courseName isEqualToString:@"History"])
    {if([course.weekday isEqualToString:weekday])
    {
        NSLog(@"%@ %@ %@", course.weekday, course.courseName, course.chapter);
    }
    }
    } else if ([student.english isEqualToString:@"Yes"])
    {if([course.courseName isEqualToString:@"English"])
    {if ([course.weekday isEqualToString:weekday])
    {
        NSLog(@"%@ %@ %@", course.weekday, course.courseName, course.chapter);
    }
    }
    }
} return YES;
}



//-(BOOL)chaptersForWeek:(Student *)student
//{  for (Course *course in courses[allWeekdaysKey])
//{ if([student.allCourses isEqualToString:@"yes"])
//{
//    NSLog(@"%@ %@ %@", course.weekday, course.courseName, course.chapter);
//}
//else if ([student.history isEqualToString:@"yes"])
//{
//    if ([course.courseName isEqualToString:@"history"])
//    {
//        NSLog(@"%@ %@ %@", course.weekday, course.courseName, course.chapter);
//    }
//}
//    
//else if([student.english isEqualToString:@"yes"])
//{
//    if ([course.courseName isEqualToString:@"english"])
//    {
//        NSLog(@"%@ %@ %@", course.weekday, course.courseName, course.chapter);
//    }
//}
//} return YES;
//}





-(void)checkId:(Course *)course
{
    NSLog(@"%@", course._id);
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
