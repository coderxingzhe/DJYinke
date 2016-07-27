//
//  DJNavViewController.m
//  DJYinke
//
//  Created by Mac on 16/7/20.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import "DJNavViewController.h"

@interface DJNavViewController ()

@end

@implementation DJNavViewController

+ (void)initialize
{
    //设置全局图片
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"global_background"] forBarMetrics:UIBarMetricsDefault];
    // 设置导航条标题文字的属性：颜色和字体
    NSMutableDictionary *attrbutes = [NSMutableDictionary dictionary];
    attrbutes[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attrbutes[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    [bar setTitleTextAttributes:attrbutes];
    // 设置导航条返回按钮的箭头颜色
    bar.tintColor = [UIColor whiteColor];
    
    //设置item样式
    // 获得全局的item主题
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    // 设置导航条标题文字的属性：颜色和字体
    NSMutableDictionary *itemAttrbutes = [NSMutableDictionary dictionary];
    itemAttrbutes[NSForegroundColorAttributeName] = [UIColor whiteColor];
    itemAttrbutes[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    [item setTitleTextAttributes:itemAttrbutes forState:UIControlStateNormal];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
