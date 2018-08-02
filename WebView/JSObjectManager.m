//
//  JSObjectManager.m
//  WebView
//
//  Created by zhangrongwu on 2018/8/2.
//  Copyright © 2018年 ENN. All rights reserved.
//

#import "JSObjectManager.h"

@implementation JSObjectManager
- (void)test {
    NSLog(@"调用成功");
}

- (void)testFunction:(id)param {
    NSLog(@"调用成功， 参数： %@", param);
}

- (void)testFunctionWith:(id)param1 :(id)param2 :(id)param3 {
    NSLog(@"%@ - %@ - %@", param1, param2, param3);
}

@end
