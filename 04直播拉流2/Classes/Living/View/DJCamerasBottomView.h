//
//  DJCamearBottomView.h
//  DJ_Yinke
//
//  Created by Mac on 16/7/26.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    clickTypeChat,
    clickTypeMessge,
    clickTypeShare,
    clickTypeRotate,
    clickTypeBack
}clickType;

@interface DJCamerasBottomView : UIView

//加载xib
+ (DJCamerasBottomView *)bottomView;

@property (nonatomic, copy) void (^btnAction) (clickType clickStyle);

@end
