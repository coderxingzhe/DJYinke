//
//  DJVideo.m
//  DJYinke
//
//  Created by Mac on 16/7/22.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import "DJVideo.h"
#import "WWAPI.h"
#import "DJNetTool.h"
#import "NSObject+YYModel.h"

@implementation DJVideo

- (id)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.ID = value;
    }
    
}


+ (void)loadVideosWithResult:(void(^)(NSArray *)) completion;
{
    [[DJNetTool sharedNetTool] GetUrlString:VideoDatas parameters:nil completionhandle:^(NSDictionary *resultDict, NSError *error)
     {
         //打印结果
         //NSLog(@"\nooooooo视频2%@",resultDict);
         //创建一个空数组
         NSMutableArray *modes = [NSMutableArray array];
         //取出live字典数组
         NSArray *listArray = [resultDict objectForKey:@"lives"];
         //转模型
         //NSArray *modelArray = [NSArray modelArrayWithClass:[DJVideo class] json:listArray];
         for (NSDictionary *dic in listArray) {
             
             DJVideo *playerModel = [[DJVideo alloc] initWithDictionary:dic];
             playerModel.city = dic[@"city"];
             playerModel.portrait = dic[@"creator"][@"portrait"];
             playerModel.name = dic[@"creator"][@"nick"];
             playerModel.online_users = [dic[@"online_users"] intValue];
             playerModel.url = dic[@"stream_addr"];
             [modes addObject:playerModel];
         }
         //返回
         completion(modes);
     }];
    
    
}

@end
