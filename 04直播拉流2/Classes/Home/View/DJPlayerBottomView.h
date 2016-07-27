//
//  DJplayerBottomView.h
//  DJ_Yinke
//
//  Created by Mac on 16/7/24.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    clickTypeChat,
    clickTypeMessge,
    clickTypeShare,
    clickTypeGift,
    clickTypeBack
}clickType;

@interface DJPlayerBottomView : UIView

//加载xib
+ (DJPlayerBottomView *)bottomView;

@property (nonatomic, copy) void (^btnAction) (clickType clickStyle);

@end
