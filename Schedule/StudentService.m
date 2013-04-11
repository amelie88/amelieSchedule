//
//  StudentService.m
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-08.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import "StudentService.h"
#import "Student.h"


static NSString * const englishKey = @"english_key";
static NSString * const mathKey = @"math_key";
static NSString * const historyKey = @"history_Key";

@implementation StudentService
{
    NSDictionary *students;
}
//comment 
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

//-(void)updateMessage:(NSString *)message :(Admin *)admin
//{
//    if([admin.password is isEqualToString@"hej"]){
//        .message
//    }
//    
//}

//-(Student *) updateStudentWithId:(NSString *) studentId
//{
//
//}

//-(void)logAllStudents:(NSDictionary *)studentsToLog
//{
//    for (Student *student in students)
//    {
//        NSLog(@"Student %@ %@ har ID: [%@]", student.firstName, student.lastName, student.studentId);
//    }
//}

//-(void)printUsers
//{
//    for (User *user in users) {
//        NSLog(@"Användare %@ har ID: %@", user.name, user.userId);
//    }
//}

@end
