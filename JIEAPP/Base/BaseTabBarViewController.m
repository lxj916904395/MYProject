//
//  BaseTabBarViewController.m
//  JIEAPP
//
//  Created by 梁显杰 on 2018/1/11.
//  Copyright © 2018年 jie. All rights reserved.
//

#import "BaseTabBarViewController.h"

#import "IndexController.h"
#import "MyController.h"
#import "QuoteController.h"
#import "AskController.h"

#import "BaseNaviViewController.h"

#import "CustomTabBar.h"
@interface BaseTabBarViewController ()
    
    @end

@implementation BaseTabBarViewController
    

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]}
                                             forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor]}
                                             forState:UIControlStateNormal];

// 利用KVO来使用自定义的tabBar
    [self setValue:[[CustomTabBar alloc] init] forKey:@"tabBar"];
    [self setTabBar];
    
}
    
- (void)setTabBar{
    IndexController *index = [[IndexController alloc] init];
    BaseNaviViewController *indexNavi = [[BaseNaviViewController alloc] initWithRootViewController:index];
    index.title = @"首页";
    [self setTabBarImage:indexNavi index:0];
    
    QuoteController *quote = [[QuoteController alloc] init];
    BaseNaviViewController *quoteNavi = [[BaseNaviViewController alloc] initWithRootViewController:quote];
    quote.title = @"报价";
    [self setTabBarImage:quoteNavi index:1];
    
    AskController *ask = [[AskController alloc] init];
    BaseNaviViewController *askNavi = [[BaseNaviViewController alloc] initWithRootViewController:ask];
    ask.title = @"问答";
    [self setTabBarImage:askNavi index:2];

    
    MyController *my = [[MyController alloc] init];
    BaseNaviViewController *myNavi = [[BaseNaviViewController alloc] initWithRootViewController:my];
    my.title = @"我的";
    [self setTabBarImage:myNavi index:3];

    
    self.viewControllers = @[indexNavi,quoteNavi,askNavi,myNavi];
}

- (void)setTabBarImage:(BaseNaviViewController *)navi index:(int)index{
    
    switch (index) {
        case 0:
            navi.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_icon_home_pre"];
            navi.tabBarItem.image = [UIImage imageNamed:@"tabbar_icon_home"];
        
        break;
        
        case 1:
            navi.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_icon_car_pre"];
            navi.tabBarItem.image = [UIImage imageNamed:@"tabbar_icon_car"];
        break;
        
        case 2:
            navi.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_icon_ask_pre"];
            navi.tabBarItem.image = [UIImage imageNamed:@"tabbar_icon_ask"];
        break;
        
        case 3:
            navi.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_icon_my_pre"];
            navi.tabBarItem.image = [UIImage imageNamed:@"tabbar_icon_my"];
        break;
    }
    
    
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

