//
//  DJPreViewController.m
//  DJYingKe
//
//  Created by Mac on 16/7/19.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import "DJCameraController.h"
#import <GPUImageVideoCamera.h>
#import <GPUImageView.h>
#import <GDLRawDataOutput.h>
#import "DJCamerasBottomView.h"
#import "UIView+Frame.h"


@interface DJCameraController ()



@property (nonatomic, strong) GPUImageVideoCamera *camera;
@property (nonatomic, strong) GDLRawDataOutput *output;

//底部按钮
@property (nonatomic, strong) DJCamerasBottomView  *bottomView;


@end

@implementation DJCameraController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    //开始直播
    [self uploadStream];
    
    //添加底部栏
    [self setupBottomeView];
}



- (void)setupBottomeView
{
    __weak typeof(self) weakSelf = self;
    
    //加载xib
    self.bottomView = [DJCamerasBottomView bottomView];
    _bottomView.frame = CGRectMake(0, djScreenH-60,djScreenW,60);
    _bottomView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_bottomView];
    
    //处理按钮的回调
    _bottomView.btnAction = ^(clickType type)
    {
        switch (type) {
            case clickTypeBack:
                //返回
                [weakSelf playStop];
                break;
            case clickTypeRotate:
                //选中
                [weakSelf.camera rotateCamera];
                break;
                
            default:
                break;
        }
    };

}

//返回,停播
- (void)playStop
{
    // 停止直播
    [self dismissViewControllerAnimated:YES completion:^{
        //
    }];
    
    self.tabBarController.tabBar.hidden = NO;
    
}
                



- (void)uploadStream
{
    //1.0创建摄像头
    self.camera = [[GPUImageVideoCamera alloc] initWithSessionPreset:AVCaptureSessionPreset1280x720 cameraPosition:(AVCaptureDevicePositionBack)];
    //1.1设置帧率
    self.camera.frameRate = 20 ;
    //1.2设置视频方向
    self.camera.outputImageOrientation = UIInterfaceOrientationPortrait;
    
    //2.0创建视频视图
    GPUImageView *imgView = [[GPUImageView alloc] init];
    imgView.frame = self.view.bounds;
    //2.1控制器的view添加视频控件
    [self.view addSubview:imgView];
    //2.2相机定向到视频控件
    [self.camera addTarget:imgView];
    
    
    //3创建输出流
    self.output = [[GDLRawDataOutput alloc] initWithVideoCamera:self.camera withImageSize:CGSizeMake(640, 1136)];
    //3.1把输出管道,添加到相机
    [self.camera addTarget:self.output];
    
    //4摄像头摄影
    [self.camera startCameraCapture];
    
    //5输出流上传
    [self.output startUploadStreamWithURL:@"rtmp://daniulive.com:1935/live" andStreamKey:@"stream238"];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    //
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
