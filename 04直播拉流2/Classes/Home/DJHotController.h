//
//  DJHotController.h
//  DJYinke
//
//  Created by Mac on 16/7/23.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DJVideo.h"
#import "DJPlayerCell.h"

@interface DJHotController : UIViewController

@property (nonatomic, strong)UIImageView * iconImage;// 用户头像
@property (nonatomic, strong)UILabel * nameLabel;// 用户姓名
@property (nonatomic, strong)UIButton * address;// 用户地址
@property (nonatomic, strong)UILabel *peopleNumber;// 观看人数
@property (nonatomic, strong)UIImageView * coverImage;// 封面

@end
