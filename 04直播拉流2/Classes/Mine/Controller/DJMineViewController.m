//
//  DJMineViewController.m
//  DJYingKe
//
//  Created by Mac on 16/7/19.
//  Copyright © 2016年 DJ. All rights reserved.


#import "DJMineViewController.h"
#import "DJMetopView.h"
#import "DJMeMiddleView.h"
#import "UIView+Frame.h"
#import "Masonry.h"

@interface DJMineViewController () <UITableViewDelegate,UITableViewDataSource>

//数据
@property (nonatomic, strong)  NSArray *datas;

//topView
@property (nonatomic, strong) UIButton *topBtn;
@property (nonatomic, strong) UIView *introView;
@property (nonatomic, strong) DJMetopView *topView;
@property (nonatomic, strong) DJMeMiddleView *meMiddleView;
@property (nonatomic, strong) UITableView *tableView;


@end

@implementation DJMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //添加列表
    [self setupTableView];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.navigationController.navigationBarHidden = YES;
    _tableView.tableHeaderView.hidden = YES;
    
    
    //添加介绍视图
    //[self setupIntroView];
    
    //注册cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
}

- (void)setupTableView
{
    //创建列表
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    //设置外边距
    tableView.contentInset = UIEdgeInsetsMake(240 +200, 0, 0, 0);
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor lightGrayColor];
    _tableView = tableView;
    [self.view addSubview:tableView];//用_tableView效果又不同?
    //NSLog(@"列表%@",NSStringFromCGRect(self.tableView.frame));
    //列表{{0, 0}, {320, 568}}
   
    //创建容器视图
    UIView *introlView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, 440)];
    introlView.backgroundColor = [UIColor redColor];
    [self.view addSubview:introlView];
    _tableView = tableView;
    _introView =introlView;
    
    //添加简介控件xib1
    DJMetopView *topView = [DJMetopView metopView];
    topView.backgroundColor = [UIColor greenColor];
    [introlView addSubview:topView];
    
    //添加等级财富控件xib2
    DJMeMiddleView *middleView = [DJMeMiddleView meMiddleView];
    middleView.backgroundColor = [UIColor blueColor];
    [introlView addSubview:middleView];
    
    //布局中部控件
    [middleView mas_makeConstraints:^(MASConstraintMaker *make) {
        //
        make.left.mas_equalTo(introlView);
        make.right.mas_equalTo(introlView);
        make.bottom.mas_equalTo(introlView);
        make.height.equalTo(@200);
    }];
    //布局上部控件
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(introlView);
        make.height.equalTo(@240);
        make.bottom.mas_equalTo(middleView.mas_top);
        
    }];
    NSLog(@"subviews%@",introlView.subviews);
    NSLog(@"ui1%@",NSStringFromCGRect(middleView.frame));
    NSLog(@"ui2%@",NSStringFromCGRect(topView.frame));
    /*
     ui1{{0, 0}, {320, 180}}
     ui2{{0, 0}, {320, 200}}
    */

    
    
    //我的错误,直接用非鼻祖控件来添加子控件[self.tableView addSubview:introlView];
    //非鼻祖控件,只能重写构造方法添加子控件!!!
    
    
    //列表监听自己的偏移量属性
    [_tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

//KVO回掉
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"contentOffset"])
    {
        
        //取出新值
        CGPoint offset = [change[NSKeyValueChangeNewKey] CGPointValue];
        //让简介视图跟着动
        CGRect newFrame = CGRectMake(0, 0, self.view.frame.size.width, -offset.y);
        _introView.frame = newFrame;
    }
}



//MARK: datasource ,delegate
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


//MARK: Getter
- (UIButton *)topBtn
{
    if (_topBtn == nil)
    {
        _topBtn = [[UIButton alloc] init];
        [_topBtn setTitle:@"送出钻石:0" forState:UIControlStateNormal];
        //_topBtn.imageView.image = [UIImage imageNamed:@""];
        //设置字体
        [_topBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    }
    return _topBtn;
}

- (NSArray *)datas
{
    if (_datas == nil)
    {
        _datas = [NSArray arrayWithObjects:@"映票贡献榜",@"实名认证",@"设置", nil];
    }
    return _datas;
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
