//
//  HttpManager.m
//  CocoaPodsDemo_github
//
//  Created by blackJokerZhou on 16/4/12.
//  Copyright © 2016年 blackJokerZhou. All rights reserved.
//

#import "HttpManager.h"

@implementation HttpManager
+ (void)httpRequestToLoginWithParaDictionary:(NSDictionary *)dic withBlock:(void(^)(id data))block{
//    _AFNETWORKING_
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", nil];
    [manager POST:k_loginUrl parameters:dic constructingBodyWithBlock:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"成功");
        if (block) {
            block(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"失败");
    }];
    
}
@end
