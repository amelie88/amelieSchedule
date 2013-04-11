//
//  Schedules.m
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-11.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import "Schedules.h"


//static NSString * const mondayKey = @"monday_key";
//static NSString * const tuesdayKey = @"tuesday_key";
//static NSString * const wednesdayKey = @"wednesday_key";
//static NSString * const thursdayKey = @"thursday_key";
//static NSString * const fridayKey = @"friday_key";

static NSString * const firstLessonKey = @"first_lesson_key";
static NSString * const tenBreakKey = @"ten_break_key";
static NSString * const secondLessonKey = @"second_lesson_key";
static NSString * const lunchBreakKey = @"lunch_break_key";
static NSString * const thirdLessonKey = @"third_lesson_key";

@implementation Schedules
//{
//    NSDictionary *mondayScheme;
//    NSDictionary *tuesdayScheme;
//    NSDictionary *wednesdayScheme;
//    NSDictionary *thursdayScheme;
//    NSDictionary *fridayScheme;
//}

//-(id)init
//{
//    return [self initWithDays:@[]];
//}

-(id)initWithWeekScheme:(NSArray *)weekScheme
                 monday:(NSDictionary *)monday
                tuesday:(NSDictionary *)tuesday
              wednesday:(NSDictionary *)wednesday
               thursday:(NSDictionary *)thursday
                 friday:(NSDictionary *)friday
{
    self = [super init];
    if (self) {
        monday = @{firstLessonKey:[[NSMutableSet alloc] init],
                   
                   tenBreakKey:[[NSMutableSet alloc] init],
                   secondLessonKey:[[NSMutableSet alloc] init],
                   lunchBreakKey:[[NSMutableSet alloc] init],
                   thirdLessonKey:[[NSMutableSet alloc] init]
                   };
        
        tuesday = @{firstLessonKey:[[NSMutableSet alloc] init],
                    tenBreakKey:[[NSMutableSet alloc] init],
                    secondLessonKey:[[NSMutableSet alloc] init],
                    lunchBreakKey:[[NSMutableSet alloc] init],
                    thirdLessonKey:[[NSMutableSet alloc] init]
                    };
        
        wednesday = @{firstLessonKey:[[NSMutableSet alloc] init],
                      tenBreakKey:[[NSMutableSet alloc] init],
                      secondLessonKey:[[NSMutableSet alloc] init],
                      lunchBreakKey:[[NSMutableSet alloc] init],
                      thirdLessonKey:[[NSMutableSet alloc] init]
                      };
        
        thursday = @{firstLessonKey:[[NSMutableSet alloc] init],
                     tenBreakKey:[[NSMutableSet alloc] init],
                     secondLessonKey:[[NSMutableSet alloc] init],
                     lunchBreakKey:[[NSMutableSet alloc] init],
                     thirdLessonKey:[[NSMutableSet alloc] init]
                     };
        
        friday = @{firstLessonKey:[[NSMutableSet alloc] init],
                   tenBreakKey:[[NSMutableSet alloc] init],
                   secondLessonKey:[[NSMutableSet alloc] init],
                   lunchBreakKey:[[NSMutableSet alloc] init],
                   thirdLessonKey:[[NSMutableSet alloc] init]
                   };
        
    }
    return self;
}

//- (id)initWithDays:(NSArray *)weekdaysToAdd
//{
//    self = [super init];
//
//    if (self) {
//        weekdaySchemes = @{mondayKey:[[NSDictionary alloc] init],
//                           tuesdayKey:[[NSDictionary alloc] init],
//                           wednesdayKey:[[NSDictionary alloc] init],
//                           thursdayKey:[[NSDictionary alloc] init],
//                           fridayKey:[[NSDictionary alloc] init]
//                     };
//    }
//    return self;
//}


@end
