//
//  StudentAndCourseService.m
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-27.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import "StudentAndCourseService.h"


static NSString *const mondayKey = @"monday_key";
static NSString *const tuesdayKey = @"tuesday_key";
static NSString *const wednesdayKey = @"wednesday_key";
static NSString *const thursdayKey = @"thursday_key";
static NSString *const fridayKey = @"friday_key";
static NSString *const allWeekdaysKey = @"allweekdays_key";


static NSString * const englishKey = @"english_key";
static NSString * const historyKey = @"history_key";
static NSString * const allSubjectsKey = @"allsubjects_key";


@implementation StudentAndCourseService
{
    NSDictionary *courses;
    NSOperationQueue *queue;
    
    NSDictionary *students;

}

- (id)init
{
    return [self initWithCourses:@[]];
}

- (id)initWithCourses:(NSArray *)coursesToAdd
{
    self = [super init];
    
    if (self) {
        courses = @{mondayKey: [[NSMutableSet alloc] init],
                    tuesdayKey: [[NSMutableSet alloc] init],
                    wednesdayKey: [[NSMutableSet alloc] init],
                    thursdayKey: [[NSMutableSet alloc] init],
                    fridayKey: [[NSMutableSet alloc] init],
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
        students = @{englishKey: [[NSMutableSet alloc] init],
                     historyKey: [[NSMutableSet alloc] init],
                     allSubjectsKey: [[NSMutableSet alloc] init]
                     
                     };
        queue = [[NSOperationQueue alloc] init];
        
        for(Student *student in studentsToAdd) {
            [self addStudent:student];
        }
        
    }
    return self;
}


-(BOOL)addCourse:(Course *)course : (Admin*) admin
{ if([admin.password isEqualToString:@"mySecretPassword"]){
    if([course.weekday isEqualToString:@"monday"]){
        [courses[mondayKey] addObject:course];
        [courses[allWeekdaysKey] addObject:course];
    } else if ([course.weekday isEqualToString:@"tuesday"]){
        [courses[tuesdayKey] addObject:course];
        [courses[allWeekdaysKey] addObject:course];
    } else if ([course.weekday isEqualToString:@"wednesday"]){
        [courses[wednesdayKey] addObject:course];
        [courses[allWeekdaysKey] addObject:course];
    } else if ([course.weekday isEqualToString:@"thursday"]){
        [courses[thursdayKey] addObject:course];
        [courses[allWeekdaysKey] addObject:course];
    } else if ([course.weekday isEqualToString:@"friday"]){
        [courses[fridayKey] addObject:course];
        [courses[allWeekdaysKey] addObject:course];
        
    } [self saveCourse:course];
}   
    return YES;
}


-(BOOL)addStudent:(Student *)student
{
    if([student.allCourses isEqualToString:@"yes"])
    {
        [students[allSubjectsKey] addObject:student];
    }
    else if ([student.history isEqualToString:@"yes"])
    {
        [students[historyKey] addObject:student];
    }
    else if ([student.english isEqualToString:@"yes"])
    {
        [students[englishKey] addObject:student];
    }
        [self saveStudent:student];
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



-(BOOL)updateCourse:(Course *)course : (NSString *)courseId : (NSString*) revNumber
{
    NSDictionary *courseAsJson = [self serializeCourseToJson:course];
    NSData *courseAsData = [NSJSONSerialization dataWithJSONObject:courseAsJson options:NSJSONWritingPrettyPrinted error:NULL];
    
    //initialize url that is going to be fetched.
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://amelie.iriscouch.com/studentcourse_db/%@?rev=%@", courseId, revNumber]];
    
    //initialize a request from url
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];
    
    //set http method
    [request setHTTPMethod:@"PUT"];
    
    //set post data of request
    [request setHTTPBody:courseAsData];
    
    //initialize a post data
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//    [request setValue:@"hejsan" forHTTPHeaderField:@"message"];
    
    
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:nil];
    [connection start];
    
    NSRunLoop *loop = [NSRunLoop currentRunLoop];
    [loop run];
    
    return YES;
}

