//
//  DJCamearBottomView.m
//  DJ_Yinke
//
//  Created by Mac on 16/7/26.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import "DJCamerasBottomView.h"

@implementation DJCamerasBottomView

- (IBAction)canclePlay {
    
    self.btnAction(clickTypeBack);
}
- (IBAction)rotate {
    self.btnAction(clickTypeRotate);
}

+ (DJCamerasBottomView *)bottomView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"DJCamearBottomView" owner:nil options:nil] lastObject];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
