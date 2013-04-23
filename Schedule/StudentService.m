//
//  StudentService.m
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-08.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import "StudentService.h"
#import "Student.h"
#import "Student+Json.h" 



static NSString * const englishKey = @"english_key";
static NSString * const historyKey = @"history_key";
static NSString * const allSubjectsKey = @"allsubjects_key";


@implementation StudentService
{
    NSDictionary *students;
    NSOperationQueue *queue;
}

- (id)init
{
    return [self initWithStudents:@[]];
}

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
    return YES;
}


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


-(void)saveStudent:(Student*) student
{
    
    NSDictionary *studentAsJson = [self serializeStudentToJson:student];
    NSData *studentAsData = [NSJSONSerialization dataWithJSONObject:studentAsJson options:NSJSONWritingPrettyPrinted error:NULL];
    
    //initialize url that is going to be fetched.
    NSURL *url = [NSURL URLWithString:@"http://amelie.iriscouch.com/student_db"];
    
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
                    
}



-(id)serializeStudentToJson:(id) object
{
    NSObject *result = [[NSObject alloc] init];
    result = [object jsonValue];
    return result;
}




-(void)getFromDatabase:(NSString *)studentId onCompletion:(AllStudentsResponse)allStudentsResponse
{

     
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://amelie.iriscouch.com/student_db/%@", studentId]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
        //Parse response from Json to custom job object and add it to an NSArray
        NSArray *readStudents = @[data];
        
        // Execute the block which was sent as an argument. This will "call back" to caller
        allStudentsResponse(readStudents);
    }];
}



-(NSSet*) allStudents
{
    //how to add more than one set?
    return [students[englishKey] setByAddingObjectsFromSet:students[historyKey]];
}



@end
