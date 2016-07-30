//
//  DJMetopView.m
//  DJ_Yinke
//
//  Created by 段自强 on 16/7/28.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import "DJMetopView.h"

@interface DJMetopView()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;


@end

@implementation DJMetopView

+ (instancetype)metopView
{
    return  [[NSBundle mainBundle] loadNibNamed:@"DJMetopView" owner:nil options:nil].lastObject;
}



- (void)awakeFromNib
{
    //给头像添加边框
    _iconView.layer.borderWidth = 2.0f;
    //设置边框颜色/我的错误,写成了背景颜色
    //_iconView.layer.backgroundColor = [[UIColor whiteColor] CGColor];
    _iconView.layer.borderColor = [[UIColor whiteColor] CGColor];
    
    //设置圆角
    self.iconView.layer.cornerRadius = _iconView.frame.size.width * 0.5;
    _iconView.layer.masksToBounds = YES;
}



@end
