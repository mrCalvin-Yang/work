//
//  APIClient.m
//  UTVGO
//
//  Created by fute on 16/5/4.
//  Copyright © 2016年 www.UTVGO.com. All rights reserved.
//

#import "APIClient.h"


@implementation APIClient

+ (instancetype)sharedClient{
    static APIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[APIClient alloc] init];
        _sharedClient.requestSerializer.timeoutInterval = 10.0f;
        _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"text/plain", @"charset=UTF-8", @"application/json", nil];
    });
    return _sharedClient;
}

@end