-(void)updateCourseMessage:(Course*)course : (NSString*)courseId : (NSString*)revNumber : (NSString*) newmessage : (NSString*) adminpassword
{
    if ([adminpassword isEqualToString:@"mypassword"]){

//        [self loadCourseWithId:courseId];
        course.message = newmessage;
        [self updateCourse:course :courseId :revNumber];
        
    }
}



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
    if([student.allCourses isEqualToString:@"yes"])
    {
        [students[allSubjectsKey] removeObject:student];
    }
    else if ([student.history isEqualToString:@"yes"])
    {
        [students[historyKey] removeObject:student];
    }
    else if ([student.english isEqualToString:@"yes"])
    {
        [students[englishKey] removeObject:student];
    }
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


//-(void)getAllCoursesFromDatabase:(NSString *)database onCompletion:(AllCoursesResponse)allCoursesResponse
//{
//    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://amelie.iriscouch.com/%@/_design/course_db/_view/course", database]];
//    
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
//    
//    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    
//    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
//        //Parse response from Json to custom job object and add it to an NSArray
//        NSArray *readCourses = @[data];
//        
//        // Execute the block which was sent as an argument. This will "call back" to caller
//        allCoursesResponse(readCourses);
//    }];
//}

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

-(void)getStudentsOrCoursesWithView:(NSString *)view onCompletion:(AllResponse)allDataResponse
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


// Can this one replace loadCoursesFromDB and loa
-(void)loadStudentsOrCourses:(NSString*)studentsorcourses
{
    [self getStudentsOrCoursesWithView:studentsorcourses onCompletion:^(NSArray *allReadData) {
        for(id name in allReadData){
            NSLog(@"%@", [[NSString alloc] initWithData:name encoding:NSUTF8StringEncoding]);
        }}];
    [[NSRunLoop currentRunLoop] run];
}




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
    [self getStudentWithId:studentId onCompletion:^(NSArray *allReadStudents) {
        for(id name in allReadStudents){
            NSLog(@"%@", [[NSString alloc] initWithData:name encoding:NSUTF8StringEncoding]);
        }}];
    [[NSRunLoop currentRunLoop] run];
}


-(void)loadAllStudentsCoursesFromDB:(NSString *)database
{
    [self getAllStudentsCoursesFromDatabase:database onCompletion:^(NSArray *allReadCourses) {
        for(id name in allReadCourses){
            NSLog(@"%@", [[NSString alloc] initWithData:name encoding:NSUTF8StringEncoding]);
        }}];
    [[NSRunLoop currentRunLoop] run];
}






//-(void)loadAllStudentsFromDB:(NSString *)database
//{
//    [self getAllStudentsFromDatabase:database onCompletion:^(NSArray *allReadStudents) {
//        for(id name in allReadStudents){
//            NSLog(@"%@", [[NSString alloc] initWithData:name encoding:NSUTF8StringEncoding]);
//        }}];
//    [[NSRunLoop currentRunLoop] run];
//}



-(void)loadEverythingFromDB
{
    [self loadAllStudentsCoursesFromDB:@"studentcourse_db"];
}


-(void)allStudentsMessage:(NSString *)message :(Admin *)admin
{ if ([admin.password isEqualToString:@"mySecretPassword"]){
    for(Course* course in courses[allWeekdaysKey])
    {
        course.message = message;
    }
}
}

//-(BOOL)weekSchedule:(Student *)student;
//{
//    [self loadAllCoursesFromDB:@"student_db"];
//    [self loadAllStudentsFromDB:@"course_db"];
//    for (Course *course in courses[allWeekdaysKey])
//{ if([student.allCourses isEqualToString:@"yes"])
//{
//    NSLog(@"%@ %@ %@ %@ %@ %@ %@", course.courseName, course.weekday, course.time, course.teacher, course.classroom, course.chapter, course.message);
//}
//else if ([student.history isEqualToString:@"yes"])
//{
//    if ([course.courseName isEqualToString:@"history"])
//    {
//        NSLog(@"%@ %@ %@ %@ %@ %@ %@", course.courseName, course.weekday, course.time, course.teacher, course.classroom, course.chapter, course.message);
//    }
//}
//    
//else if([student.english isEqualToString:@"yes"])
//{
//    if ([course.courseName isEqualToString:@"english"])
//    {
//        NSLog(@"%@ %@ %@ %@ %@ %@ %@", course.courseName, course.weekday, course.time, course.teacher, course.classroom, course.chapter, course.message);
//    }
//}
//}
//    return YES;
//}


