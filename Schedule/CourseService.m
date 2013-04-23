//
//  CourseService.m
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-12.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import "CourseService.h"
#import "Course.h"
#import "Student.h"
#import "Course+Json.h"
#import "StudentService.h"

static NSString *const mondayKey = @"monday_key";
static NSString *const tuesdayKey = @"tuesday_key";
static NSString *const wednesdayKey = @"wednesday_key";
static NSString *const thursdayKey = @"thursday_key";
static NSString *const fridayKey = @"friday_key";
static NSString *const allWeekdaysKey = @"allweekdays_key";


@implementation CourseService
{
    NSDictionary *courses;
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
        courses = @{mondayKey: [[NSMutableSet alloc] init],
                    tuesdayKey: [[NSMutableSet alloc] init],
                    wednesdayKey: [[NSMutableSet alloc] init],
                    thursdayKey: [[NSMutableSet alloc] init],
                    fridayKey: [[NSMutableSet alloc] init],
                    allWeekdaysKey: [[NSMutableSet alloc] init]
                    };
        queue = [[NSOperationQueue alloc] init];
        
        for(Course* course in coursesToAdd) {
            [self addCourse:course];
        }
    }
    return self;
}

-(void)addCourse:(Course *)course
{ 
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
}
}

-(void)saveCourse:(Course *)course
{
    
    NSDictionary *courseAsJson = [self serializeCourseToJson:course];
    NSData *courseAsData = [NSJSONSerialization dataWithJSONObject:courseAsJson options:NSJSONWritingPrettyPrinted error:NULL];
    
    //initialize url that is going to be fetched.
    NSURL *url = [NSURL URLWithString:@"http://amelie.iriscouch.com/course_db"];
    
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
    
}


-(id)serializeCourseToJson:(id) object
{
    NSObject *result = [[NSObject alloc] init];
    result = [object jsonValue];
    return result;
}


-(void)getFromDatabase:(NSString *)courseId onCompletion:(AllCoursesResponse)allCoursesResponse
{
    
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://amelie.iriscouch.com/course_db/%@", courseId]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
        //Parse response from Json to custom job object and add it to an NSArray
        NSArray *readCourses = @[data];
        
        // Execute the block which was sent as an argument. This will "call back" to caller
        allCoursesResponse(readCourses);
    }];
}
       //&& ([course.courseName isEqualToString:@"math"] || [course.courseName isEqualToString:@"history"] || [course.courseName isEqualToString:@"english"]))

-(void)weekSchedule:(Student *)student;
{  for (Course *course in courses[allWeekdaysKey])
{ if([student.allCourses isEqualToString:@"yes"])
{
    NSLog(@"%@ %@ %@ %@ %@ %@ %@", course.courseName, course.weekday, course.time, course.teacher, course.classroom, course.chapter, course.message);
}
    else if ([student.history isEqualToString:@"yes"])
{
    if ([course.courseName isEqualToString:@"history"])
    {
           NSLog(@"%@ %@ %@ %@ %@ %@ %@", course.courseName, course.weekday, course.time, course.teacher, course.classroom, course.chapter, course.message);
    }
}

    else if([student.english isEqualToString:@"yes"])
{
if ([course.courseName isEqualToString:@"english"])
    {
           NSLog(@"%@ %@ %@ %@ %@ %@ %@", course.courseName, course.weekday, course.time, course.teacher, course.classroom, course.chapter, course.message);
    }
   }
 }
}







-(void)scheduleForDay:(NSString*)weekday : (Student*) student;
{   for (Course *course in courses[allWeekdaysKey]) {
    if([course.weekday isEqualToString:weekday]) {
        NSLog(@"%@ %@ %@ %@ %@ %@ %@", course.courseName, course.weekday, course.time, course.teacher, course.classroom, course.chapter, course.message);
        }
    }
}

-(NSSet*) allCourses
{
    return [courses[mondayKey] setByAddingObjectsFromSet:courses[tuesdayKey]];
}



@end
