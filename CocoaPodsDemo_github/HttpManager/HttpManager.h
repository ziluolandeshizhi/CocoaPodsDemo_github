//
//  HttpManager.h
//  CocoaPodsDemo_github
//
//  Created by blackJokerZhou on 16/4/12.
//  Copyright © 2016年 blackJokerZhou. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface HttpManager : NSObject
+ (void)httpRequestToLoginWithParaDictionary:(NSDictionary *)dic withBlock:(void(^)(id data))block;
@end
