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


@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *allCourses;
@property (nonatomic, copy) NSString *history;
@property (nonatomic, copy) NSString *english;
@property (nonatomic, copy, readonly) NSString *_id;

-(id)initWithName:(NSString *) name
             type:(NSString *)type
                 allCourses:(NSString *) allCourses
            history:(NSString *) history
              english:(NSString *) english;


+(id)studentFromJson:(NSDictionary*) studentAsJson;


@end
