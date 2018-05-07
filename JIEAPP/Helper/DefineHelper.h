//
//  DefineHelper.h
//  JIEAPP
//
//  Created by 梁显杰 on 2018/1/12.
//  Copyright © 2018年 jie. All rights reserved.
//

#ifndef DefineHelper_h
#define DefineHelper_h

//主屏幕的高度
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
//主屏幕的宽度
#define kScreenWWidth  [[UIScreen mainScreen] bounds].size.width
//屏幕宽比例
#define kScreenWidthScale  Main_Screen_Width/320

//状态栏坐标
#define kStatusBarFrame [[UIApplication sharedApplication] statusBarFrame]

//状态栏高
#define kStatusBarHeight (kStatusBarFrame).size.height

//导航条高 + 状态栏高
#define kNavBarHeight kStatusBarHeight + 44.f

#define kDefaultTabBarHeight 49
#define kIPhoneXTabBarHeight 83
#define kTabBarHeight   (kStatusBarHeight>20?kIPhoneXTabBarHeight:kDefaultTabBarHeight)

//主屏幕
#define keyWindow [UIApplication sharedApplication].keyWindow


//当前版本
#define appVersion               [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]

//当前语言
#define CurrentLang                 [[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"] objectAtIndex:0]

//系统名称
#define SystemName                  [[UIDevice currentDevice] systemName]

//当前设备名称
#define CurrentDevice               [[UIDevice currentDevice] name]

//当前设备
#define CurrentModel               [[UIDevice currentDevice] model]

//应用程序的名字
#define AppDisplayName              [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"]

//是否空字符串
#define isEmptyString(string)  string == nil || string == NULL ||[string isKindOfClass:[NSNull class]] || [string isEqualToString: @""]  ||[[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0 ? NO : YES

//懒加载数组
#define lazyMutableArray(_array) \
return !(_array) ? (_array) = [NSMutableArray array] : (_array);


#define kWeakSelf  __weak typeof(self)  weakSelf = self;

//随机色
#define kRandomColor [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0]





#endif /* DefineHelper_h */
