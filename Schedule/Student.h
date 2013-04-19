//
//  Student.h
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-08.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Course.h"

@interface Student : NSObject

@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *course;
@property (nonatomic, copy, readonly) NSString *_id;

-(id)initWithLastName:(NSString *) lastName
            firstName:(NSString *) firstName
               course:(NSString *) course;


+(id)studentFromJson:(NSDictionary*) studentAsJson;


@end
