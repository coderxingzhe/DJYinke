//
//  DJHotController.m
//  DJYinke
//
//  Created by Mac on 16/7/23.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import "DJHotController.h"
#import "DJVideo.h"
#import "DJPlayerCell.h"
#import "DJPlayerViewController.h"
#import "DJNewViewController.h"
#import "ODRefreshControl.h"
#import "UIView+Frame.h"

#define scale 618/480
static NSString *ID = @"cell";
@interface DJHotController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *videos;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation DJHotController

- (NSMutableArray *)videos
{
    if (_videos == nil)
    {
        _videos = [[NSMutableArray alloc] init];
    }
    return _videos;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //加载数据
    [self loadData];
    
    //添加tableView
    [self setupTableView];
    
    //加载下拉刷新
    [self addRefresh];
}

//加载数据
- (void)loadData
{
    __weak __typeof(self)vc = self;
    //移除所有数据
    [self.videos removeAllObjects];
    
    [DJVideo loadVideosWithResult:^(NSArray * result) {
        //抛出数据
        vc.videos  = result;
        //[self.videos addObject:result];
        //NSLog(@"\n视频1%@-%p",self.videos);
        [vc.tableView reloadData];
    }];
    //[self loadData];1其实加载到了数据,只是是异步后来了,要刷新2还要数组实例化 2刷新写错了
    
}


- (void)setupTableView
{
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 25,djScreenW , djScreenH) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    //tableView.rowHeight = self.view.bounds.size.width * (640/480);
    tableView.rowHeight = [UIScreen mainScreen].bounds.size.width * scale +1;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.showsVerticalScrollIndicator = NO;
    //tableView.backgroundColor = [UIColor redColor];
    [self.view addSubview:tableView];
    _tableView = tableView;
    //注册cell
    [self.tableView registerClass:[DJPlayerCell class] forCellReuseIdentifier:ID];
    
    //让列表不延伸至tabbar
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
}

- (void)addRefresh
{
    ODRefreshControl *refreshControl = [[ODRefreshControl alloc] initInScrollView:self.tableView];
    [refreshControl addTarget:self action:@selector(dropViewDidBeginRefreshing:) forControlEvents:UIControlEventValueChanged];
}


- (void)dropViewDidBeginRefreshing:(ODRefreshControl *)refreshControl
{
    double delayInSeconds = 3.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [refreshControl endRefreshing];
    });
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"视频个数%ld",self.videos.count);
    return self.videos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DJPlayerCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];

    //获取当前模型
    DJVideo *video = self.videos[indexPath.row];
    NSLog(@"获取当前模型%@",video);
    cell.video = video;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //跳转到播放页面
    DJPlayerViewController *playerVC = [[DJPlayerViewController alloc] init];
    DJNewViewController *newVC = [[DJNewViewController alloc] init];
    
    //获取当前模型
    DJVideo * video = self.videos[indexPath.row];
    playerVC.liveStr = video.url;
    playerVC.bgImgStr = video.portrait;
    
    [self.navigationController pushViewController:playerVC animated:YES];
    
    //隐藏
    [self.navigationController setNavigationBarHidden:YES];
    self.tabBarController.tabBar.hidden = YES;
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
