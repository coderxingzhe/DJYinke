//
//  DJNewViewController.m
//  DJYinke
//
//  Created by Mac on 16/7/21.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import "DJNewViewController.h"

@interface DJNewViewController ()

@end

@implementation DJNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"welcome_2"]];
    
    imageView.frame = self.view.bounds;
    
    [self.view addSubview:imageView];
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
