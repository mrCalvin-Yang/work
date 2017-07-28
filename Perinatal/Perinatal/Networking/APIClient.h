//
//  APIClient.h
//  UTVGO
//
//  Created by fute on 16/5/4.
//  Copyright © 2016年 www.UTVGO.com. All rights reserved.
//

#import <Foundation/Foundation.h>

//void (^httpFailBlock)(NSString *respone);

@interface APIClient : AFHTTPSessionManager

+ (instancetype)sharedClient;


@end
