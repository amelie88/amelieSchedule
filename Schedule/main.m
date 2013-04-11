//
//  main.m
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-08.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "StudentService.h"
#import "Course.h"
#import "Admin.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Student *student1 = [[Student alloc] initWithLastName:@"Gereholt" firstName:@"Amelie" course:@"history"];
        Student *student2 = [[Student alloc] initWithLastName:@"Bergkvist" firstName:@"Kristoffer" course:@"history"];
        Student *student3 = [[Student alloc] initWithLastName:@"Hagfeldt" firstName:@"Jens" course:@"math"];
        Student *student4 = [[Student alloc] initWithLastName:@"Emma" firstName:@"Johansson" course:@"english"];
        
        StudentService *students = [[StudentService alloc] init];
        
        [students addStudent:student1];
        [students addStudent:student2];
        [students addStudent:student3];
        [students addStudent:student4];
        
        Course *English = [[Course alloc] initWithCourseName:@"english" teacher:@"Bert" date:@"2001-03-24" classroom:@"sal 203" chapter:@"Chapter 10" message:@"Work hard!"];
        Course *Math = [[Course alloc] initWithCourseName:@"math" teacher:@"Sara" date:@"2001-03-24" classroom:@"sal 203" chapter:@"Chapter 1-3" message:@"You can skip the pages about equations"];
        Course *History = [[Course alloc] initWithCourseName:@"history" teacher:@"Sture" date:@"2001-03-24" classroom:@"sal 4120" chapter:@"3" message:@"Write 70 pages on the first world war"
                           ];
        
 //       Admin *admin = [[Admin alloc] initWithUsername:@"Amelu" password:@"amelies"];
        
        [student1 dayTasks];
        [English writeThisDaysTasks];
        
        puts("");
        
        [student2 dayTasks];
        [Math writeThisDaysTasks];
        
        puts("");
        
        [student3 dayTasks];
        [History writeThisDaysTasks];
        
        puts("\n   removing a student   \n");
        
        [students removeStudent:student4 withId:@"8110212D-AF76-4945-A321-B21721A82873"];
        NSLog(@"Student %@ %@ was removed", student4.firstName, student4.lastName);
        
    }
    return 0;
}

