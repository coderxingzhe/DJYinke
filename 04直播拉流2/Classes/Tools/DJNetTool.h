//
//  DJNetTool.h
//  DJYinke
//
//  Created by Mac on 16/7/22.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface DJNetTool : NSObject

@property (nonatomic, strong) AFHTTPRequestOperationManager *afnManager;

//单例//
+(instancetype)sharedNetTool;
//是否联网属性
//监听网络方法

//get请求
- (void)GetUrlString:(NSString *)urlString parameters:(NSDictionary *)dict completionhandle:(void(^)(NSDictionary *resultDict , NSError *  error)) comletionHandle;
//post请求


@end
