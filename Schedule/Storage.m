//
//  Storage.m
//  Schedule
//
//  Created by Sjostrand Gereholt Amelie on 2013-04-16.
//  Copyright (c) 2013 Sjostrand Gereholt Amelie. All rights reserved.
//

#import "Storage.h"

@implementation Storage


-(void)saveStudent:(Student *)student
{
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:student options:NSJSONWritingPrettyPrinted error:nil];
    

//initialize url that is going to be fetched.
NSURL *url = [NSURL URLWithString:@"http://amelie.iriscouch.com/student_db"];

//initialize a request from url
NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];

//set http method
[request setHTTPMethod:@"POST"];
//initialize a post data


[request setValue:@"application" forHTTPHeaderField:@"Content-Type"];

//set post data of request
[request setHTTPBody:data];
}

@end
