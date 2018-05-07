//
// Created by 梁显杰 on 2018/1/18.
// Copyright (c) 2018 jie. All rights reserved.
//

#import "NewsTableView.h"

#import "NewsDefaultCell.h"


@implementation NewsTableView

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]){
        self.delegate = self;
        self.dataSource = self;
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self registerClass:[NewsDefaultCell class] forCellReuseIdentifier:@"cell"];
        
        
    }
    return self;
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
