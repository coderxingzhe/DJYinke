//
//  DJNetTool.m
//  DJYinke
//
//  Created by Mac on 16/7/22.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import "DJNetTool.h"
#import <Foundation/Foundation.h>

@implementation DJNetTool

//全局单例
+(instancetype)sharedNetTool
{
    static id instance = nil ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        
    });
    return instance;
}

//get方法
- (void)GetUrlString:(NSString *)urlString parameters:(NSDictionary *)dict completionhandle:(void(^)(NSDictionary *resultDict , NSError *  error)) comletionHandle
{
    //创建afn //为何用快医的AFHTTPSessionManager就请求失败?
    self.afnManager = [[AFHTTPRequestOperationManager alloc] init];
    
    [self.afnManager GET:urlString parameters:dict success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        //
        comletionHandle(responseObject,nil);
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        //
        NSLog(@" 加载失败");
    }];
//    
//    [self.afnManager GET:urlString parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
//        comletionHandle(responseObject,nil);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        //
//        NSLog(@" 加载失败");
//    }];
    
}


@end
