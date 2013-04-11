//
//  Schedules.h
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-11.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Schedules : NSObject

@property (nonatomic, copy)NSDictionary *mondayScheme;
@property (nonatomic, copy)NSDictionary *tuesdayScheme;
@property (nonatomic, copy)NSDictionary *wednesdayScheme;
@property (nonatomic, copy)NSDictionary *thursdayScheme;
@property (nonatomic, copy)NSDictionary *fridayScheme;
// @property (nonatomic, copy)NSSet *weekTasks;

-(id)initWithWeekScheme:(NSArray *)weekScheme
                 monday:(NSDictionary *) monday
                tuesday:(NSDictionary *) tuesday
              wednesday:(NSDictionary *) wednesday
               thursday:(NSDictionary *) thursday
                 friday:(NSDictionary *) friday;

@end
