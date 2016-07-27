//
//  DJPreViewController.m
//  DJ_Yinke
//
//  Created by Mac on 16/7/26.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import "DJPreViewController.h"
#import "DJCameraController.h"
#import <GPUImage/GPUImage.h>

@interface DJPreViewController ()

@property (nonatomic, strong) UIImageView *backgroundView;

@end

@implementation DJPreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置背景图片高斯模糊
    [self addGaussianImage];
}
#pragma mark ---- <设置背景图片高斯模糊>
- (void)addGaussianImage {
    
    GPUImageGaussianBlurFilter * blurFilter = [[GPUImageGaussianBlurFilter alloc] init];
    blurFilter.blurRadiusInPixels = 2.0;
    UIImage * image = [UIImage imageNamed:@"bg_zbfx"];
    UIImage *blurredImage = [blurFilter imageByFilteringImage:image];
    
    self.backgroundView = [[UIImageView alloc] init];
    self.backgroundView.image = blurredImage;
    self.backgroundView.frame = self.view.bounds;
    [self.view addSubview:self.backgroundView];
    [self.view sendSubviewToBack:self.backgroundView];
}


- (IBAction)cancle {
    
    [self dismissViewControllerAnimated:YES completion:^{
        //
    }];
}
- (IBAction)beginPlay
{
    DJCameraController *cameraVC = [[DJCameraController alloc] init];
    //self.view = cameraVC.view;
    [self.view addSubview:cameraVC.view];
}
- (IBAction)nameLabel:(UITextField *)sender
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
