//
//  Admin.m
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-11.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import "Admin.h"

@implementation Admin

-(id) init
{
    return [self initWithUsername:@"" password:@""];
}

-(id)initWithUsername:(NSString *)username password:(NSString *)password
{
    self = [super init];
    
    if(self){
        self.username = username;
        self.password = password;
    }
return self;

}
            

@end
