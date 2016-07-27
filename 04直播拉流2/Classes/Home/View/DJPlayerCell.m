//
//  DJPlayerCell.m
//  DJYinke
//
//  Created by Mac on 16/7/23.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import "DJPlayerCell.h"
#import "UIView+Frame.h"
#import "UIImageView+WebCache.h"

#define Ratio 618/480

//@interface DJPlayerCell : <#superclass#>
@interface DJPlayerCell()

@property (nonatomic, strong)UIImageView * iconImage;// 用户头像
@property (nonatomic, strong)UILabel * nameLabel;// 用户姓名
@property (nonatomic, strong)UIButton * address;// 用户地址
@property (nonatomic, strong)UILabel *peopleNumber;// 观看人数
@property (nonatomic, strong)UIImageView * coverImage;// 封面
@end
@implementation DJPlayerCell

- (void)awakeFromNib {
    // Initialization code
    
    
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self addSubview:self.iconImage];
        [self addSubview:self.nameLabel];
        [self addSubview:self.address];
        [self addSubview:self.peopleNumber];
        [self addSubview:self.coverImage];
        
    }
    return self;
    
//    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        //添加子控件
//        [self addSubview:self.iconImage];
//        [self addSubview:self.nameLabel];
//        [self addSubview:self.address];
//        [self addSubview:self.peopleNumber];
//        [self addSubview:self.coverImage];
//        
//    }
//    return self;
}

//懒加载子控件
- (UIImageView *)iconImage
{
    if (!_iconImage) {
        
        self.iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 45, 45)];
        //_iconImage.backgroundColor = [UIColor redColor];
        _iconImage.layer.cornerRadius = _iconImage.frame.size.width/2;
        _iconImage.layer.masksToBounds = YES;
        CALayer *layer = [_iconImage layer];
        layer.borderColor = [[UIColor purpleColor] CGColor];
        layer.borderWidth = 1.5f;
    }
    return _iconImage;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init ];
        _nameLabel.frame = CGRectMake(_iconImage.dj_x+_iconImage.dj_width+10, _iconImage.dj_y, _nameLabel.dj_screenW, _iconImage.dj_height/2);
        _nameLabel.text = @"映客";
        //_nameLabel.textColor = [UIColor blackColor];
        _nameLabel.font = [UIFont systemFontOfSize:14];
    }
    return _nameLabel;
}



- (UIButton *)address
{
    if (!_address) {
        self.address = [UIButton buttonWithType:(UIButtonTypeCustom)];
//        _address.frame = CGRectMake(_nameLabel.frame.origin.x, _nameLabel.frame.origin.y+_nameLabel.frame.size.height, _address.dj_screenW/2, _nameLabel.frame.size.height);
        
        _address.frame = CGRectMake(_nameLabel.frame.origin.x, _nameLabel.frame.origin.y+_nameLabel.frame.size.height, _address.dj_screenW/2, _nameLabel.frame.size.height);
        [_address setImage:[UIImage imageNamed:@"address"] forState:(UIControlStateNormal)];
        [_address setTitle:@"中国" forState:(UIControlStateNormal)];
        [_address setTitleColor:[UIColor lightGrayColor] forState:(UIControlStateNormal)];
        _address.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _address.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0);
        _address.titleLabel.font = [UIFont systemFontOfSize:12];
        
    }
    return _address;
}

- (UILabel *)peopleNumber
{
    if (!_peopleNumber) {
//        self.peopleNumber = [[UILabel alloc] initWithFrame:CGRectMake(_address.frame.origin.x+_address.frame.size.width, _address.frame.origin.y, _peopleNumber.dj_screenW/3-40, _address.frame.size.height)];
        
        self.peopleNumber = [[UILabel alloc] init];
        self.peopleNumber.frame = CGRectMake(_address.frame.origin.x+_address.frame.size.width, _address.frame.origin.y, _peopleNumber.dj_screenW/3-40, _address.frame.size.height);
        
        
        _peopleNumber.text = @"9999";
        _peopleNumber.textColor = [UIColor purpleColor];
        _peopleNumber.font = [UIFont systemFontOfSize:15];
        _peopleNumber.textAlignment = NSTextAlignmentRight;
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(_peopleNumber.frame.origin.x + _peopleNumber.frame.size.width, _peopleNumber.frame.origin.y + 1.5, 30, _peopleNumber.frame.size.height)];
        label.text = @" 在看";
        label.textColor = [UIColor lightGrayColor];
        label.font = [UIFont systemFontOfSize:11];
        label.textAlignment = NSTextAlignmentLeft;
        [self addSubview:label];
        
        
    }
    return _peopleNumber;
}

- (UIImageView *)coverImage
{
    if (!_coverImage) {
    //为何这里用initWithFrame就无法显示呢?
//        _coverImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, _iconImage.frame.origin.y+_iconImage.frame.size.height +10,_coverImage.dj_screenW, ([UIScreen mainScreen].bounds.size.width * Ratio) + 1 - _iconImage.frame.size.height - 20)];
        
        self.coverImage = [[UIImageView alloc] init ];
        self.coverImage.frame = CGRectMake(0, _iconImage.frame.origin.y+_iconImage.frame.size.height +10, self.coverImage.dj_screenW, ([UIScreen mainScreen].bounds.size.width * Ratio) + 1 - _iconImage.frame.size.height - 20);
        
//        _coverImage = [[UIImageView alloc] init];
//        _coverImage.frame =  CGRectMake(0, _iconImage.frame.origin.y+_iconImage.frame.size.height +10,_coverImage.dj_screenW, ([UIScreen mainScreen].bounds.size.width * Ratio) + 1 - _iconImage.frame.size.height - 20);
    }
    return _coverImage;
}

//设置数据
- (void)setVideo:(DJVideo *)video
{
    _video = video;
    // 用户名
    _nameLabel.text = video.name;
    
    // 用户所在城市
    if ([video.city isEqualToString:@""]) {
        [_address setTitle:@"难道在火星?" forState:(UIControlStateNormal)];
    }else{
        [_address setTitle:video.city forState:(UIControlStateNormal)];
    }
    
    // 用户Image
    [_iconImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.meelive.cn/%@",video.portrait]]];
    // 封面Image
    [_coverImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.meelive.cn/%@",video.portrait]]];
    
    // 观看人数
    _peopleNumber.text = [NSString stringWithFormat:@"%d",video.online_users];
}
   

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
