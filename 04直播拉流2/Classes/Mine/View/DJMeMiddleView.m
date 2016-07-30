//
//  DJMeMiddleView.m
//  DJ_Yinke
//
//  Created by 段自强 on 16/7/28.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import "DJMeMiddleView.h"

@implementation DJMeMiddleView




- (instancetype)init
{
    if (self == nil)
    {
        self = [super init];
        //添加横线
        //添加竖线
        //添加格子1
        //添加格子2
        //添加格子3
        //添加格子4
        
    }
    return self;
}




+ (instancetype)meMiddleView
{
    return  [[NSBundle mainBundle] loadNibNamed:@"DJMeMiddleView" owner:nil options:nil].lastObject;
}



@end
