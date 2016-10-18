//
//  CoinViewAnimation.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 15-1-25.
//  Copyright (c) 2015年 zhangshaoyu. All rights reserved.
//  硬币翻转效果

#import <UIKit/UIKit.h>

@interface CoinViewAnimation : UIView

/// 硬币翻转效果实例化视图
- (id)initWithFrame:(CGRect)frame view:(UIView *)superview primaryView:(UIView *)primaryView secondaryView:(UIView *)secondaryView;

/// 第一个视图
@property (nonatomic, strong) UIView *primaryView;

/// 第二个视图
@property (nonatomic, strong) UIView *secondaryView;

/// 时间
@property (nonatomic, assign) float spinTime;

@end
