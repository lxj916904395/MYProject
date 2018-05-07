//
// Created by 梁显杰 on 2018/1/12.
// Copyright (c) 2018 jie. All rights reserved.
//

#import "TitleScrollView.h"

#import "ChannelInfo.h"

static int const labelWith = 100;


@interface TitleScrollView()<UIScrollViewDelegate>

@property (strong , nonatomic) NSArray *titles;
@property (strong , nonatomic) NSMutableArray *Labels;
@property  (strong , nonatomic) UIScrollView *contentScrollView;
@property  (strong , nonatomic) UIScrollView *titleScrollView;
@property (assign ,nonatomic) BOOL isCenter;// 频道是否居中

@end

@implementation TitleScrollView

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles contentScrollView:(UIScrollView *)contentScrollView{
    if (self = [super initWithFrame:frame]){
        self.userInteractionEnabled = YES;
        
        self.titles = titles;
        self.contentScrollView = contentScrollView;

        [self addSubview:self.titleScrollView];
        
        [self setLables];
        [self setScrollView];
    }
    return self;
}

- (UIScrollView *)titleScrollView {

    if (!_titleScrollView){
        _titleScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWWidth, self.height)];
        _titleScrollView.showsHorizontalScrollIndicator = NO;
    }
    return _titleScrollView;
}

- (NSMutableArray *)Labels {
    lazyMutableArray(_Labels);
}

- (void)setScrollView{
    NSInteger count = self.titles.count;
    //设置标题滚动条
    self.titleScrollView.contentSize = CGSizeMake(count * labelWith, 0);
    self.titleScrollView.showsHorizontalScrollIndicator = NO;


    //设置协议
    self.contentScrollView.delegate = self;
    
}

- (void)setLables{
    __block CGFloat lblX = 13;
    CGFloat lblY = kStatusBarHeight+3;
    CGFloat offset = 30;
    CGFloat startX = lblX;
    
    for (int i = 0; i < [self.titles count]; i++) {
        ChannelInfo *model =  self.titles[i];
        
        UILabel *lbl1 = [[UILabel alloc]init];
        lbl1.text = model.title;
        lbl1.font = kFont16;
        lbl1.textAlignment = NSTextAlignmentCenter;
        lbl1.textColor = [UIColor grayColor];
        
        [lbl1 sizeToFit];
        [lbl1 setOrigin:CGPointMake(lblX, lblY+(self.titleScrollView.height-lbl1.height-lblY)/2)];
        
        lblX += lbl1.width+offset;
        
        lbl1.tag = i;
        lbl1.userInteractionEnabled = YES;
        
        [lbl1 addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelTap:)]];
        
        [self.titleScrollView addSubview:lbl1];
        [self.Labels addObject:lbl1];
    }

    
    self.titleScrollView.contentSize = CGSizeMake(lblX, 0);
    
    CGFloat contentWidth = lblX-startX-offset;
    //实际内容宽度小于屏幕宽
    if (contentWidth < kScreenWWidth) {
        self.isCenter = YES;
        self.titleScrollView.bounces = NO;
        lblX = (kScreenWWidth-contentWidth)/2;
        
        [self.titleScrollView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            if ([obj isKindOfClass:[UILabel class]]) {
                [obj setX:lblX];
                lblX+=(obj.width+offset);
            }
        }];
    }

  
}

- (void)begainLoad{
    //默认选中第0个label
    [self titleClick:self.Labels[0]];
}

- (void)labelTap:(UITapGestureRecognizer *)tap{
    UILabel *label = (UILabel*)tap.view;
    [self titleClick:label];
}


//label点击事件
-(void)titleClick:(UILabel*)label{
  
    [self showSelete:label index:label.tag];
}

- (void)showSelete:(UILabel *)label index:(NSInteger)index{
    [self selectLabel:label];

    [self showVC:index];

    //让选中标题居中
    [self setUpTitleCenter:label];

}

-(void)selectLabel:(UILabel *)label{
    
    for (UILabel *la in self.Labels) {
        la.transform = CGAffineTransformIdentity;
        la.textColor = [UIColor blackColor];
    }

    //形变
    label.transform = CGAffineTransformMakeScale(1.3,1.3);
    label.textColor = [UIColor redColor];
}

//设置标题居中
-(void)setUpTitleCenter:(UILabel*)centerLabel{
    //计算偏移量
    CGFloat offsetX = centerLabel.center.x - kScreenWWidth*0.5;

    if (offsetX < 0) {
        offsetX = 0;
    }

    //最大滚动范围
    CGFloat maxOffsetX = self.titleScrollView.contentSize.width - kScreenWWidth;
    if (offsetX > maxOffsetX) {
        offsetX = maxOffsetX;

    }

    //滚动标题滚动条
    if (!self.isCenter) {
          [self.titleScrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    }

}

- (void)showVC:(NSInteger)index{
    [self.contentScrollView setContentOffset:CGPointMake(index*kScreenWWidth, 0) animated:YES];

    self.showControllerBlock?self.showControllerBlock(index):nil;
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    //计算滚动到哪一页
    NSInteger index = scrollView.contentOffset.x/scrollView.bounds.size.width;


    //2.把对应标题选中
    UILabel *label = self.Labels[index];

    [self showSelete:label index:index];
}

//滚动就会调用
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    CGFloat currpage = scrollView.contentOffset.x/kScreenWWidth;

    //左边角标
    NSInteger leftIndex = currpage;

    //右边角标
    NSInteger rightIndex = leftIndex + 1;


    //获取左边label
    UILabel *leftLabel = self.Labels[leftIndex];

    //获取右边label
    UILabel *rightLabel;
    if (rightIndex <= self.Labels.count - 1) {
        rightLabel = self.Labels[rightIndex];
    }

    //计算右边缩放比例 右边自己相对于左边字体变大比例
    CGFloat rightscal = currpage - leftIndex;

    //计算左边缩放比例
    CGFloat leftscal = 1 - rightscal;

    //缩放比例 1~1.3
    //左边缩放比例
    leftLabel.transform = CGAffineTransformMakeScale(leftscal*0.3+1,leftscal*0.3+1);

    //右边缩放比例
    rightLabel.transform = CGAffineTransformMakeScale(rightscal*0.3+1,rightscal*0.3+1);

    //设置文字颜色渐变
    /**RGB 渐变*/
    leftLabel.textColor = [UIColor colorWithRed:leftscal green:0 blue:0 alpha:1];
    rightLabel.textColor = [UIColor colorWithRed:rightscal green:0 blue:0 alpha:1];

}

@end
