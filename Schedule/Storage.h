//
//  Storage.h
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-16.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

@interface Storage : NSObject

-(void)saveStudent:(Student*) student;

@end