-(BOOL)scheduleForWeek:(Student *)student;
{
    for (Course *course in courses[allWeekdaysKey])
    { if([student.allCourses isEqualToString:@"Yes"])
    {
        NSLog(@"%@ %@ %@ %@ %@ %@ %@", course.courseName, course.weekday, course.time, course.teacher, course.classroom, course.chapter, course.message);
    }
    else if ([student.history isEqualToString:@"Yes"])
    {
        if ([course.courseName isEqualToString:@"History"])
        {
            NSLog(@"%@ %@ %@ %@ %@ %@ %@", course.courseName, course.weekday, course.time, course.teacher, course.classroom, course.chapter, course.message);
        }
    }
        
    else if([student.english isEqualToString:@"Yes"])
    {
        if ([course.courseName isEqualToString:@"English"])
        {
            NSLog(@"%@ %@ %@ %@ %@ %@ %@", course.courseName, course.weekday, course.time, course.teacher, course.classroom, course.chapter, course.message);
        }
    }
    }
    return YES;
}


//
//
//
//-(BOOL)scheduleForDay:(NSString*)weekday : (Student*) student;
//{
//    
//    [self loadAllCoursesFromDB:@"course_db"];
////    [StudentService loadAllStudentsFromDB:@"student_db"];
//    for (Course *course in courses[allWeekdaysKey])
//    {
//        if([student.allCourses isEqualToString:@"yes"])
//        {if([course.weekday isEqualToString:weekday])
//        {
//            NSLog(@"%@ %@ %@ %@ %@ %@ %@", course.courseName, course.weekday, course.time, course.teacher, course.classroom, course.chapter, course.message);
//        }
//        } else if ([student.history isEqualToString:@"yes"])
//        {if([course.courseName isEqualToString:@"history"])
//        {if([course.weekday isEqualToString:weekday])
//        {
//            NSLog(@"%@ %@ %@ %@ %@ %@ %@", course.courseName, course.weekday, course.time, course.teacher, course.classroom, course.chapter, course.message);
//        }
//        }
//        } else if ([student.english isEqualToString:@"yes"])
//        {if([course.courseName isEqualToString:@"english"])
//        {if ([course.weekday isEqualToString:weekday])
//        {
//            NSLog(@"%@ %@ %@ %@ %@ %@ %@", course.courseName, course.weekday, course.time, course.teacher, course.classroom, course.chapter, course.message);
//        }
//        }
//        }
//    } return YES;
//}
//
//
//-(BOOL)chapterForDay:(NSString *)weekday :(Student *)student
//{for (Course *course in courses[allWeekdaysKey])
//{
//    if([student.allCourses isEqualToString:@"yes"])
//    {if([course.weekday isEqualToString:weekday])
//    {
//        NSLog(@"%@ %@ %@", course.weekday, course.courseName, course.chapter);
//    }
//    } else if ([student.history isEqualToString:@"yes"])
//    {if([course.courseName isEqualToString:@"history"])
//    {if([course.weekday isEqualToString:weekday])
//    {
//        NSLog(@"%@ %@ %@", course.weekday, course.courseName, course.chapter);
//    }
//    }
//    } else if ([student.english isEqualToString:@"yes"])
//    {if([course.courseName isEqualToString:@"english"])
//    {if ([course.weekday isEqualToString:weekday])
//    {
//        NSLog(@"%@ %@ %@", course.weekday, course.courseName, course.chapter);
//    }
//    }
//    }
//} return YES;
//}
//
//
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


@end
