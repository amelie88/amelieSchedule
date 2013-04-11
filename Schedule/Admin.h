//
//  Admin.h
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-11.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Admin : NSObject

@property(nonatomic, copy) NSString *username;
@property(nonatomic, copy) NSString *password;

-(id) initWithUsername:(NSString*) username
              password:(NSString*) password;

@end
