//
// Created by 梁显杰 on 2018/1/17.
// Copyright (c) 2018 jie. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NewsInfo : BaseBean
@property (nonatomic,copy) NSString *cpkey;
/**
 *  标题
 */
@property (nonatomic,copy) NSString *title;
/**
 *  多图数组
 */
@property (nonatomic,strong)NSArray *images;
/**
 *  跟帖人数
 */
@property (assign ,nonatomic) int replyCount;
@property (assign ,nonatomic) int upvoteCount;//点赞数

/**
 *  新闻ID
 */
@property (nonatomic,copy) NSString *pid;

@property (nonatomic,copy) NSString *cid;
@property (nonatomic,copy) NSString *lcid;

/**
 *  图片连接
 */
@property (nonatomic,copy) NSString *imgsrc;


@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *source_name;//来源
@property (nonatomic,copy) NSString *source_logo;//来源图标
@property (nonatomic,copy) NSString *source_pTime;//来源发布时间
@property (assign ,nonatomic) int viewCount;//

@property (nonatomic ,copy) NSDictionary *video;//视频数据

@property (assign,nonatomic) int daoliu_type;//跳转类型
@property (assign,nonatomic) int style_type;//数据类型
@property (assign,nonatomic) int ask_type;//数据类型


@property (nonatomic ,strong) NSString *Space;//上次看到的cell标记,Y：标记是否显示上次看过cell ,S:标记了看过cell，并且重新看过

//社区多出的字段
@property (assign ,nonatomic) int maxImage;//
@property (strong ,nonatomic) NSString *producer;//
@property (strong ,nonatomic) NSString *recoid;//
@property (strong ,nonatomic) NSString *summary;//
@property (strong ,nonatomic) NSString *isBbs;
@property (strong ,nonatomic) NSString *desc;//描述
@property (strong ,nonatomic) NSString *cTime;//
@property (assign ,nonatomic) double localTime;//本地存储时间
@property (strong ,nonatomic) NSString *categoryid;//

@property (strong ,nonatomic) NSString *user_header;

@property(nonatomic,strong) NSString *share_uri;//分享url
@property (strong ,nonatomic) NSArray *replys;//问答回复
@property (assign ,nonatomic) int followCount;//关注数
@property (nonatomic ,strong) NSDictionary *user_affection;//点赞，关注信息

@property (assign ,nonatomic) BOOL islimitHeight;//是否限制高度
@property (assign ,nonatomic) BOOL isShowAll;//是否是显示了全全部文字
@property (assign ,nonatomic) CGFloat descHeight;//描述总高

@property (strong ,nonatomic) NSString *itemsId;//对应请求返回的id顺序
@property (assign ,nonatomic) BOOL isAsk;

+ (void)save:(NSArray *)array cid:(NSString *)cid;

@end