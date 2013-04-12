//
//  Student.m
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-08.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import "Student.h"


@implementation Student

-(id)init
{
    return [self initWithLastName:@"" firstName:@"" course:@""];
}

-(id)initWithLastName:(NSString *) lastName
            firstName:(NSString *) firstName
               course:(NSString *) course
{
    self = [super init];
    
    if (self) {
        self.lastName = lastName;
        self.firstName = firstName;
        self.course = course;
        self->_studentId = [[NSUUID UUID] UUIDString];
    }
    return self;
}

-(NSUInteger)hash
{
    return 37 * [self.studentId hash];
}



-(BOOL)dayTasks
{
    NSLog(@"%@ ID:[%@]", self.firstName, self.studentId);
    NSLog(@"Today you have a new assignment in todays %@-class.", self.course);
    return YES;
}



@end