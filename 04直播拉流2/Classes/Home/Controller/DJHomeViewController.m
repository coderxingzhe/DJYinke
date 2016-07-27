//
//  DJHomeViewController.m
//  DJYingKe
//
//  Created by Mac on 16/7/19.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import "DJHomeViewController.h"
#import "DJAttentionViewController.h"
#import "DJNewViewController.h"
#import "UIView+Frame.h"
#import "DJHotController.h"


static NSString *cellID = @"cell";

@interface DJHomeViewController () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UIScrollView *topView;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UIView *lineView;

//选中按钮
@property (nonatomic, strong) UIButton *selectedBtn;

//子游离控制器,不需要自己定义数组,控制器自带子控制器数组
//@property (nonatomic, strong) NSMutableArray *<#name#>;

@end

@implementation DJHomeViewController


#pragma mark 生命周期方法
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置导航栏
    [self setNavgationBar];
    
    //添加导航栏标题控件的子按钮
    [self setupTitleBtn];
    
    //添加子控制器
    [self addsubController];
    
    //添加一个收藏视图
    [self setupCollectionView];//还是不使用懒加载,不能把动态布局写死在懒方法里

}

- (void)setNavgationBar
{
    //search
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"card_search"] style:UIBarButtonItemStylePlain target:self action:@selector(searchItemAction)];
    
    //message
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"card_message"] style:UIBarButtonItemStylePlain target:self action:@selector(messageItemAction)];
    
    //titleView
    self.navigationItem.titleView = self.topView;
    
    
    
}

- (void)setupTitleBtn
{
    //添加三个按钮
    int btnCount = 3;
    for (int i = 0; i < 3; i++)
    {
        CGFloat btnW = _topView.frame.size.width / btnCount;
        CGFloat btnH = _topView.frame.size.height - 9;
        CGFloat btnX = btnW * i;
        CGFloat btnY = 0;
        
        //创建小按钮
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        //设置位置尺寸
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        //btn.backgroundColor = [UIColor blackColor];
        //添加到父控件
        [_topView addSubview:btn];
        
        //根据标识,设置文字和监听
        btn.tag = i;
        [btn addTarget:self action:@selector(topBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self topBtnAction:btn];

        switch (btn.tag)
        {
            case 0:
                [btn setTitle:@"关注" forState:UIControlStateNormal];
                break;
            case 1:
                [btn setTitle:@"热门" forState:UIControlStateNormal];
                break;
            case 2:
                [btn setTitle:@"最新" forState:UIControlStateNormal];
                                break;
                
            default:
                break;
        }
        
       
    }
    //添加下划线
    //方案1使用scrollView.想利用偏移量移动,缺点,有隙缝实现不了
    //方案2UIView,跟着高亮按钮的中心点移动,good!
    UIView *lineView = [[UIView alloc] init];
    lineView.frame = CGRectMake(12, 28, 36, 2);
    lineView.backgroundColor = [UIColor whiteColor];
    _lineView = lineView;
    [_topView addSubview:lineView];
}



- (void)addsubController
{
    DJAttentionViewController *attentionVC = [[DJAttentionViewController alloc] init];
    DJHotController *hotVC = [[DJHotController alloc] init];
    DJNewViewController *newVC = [[DJNewViewController alloc] init];
    [self addChildViewController:attentionVC];
    [self addChildViewController:hotVC];
    [self addChildViewController:newVC];
}


- (void)addContentView
{
    
}



- (void)searchItemAction
{
    
}

- (void)messageItemAction
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 内容收藏视图的数据源方法,代理方法


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.childViewControllers.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    //获取当前子view
    UIViewController *VC = self.childViewControllers[indexPath.row];
    [cell.contentView addSubview:VC.view];
    return cell;
}


#pragma mark 顶部按钮回调方法



- (void)topBtnAction:(UIButton *)btn
{
    //NSLog(@"%ld",(long)selectBtn.tag);
    //设置选择状态，并保存
    _selectedBtn.selected = NO;
    btn.selected = YES;
    _selectedBtn = btn;
    
    
    //改变下划线的位置
    [UIView animateWithDuration:0.25 animations:^{
        
        self.lineView.dj_centerX = btn.dj_centerX;
    }];
    
    
    //改变内容视图的偏移量
    self.collectionView.contentOffset = CGPointMake(self.collectionView.dj_screenW * btn.tag , 0);
    
}


#pragma mark 懒加载
- (UIScrollView *)topView
{
    
        _topView = [[UIScrollView alloc] init];
        _topView.frame = CGRectMake(0, 0, 180, 40);
        //_topView.backgroundColor = [UIColor lightGrayColor];
        
    
    return _topView;
}

#pragma mark 搭建界面
- (void)setupCollectionView
{
    //创建布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //设置布局的大小/间距/滚动方向
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
    //创建收藏视图,并立即添加到父控件
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];

    //让全局指针有实体,让self.collectionView有值,然后就可以跨方法调用
    //不然若在此之前收藏视图添加子控件,将会是空操作
    _collectionView = collectionView;
    
    //添加到控制器view,让控件显示出来.
    [self.view addSubview:self.collectionView];
    
    
    //设置收藏视图的分页等属性
    _collectionView.pagingEnabled = YES;
    _collectionView.bounces = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    
    
    //设置数据源,代理
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
    //注册cell
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellID];
    
    
}



@end
