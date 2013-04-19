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
static NSString * const mathKey = @"math_key";
static NSString * const historyKey = @"history_Key"; 

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
                     mathKey: [[NSMutableSet alloc] init],
                     historyKey: [[NSMutableSet alloc] init]
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
    if([student.course isEqualToString:@"english"]){ 
        [students[englishKey] addObject:student];
    } else if ([student.course isEqualToString:@"math"]){
        [students[mathKey] addObject:student];
    } else {
        [students[historyKey] addObject:student];
    }
    return YES;
}

-(Student *) removeStudent:(Student *)student withId:(NSString *)studentId
{
    if(students[studentId])
    {
        Student *removedStudent = students[studentId];
        
        if([student.course isEqualToString:@"english"]){
            [students[englishKey] removeObject:student];
            return removedStudent;
        } else if ([student.course isEqualToString:@"math"]){
            [students[mathKey] removeObject:student];
            return removedStudent;
        } else {
            [students[historyKey] removeObject:student];
            return removedStudent;
        }
    }
    return nil;
}


-(void)save:(Student*) student
{
    
    NSDictionary *scheduleAsJson = [self serializeObjectToJson:student];
    NSData *scheduleAsData = [NSJSONSerialization dataWithJSONObject:scheduleAsJson options:NSJSONWritingPrettyPrinted error:NULL];
    
    //initialize url that is going to be fetched.
    NSURL *url = [NSURL URLWithString:@"http://amelie.iriscouch.com/student_db"];
    
    //initialize a request from url
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];
    
    //set http method
    [request setHTTPMethod:@"POST"];
    
    //initialize a post data
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    //set post data of request
    [request setHTTPBody:scheduleAsData];
    
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:nil];
    [connection start];
    
    NSRunLoop *loop = [NSRunLoop currentRunLoop];
    [loop run];
                    
}

//-(NSArray*)serializeCollectionToJson:(id) objects
//{
//    NSMutableArray *result = [[NSMutableArray alloc] init];
//    
//    for(id<JsonFormat> object in objects) {
//        [result addObject:[object jsonValue]];
//    }
//    return result;
//}

-(id)serializeObjectToJson:(id) object
{
    NSObject *result = [[NSObject alloc] init];
    result = [object jsonValue];
    return result;
}


-(void)read
{
    //    NSData *scheduleAsData = [NSData dataWithContentsOfFile:urlString];
    //
    //    if(scheduleAsData){
    //        NSDictionary *scheduleAsJson = [NSJSONSerialization JSONObjectWithData:scheduleAsData options:0 error:NULL];
    //
    //        for(NSDictionary *student in scheduleAsJson[@"students"]){
    //            [self addStudent:[Student studentFromJson:student]];
    ////        }
    //    }
    //    NSData *scheduleAsData = NSData
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
