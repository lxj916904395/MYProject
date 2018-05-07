//
//  IndexController.m
//  JIEAPP
//
//  Created by 梁显杰 on 2018/1/11.
//  Copyright © 2018年 jie. All rights reserved.
//

#import "IndexController.h"

#import "ChannelInfo.h"
#import "IndexItemController.h"
#import "TitleScrollView.h"


@interface IndexController ()

@property (strong , nonatomic) TitleScrollView *titleScrollView;
@property (strong , nonatomic) UIScrollView *contentScrollView;

@property (strong , nonatomic) NSMutableArray *titlesArr;
@end

@implementation IndexController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
    
}

- (void)setUI{
    self.contentScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;

    [self.titlesArr addObjectsFromArray:[ChannelInfo findAll]];
    
    [self.view addSubview:self.titleScrollView];
    [self.view addSubview:self.contentScrollView];
    
    [self setChildControllers];
    [self setBlock];
    
    [self.titleScrollView begainLoad];
}

- (NSMutableArray *)titlesArr {
    lazyMutableArray(_titlesArr);
}

- (TitleScrollView *)titleScrollView {
    if (!_titleScrollView){
        _titleScrollView = [[TitleScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWWidth, kNavBarHeight)
                                                            titles:self.titlesArr
                                                 contentScrollView:self.contentScrollView];
    }
    return _titleScrollView;
}

- (UIScrollView *)contentScrollView {
    if (!_contentScrollView){
        CGFloat height = kScreenHeight-kNavBarHeight-kTabBarHeight;
        
        _contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,kNavBarHeight,kScreenWWidth,height)];
   
        _contentScrollView.showsHorizontalScrollIndicator = NO;

        //开启分页
        _contentScrollView.pagingEnabled = YES;
        //没有弹簧效果
        _contentScrollView.bounces = NO;

        _contentScrollView.contentSize = CGSizeMake(self.titlesArr.count*kScreenWWidth, _contentScrollView.height);
    }
    return _contentScrollView;
}

- (void)setChildControllers{
    NSInteger count = self.titlesArr.count;
    
    for (int i = 0; i < count; i++) {

        ChannelInfo *info = self.titlesArr[i];

        IndexItemController *indexItemController = [[IndexItemController alloc] init];
        indexItemController.cid = info.url;

        [self addChildViewController:indexItemController];
    }
}

- (void)setBlock{
    kWeakSelf;
    self.titleScrollView.showControllerBlock = ^(NSInteger index){

        UIViewController *child = weakSelf.childViewControllers[index];
        
        if ([child isViewLoaded])return;
        
        child.view.frame = CGRectMake(index*kScreenWWidth, 0, weakSelf.contentScrollView.width, weakSelf.contentScrollView.height);
        [weakSelf.contentScrollView addSubview:child.view];
    };
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated] ;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated] ;
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

