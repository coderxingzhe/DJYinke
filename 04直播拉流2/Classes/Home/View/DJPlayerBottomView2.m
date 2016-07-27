//
//  DJPlayerBottomView2.m
//  DJ_Yinke
//
//  Created by Mac on 16/7/26.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import "DJPlayerBottomView2.h"

@implementation DJPlayerBottomView2

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (DJPlayerBottomView2 *)bottomView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"DJPlayerBottomView2" owner:nil options:nil] lastObject];
}

@end
