//
//  DJplayerBottomView.m
//  DJ_Yinke
//
//  Created by Mac on 16/7/24.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import "DJPlayerBottomView.h"

@interface DJPlayerBottomView()



@end

@implementation DJPlayerBottomView
- (IBAction)canclePlay {
    
    self.btnAction(clickTypeBack);
}
- (IBAction)gift {
    self.btnAction(clickTypeGift);
}

+ (DJPlayerBottomView *)bottomView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"DJPlayerBottomView" owner:nil options:nil] lastObject];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
