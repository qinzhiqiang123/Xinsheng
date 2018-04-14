//
//  XSNetWork.h
//  Xinsheng
//
//  Created by Simson on 2018/4/14.
//  Copyright © 2018年 Simson. All rights reserved.
//

#import <Foundation/Foundation.h>

//请求成功回调block
typedef void (^requestSuccessBlock)(NSDictionary *dic);

//请求失败回调block
typedef void (^requestFailureBlock)(NSError *error);

//请求方法define
typedef enum {
    GET,
    POST,
    PUT,
    DELETE,
    HEAD
} HTTPMethod;
@interface XSNetWork : AFHTTPSessionManager
+ (instancetype)sharedManager;
- (void)requestWithMethod:(HTTPMethod)method
                 WithPath:(NSString *)path
               WithParams:(NSDictionary*)params
         WithSuccessBlock:(requestSuccessBlock)success
          WithFailurBlock:(requestFailureBlock)failure;
@end
