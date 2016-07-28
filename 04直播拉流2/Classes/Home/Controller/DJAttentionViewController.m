//
//  DJAttentionViewController.m
//  DJYinke
//
//  Created by Mac on 16/7/21.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import "DJAttentionViewController.h"

@interface DJAttentionViewController ()

@end

@implementation DJAttentionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"welcome_1"]];
    imageView.frame = self.view.bounds;
    [self.view addSubview:imageView];
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
