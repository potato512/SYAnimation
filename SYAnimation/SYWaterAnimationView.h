//
//  SYWaterAnimationView.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 17/2/8.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//  波浪动画
//  github：https://github.com/potato512/SYAnimation


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <CoreGraphics/CoreGraphics.h>

@interface SYWaterAnimationView : UIView

/// 波浪振幅（默认：8.0）
@property (nonatomic, assign) CGFloat waveAmplitude;
/// 波浪周期（默认：2 * (M_PI) / self.bounds.size.width）
@property (nonatomic, assign) CGFloat wavePeriod;
/// 当前波浪高度（默认：self.bounds.size.height / 2，即父视图屏幕居中，数值越小越高）
@property (nonatomic, assign) CGFloat waveCurrentHeight;
/// 波浪速度（默认：0.15 / (M_PI)）
@property (nonatomic, assign) CGFloat waveSpeed;
/// 波浪宽（默认：self.bounds.size.width）
@property (nonatomic, assign) CGFloat waveWidth;

/// 水颜色（默认：[UIColor colorWithRed:(73 / 255.0) green:(142 / 255.0) blue:(178 / 255.0) alpha:0.5]）
@property (nonatomic, strong) UIColor *waterColor;
/// 波浪颜色（默认：[UIColor colorWithRed:(73 / 255.0) green:(142 / 255.0) blue:(178 / 255.0) alpha:0.5]）
@property (nonatomic, strong) UIColor *waveColor;


/**
 *  波浪动画
 *
 *  @param frame      原点尺寸
 *  @param wavecolor  波浪颜色
 *  @param watercolor 水颜色
 *
 *  @return UIView
 */
- (instancetype)initWithFrame:(CGRect)frame waveColor:(UIColor *)wavecolor waterColor:(UIColor *)watercolor;

/**
 *  释放动画资源
 */
- (void)animationWaterInvalidate;

@end
