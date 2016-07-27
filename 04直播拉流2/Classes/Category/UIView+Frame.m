//
//  UIView+Frame.m
//  百思不得姐
//
//  Created by JIAAIR on 16/6/6.
//  Copyright © 2016年 JIAAIR. All rights reserved.
//

#import "UIView+Frame.h"


@implementation UIView (Frame)

//宽度
- (CGFloat)dj_width {
    return self.frame.size.width;
}

- (void)setDj_width:(CGFloat)dj_width {
    CGRect frame = self.frame;
    frame.size.width = dj_width;
    self.frame = frame;
}

//高度
- (CGFloat)dj_height {
    return self.frame.size.height;
}

- (void)setDj_height:(CGFloat)dj_height {
    CGRect frame = self.frame;
    frame.size.height = dj_height;
    self.frame = frame;
}

//x值
- (CGFloat)dj_x {
    return self.frame.origin.x;
}

- (void)setDj_x:(CGFloat)dj_x {
    CGRect frame = self.frame;
    frame.origin.x = dj_x;
    self.frame = frame;
}

//y值
- (CGFloat)dj_y {
    return self.frame.origin.y;
}

- (void)setDj_y:(CGFloat)dj_y {
    CGRect frame = self.frame;
    frame.origin.y = dj_y;
    self.frame = frame;
}

//中心X
- (CGFloat)dj_centerX {
    return self.center.x;
}

- (void)setDj_centerX:(CGFloat)dj_centerX {
    CGPoint center = self.center;
    center.x = dj_centerX;
    self.center = center;
}

//中心Y
- (CGFloat)dj_centerY {
    return self.center.y;
}

- (void)setDj_centerY:(CGFloat)dj_centerY {
    CGPoint center = self.center;
    center.y = dj_centerY;
    self.center = center;
    
}



//屏幕H
- (CGFloat)dj_screenH
{
    return [UIScreen mainScreen].bounds.size.height;
}

//屏幕W
- (CGFloat)dj_screenW
{
    return [UIScreen mainScreen].bounds.size.width;
}






@end
