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
        NSArray *array = @[@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=241170661,3235713291&fm=27&gp=0.jpg",
                           @"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1657043272,3404733096&fm=27&gp=0.jpg",
                           @"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=4028248642,1678862262&fm=200&gp=0.jpg",
                           @"http://img0.imgtn.bdimg.com/it/u=1488042928,871516940&fm=27&gp=0.jpg",
                           @"http://img3.imgtn.bdimg.com/it/u=1921887058,127248869&fm=27&gp=0.jpg"];
        array;
    });
    
    FBannerView *banner = [[FBannerView alloc] initWithFrame:CGRectMake(0, kNavBarHeight, kScreenWWidth, 200) images:images duration:1 placeholderImage:[UIImage imageNamed:@"text.jpg"] click:^(NSInteger index) {
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
