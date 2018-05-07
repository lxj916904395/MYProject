//
//  MyController.m
//  JIEAPP
//
//  Created by 梁显杰 on 2018/1/11.
//  Copyright © 2018年 jie. All rights reserved.
//

#import "MyController.h"
#define kHeaderHeight 160
#import "UIViewController+MessageSend.h"
@interface MyController ()<UITableViewDataSource,UITableViewDelegate>{
    CGRect originFrame;
    CGFloat ratio;
}

@property (strong , nonatomic) UITableView *tableView;
@property (strong , nonatomic) UIImageView *headerImageView;
@property (strong , nonatomic) NSMutableArray *itemArrs;
@end

@implementation MyController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.itemArrs addObject:@"评分"];
    [self.itemArrs addObject:@"分享"];
    [self.itemArrs addObject:@"设置"];

    [self.view addSubview:self.headerImageView];
    [self.view addSubview:self.tableView];
    originFrame = self.headerImageView.frame;
    ratio = originFrame.size.width/originFrame.size.height;
    
    self.headerImageView.userInteractionEnabled = YES;
}

- (UITableView *)tableView {
    if (_tableView ==nil){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.headerImageView.bottom, kScreenWWidth, kScreenHeight-kHeaderHeight)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new] ;
        _tableView.backgroundColor = [UIColor clearColor];
    }
    return _tableView;
}

- (UIView *)headerImageView {
    if (_headerImageView == nil){
        _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, kHeaderHeight)];
        _headerImageView.image = [UIImage imageNamed:@"text.jpg"];
        [_headerImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headerTap)]];
    }
    return _headerImageView;
}

- (NSMutableArray *)itemArrs {
    lazyMutableArray(_itemArrs);
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //获取当前活动的tableview
    CGFloat  y = scrollView.contentOffset.y;
    if (scrollView == _tableView) {
        if (y < 0) {
            CGRect rect =  originFrame;
            rect.size.height = rect.size.height-y;
            rect.size.width = rect.size.height*ratio;
            self.headerImageView.frame = rect;
            self.headerImageView.centerX = self.view.centerX;
        }else{
            
            CGRect rect =  originFrame;
            rect.size.height = rect.size.height-y;
            self.headerImageView.frame = rect;
        }
    }
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itemArrs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell==nil?cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:@"cell"]:nil;

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    cell.textLabel.text = self.itemArrs[indexPath.row];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






- (void)viewWillAppear:(BOOL)animated {

    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
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
