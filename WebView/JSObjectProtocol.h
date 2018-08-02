//
//  JSObjectProtocol.h
//  WebView
//
//  Created by zhangrongwu on 2018/8/2.
//  Copyright © 2018年 ENN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
// 原生界面中实现代理方法， js调用iOS注册到window的方法
// 创建一个遵守JSExport协议的协议
@protocol JSObjectProtocol <JSExport>

- (void)test;

- (void)testFunction:(id)param;

- (void)testFunctionWith:(id)param1 :(id)param2 :(id)param3;

@end
