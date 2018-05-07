//
// Created by 梁显杰 on 2018/1/18.
// Copyright (c) 2018 jie. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NewsTableView : UITableView <UITableViewDataSource,UITableViewDelegate>

@property (strong , nonatomic) NSArray *datas;
@property (strong , nonatomic) UIViewController *viewController;

@end