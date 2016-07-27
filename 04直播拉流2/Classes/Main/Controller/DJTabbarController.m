//
//  DJTabbarController.m
//  DJYingKe
//
//  Created by Mac on 16/7/19.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import "DJTabbarController.h"
#import "DJHomeViewController.h"
#import "DJCameraController.h"
#import "DJMineViewController.h"
#import "DJNavViewController.h"
#import "DJPreViewController.h"
#import "UIImage+Image.h"

@interface DJTabbarController ()

@end

@implementation DJTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //添加子控制器
    [self addChildVC];
    
    //设置tabBar的按钮内容
    [self setupTabbarBtn];
    
    //添加相机按钮
    [self addCameraBtn];
    
    //添加背景图片和样式
    [self setupBg];
    
    self.delegate = self;
    
    
}

- (void)setupBg
{
    UIImage *bgImage = [UIImage imageNamed:@"tab_bg"];
    
    //拉伸图片
    UIEdgeInsets inset = UIEdgeInsetsMake(40, 100, 40, 100);
    UIImage *resizeImg = [bgImage resizableImageWithCapInsets:inset resizingMode:UIImageResizingModeStretch];
    
    self.tabBar.backgroundImage = resizeImg;
    
    //隐藏阴影线
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
    
    //获得全局标签栏
    UITabBar *bar = [UITabBar appearance];
    // 设置导航条返回按钮的箭头颜色
    //bar.tintColor = [UIColor whiteColor];
    
//
}



- (void)addCameraBtn
{
    UIButton *CameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //内容
    [CameraBtn setImage:[UIImage imageNamed:@"tab_room"] forState:UIControlStateNormal];
    [CameraBtn setImage:[UIImage imageNamed:@"tab_room_p"] forState:UIControlStateHighlighted];
    
    //尺寸自适应
    [CameraBtn sizeToFit];
    //位置在中心
//    CameraBtn.center = self.tabBar.center;
//    CameraBtn.frame.y = self.tabBar.frame.y +5;
     //不能直接修改按钮的结构体,只能修改点.
    
//    CameraBtn.center = CGPointMake(self.tabBar.frame.size.width* 0.5, self.tabBar.frame.origin.y +10 );
//    NSLog(@"1%f",CameraBtn.center.y);
    //这个为何不可? 打印一下就知道了/前者竟然1000多,后者是20
    CameraBtn.center = CGPointMake(self.tabBar.frame.size.width* 0.5, self.tabBar.frame.size.height*0.5+5);
    NSLog(@"2%zd",CameraBtn.center.y);
    
    
    
    //添加目标监听
    [CameraBtn addTarget:self action:@selector(cameraBtnAction) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    //添加到标签栏
    [self.tabBar addSubview:CameraBtn];
    
    
}

- (void)cameraBtnAction
{
    //跳转
    DJPreViewController *preVC = [[DJPreViewController alloc] init];
    [self presentModalViewController:preVC animated:YES];
    
}

- (void) setupTabbarBtn
{
    //home
    DJHomeViewController *homeVC = self.viewControllers[0];
    homeVC.tabBarItem.image = [UIImage imageNamed:@"tab_live"];
    homeVC.tabBarItem.selectedImage = [UIImage imageWithOriginalRenderingMode:@"tab_live_p"];
    
    //live
    DJCameraController *cameraVC = self.viewControllers[1];
    cameraVC.tabBarItem.enabled = NO;
    
    //ME
    DJMineViewController *meVC = self.viewControllers[2];
    meVC.tabBarItem.image = [UIImage imageNamed:@"tab_me"];
    meVC.tabBarItem.selectedImage = [UIImage imageWithOriginalRenderingMode:@"tab_me_p"];
    
    //调整标签栏子项
    UIEdgeInsets insets = UIEdgeInsetsMake(10, 0, -10, 0);
    UIEdgeInsets cameraInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    homeVC.tabBarItem.imageInsets = insets;
    meVC.tabBarItem.imageInsets = insets;
    cameraVC.tabBarItem.imageInsets = cameraInsets;
    
    //隐藏阴影线
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
}

- (void)addChildVC
{
    //home
    DJHomeViewController *homeVC = [[DJHomeViewController alloc] init];
    DJNavViewController *navVC = [[DJNavViewController alloc] initWithRootViewController:homeVC];
    
    //living
    DJCameraController *cameraVC = [[DJCameraController alloc] init];
    DJNavViewController *navVC2 = [[DJNavViewController alloc] initWithRootViewController:cameraVC];
    
    //me
    DJMineViewController *mineVC = [[DJMineViewController alloc] init];
    DJNavViewController *navVC3 = [[DJNavViewController alloc] initWithRootViewController:mineVC];
    
    //添加
    [self addChildViewController:navVC];
    [self addChildViewController:navVC2];
    [self addChildViewController:mineVC];
    
}

//自定义TabBar高度
- (void)viewWillLayoutSubviews {
    
    CGRect tabFrame = self.tabBar.frame;
    
    //打印本来的高度
    //NSLog(@"xxxxx%f",tabFrame.size.height);
    tabFrame.size.height = 60;
    tabFrame.origin.y = self.view.frame.size.height - 60;
    self.tabBar.frame = tabFrame;
    
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
