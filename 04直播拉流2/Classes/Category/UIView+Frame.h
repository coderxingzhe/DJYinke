//
//  UIView+Frame.h
//  百思不得姐
//
//  Copyright © 2016年 JIAAIR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

@property CGFloat dj_width;
@property CGFloat dj_height;
@property CGFloat dj_x;
@property CGFloat dj_y;
@property CGFloat dj_centerX;
@property CGFloat dj_centerY;
@property CGFloat dj_screenW;
@property CGFloat dj_screenH;

//一些宏
#define djScreenW [UIScreen mainScreen].bounds.size.width
#define djScreenH [UIScreen mainScreen].bounds.size.height



@end
