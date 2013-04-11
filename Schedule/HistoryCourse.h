//
//  HistoryCourse.h
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-11.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HistoryCourse : NSObject

@property(nonatomic, copy) NSString *courseName;
@property(nonatomic, copy) NSString *teacher;
@property(nonatomic, copy) NSString *date;
@property(nonatomic, copy) NSString *classroom;
@property(nonatomic, copy) NSString *chapter;
@property(nonatomic, copy) NSString *message;

-(id)initWithCourseName:(NSString *) courseName
                teacher:(NSString *) teacher
                   date:(NSString *) date
              classroom:(NSString *) classroom
                chapter:(NSString *) chapter
                message:(NSString *) message;

@end
