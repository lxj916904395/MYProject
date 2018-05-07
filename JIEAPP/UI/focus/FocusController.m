//
// Created by 梁显杰 on 2018/1/12.
// Copyright (c) 2018 jie. All rights reserved.
//

#import "FocusController.h"


@implementation FocusController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];

    self.view.userInteractionEnabled = YES;

    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(diss)]];
}

- (void)diss{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end