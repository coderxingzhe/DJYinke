//
//  DJMeController.m
//  DJ_Yinke
//
//  Created by 段自强 on 16/7/30.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import "DJMeController.h"
#import "DJMetopView.h"
#import "DJMeMiddleView.h"
#import "UIView+Frame.h"
#import "Masonry.h"

@interface DJMeController () <UITableViewDelegate,UITableViewDataSource>

//数据
@property (nonatomic, strong)  NSArray *datas;

//topView
@property (nonatomic, strong) UIButton *topBtn;
@property (nonatomic, strong) UIView *introView;
@property (nonatomic, strong) DJMetopView *topView;
@property (nonatomic, strong) DJMeMiddleView *meMiddleView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UISwitch *switchs;

@end

@implementation DJMeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //将自定义的View放在tabView 的上面，而不是作为tableView.tableHeaderView
    [self setupTableView];
    
    
    //   self.edgesForExtendedLayout = UIRectEdgeNone;
    //隐藏navigationbar和tableHeaderView
    self.navigationController.navigationBarHidden = YES;
    //_tableView.tableHeaderView.hidden = YES;
    
    //注册cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)setupTableView
{
    //创建列表
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    _tableView = tableView;
    //tableView.contentInset = UIEdgeInsetsMake(240 + 200, 0, 0, 0);
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    //创建容器视图
    UIView *introlView = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width, 240+200)];
    _introView = introlView;
    //设置为表头
    self.tableView.tableHeaderView = _introView;
    
    //添加一个分隔视图
    UIView *devideView = [[UIView alloc] init];
    devideView.backgroundColor = [UIColor colorWithRed:231.0/255.0 green:231.0/255.0 blue:231.0/255.0 alpha:1.0];
    [introlView addSubview:devideView];
    
    //添加中控件 xib2
    DJMetopView *topView = [DJMetopView metopView];
    [introlView addSubview:topView];

    //添加上控件 xib1
    DJMeMiddleView *middleView = [DJMeMiddleView meMiddleView];
    //middleView.backgroundColor = [UIColor blueColor];
    [introlView addSubview:middleView];
    
    
    //布局分隔视图
    [devideView mas_makeConstraints:^(MASConstraintMaker *make) {
        //
        make.left.right.bottom.equalTo(introlView);
        make.height.equalTo(@20);
    }];
    
    //布局中部控件
    [middleView mas_makeConstraints:^(MASConstraintMaker *make) {
        //
        make.left.mas_equalTo(introlView);
        make.right.mas_equalTo(introlView);
        make.bottom.mas_equalTo(devideView.mas_top);
        make.height.equalTo(@200);
    }];
    
    
    
    //布局上部控件
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(introlView);//puzzle:为何这里约束top+不约束高度,就不行?
                                     //不过,设置表头又可以了
        make.left.equalTo(introlView);
        make.right.equalTo(introlView);
        //make.height.equalTo(@240);
        make.bottom.mas_equalTo(middleView.mas_top);
    }];
    
    
    
    
    
    //列表监听自己的偏移量属性
    //[_tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    
}

//KVO回掉
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
//{
//    if ([keyPath isEqualToString:@"contentOffset"])
//    {
//        
//        //取出新值
//        CGPoint offset = [change[NSKeyValueChangeNewKey] CGPointValue];
//        NSLog(@"列表偏移量%lf",-offset.y);
//        NSLog(@"_switchs偏移量%lf",_switchs.center.y);
//        
//        //让简介视图跟着动
//        CGRect newFrame = CGRectMake(0, 0, self.view.frame.size.width, -offset.y);
//        _introView.frame = newFrame;
//    }
//}



//MARK: datasource ,delegate

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSString *text = self.datas[indexPath.row];
    cell.textLabel.text = text;
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSArray *)datas
{
    if (_datas == nil)
    {
        _datas = [NSArray arrayWithObjects:@"映票贡献榜",@"实名认证",@"设置", nil];
    }
    return _datas;
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
