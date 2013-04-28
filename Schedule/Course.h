//
//  Course.h
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-08.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

@interface Course : NSObject

@property(nonatomic, copy) NSString *courseName;
@property(nonatomic, copy) NSString *type;
@property(nonatomic, copy) NSString *weekday;
@property(nonatomic, copy) NSString *time;
@property(nonatomic, copy) NSString *teacher;
@property(nonatomic, copy) NSString *classroom;
@property(nonatomic, copy) NSString *chapter;
@property(nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *_id;

-(id)initWithCourseName:(NSString *) courseName
                   type:(NSString *) type
                weekday:(NSString *) weekday
                   time:(NSString *) time
                teacher:(NSString *) teacher
              classroom:(NSString *) classroom
                chapter:(NSString *) chapter
                message:(NSString *) message
                    _id:(NSString *)_id;

+(id)courseFromJson:(NSDictionary*) courseAsJson;

@end
