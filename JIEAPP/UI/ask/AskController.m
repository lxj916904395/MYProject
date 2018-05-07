//
//  AskController.m
//  JIEAPP
//
//  Created by 梁显杰 on 2018/1/11.
//  Copyright © 2018年 jie. All rights reserved.
//

#import "AskController.h"

#import "FBannerView.h"
@interface AskController ()

@end

@implementation AskController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *images = ({
        NSArray *array = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"text"];
        array;
    });
    
    FBannerView *banner = [[FBannerView alloc] initWithFrame:CGRectMake(0, kNavBarHeight, kScreenWWidth, 200) images:images time:1 click:^(NSInteger index) {
        NSLog(@"点击了第 %zd 张",index);
    }];
   
    [self.view addSubview:banner];
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
