//
// Created by 梁显杰 on 2018/1/12.
// Copyright (c) 2018 jie. All rights reserved.
//

#import "IndexItemController.h"
#import "MJRefreshNormalHeader.h"

#import "IndexViewModel.h"
#import "NewsViewModel.h"

#import "NewsDefaultCell.h"

@interface IndexItemController ()

@property (strong , nonatomic) NewsViewModel *viewModel;
@property (strong , nonatomic) NSArray *datas;
@end

@implementation IndexItemController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUI];

}

- (void)setUI {

    self.tableView.contentInset = UIEdgeInsetsMake(0, kNavBarHeight, 0, 0);
    self.clearsSelectionOnViewWillAppear = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    
    
    kWeakSelf;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNew)];
    
    self.tableView.mj_footer = [MJRefreshFooter footerWithRefreshingBlock:^{
        [weakSelf loadOld];
    }];
    
    self.tableView.tableFooterView = [UIView new];
    
    [self.tableView registerClass:[NewsDefaultCell class] forCellReuseIdentifier:@"cell"];
   
}

- (NewsViewModel *)viewModel {

    if (!_viewModel){
        _viewModel = [[NewsViewModel alloc] initWithCid:self.cid];
    }
    return _viewModel;
}

- (void)loadNew{
    [self loadData:NewsDataTypeNew];
}

- (void)loadOld{
    [self loadData:NewsDataTypeOld];
}

- (void)loadData:(int)dataType{

    @weakify(self);
    [self.viewModel.command.executionSignals.switchToLatest subscribeNext:^(NSArray * array) {
        @strongify(self);

        self.datas = array;
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];

        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_header endRefreshing];
    }];

    [self.viewModel.command execute:[NSString stringWithFormat:@"%d",dataType]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.datas.count >0){
        id model = self.datas[indexPath.row];
        CGFloat height =  [tableView cellHeightForIndexPath:indexPath
                                                      model:model keyPath:@"model"
                                                  cellClass:[NewsDefaultCell class] contentViewWidth:kScreenWWidth];
        return height;
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.datas.count >0){
        return self.datas.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.datas.count >0) {
        NewsDefaultCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        
        [cell useCellFrameCacheWithIndexPath:indexPath tableView:tableView];
        [cell cellConfig:self.datas[indexPath.row]];
        
        return cell;
    }
    
    return [UITableViewCell new];
}


@end
