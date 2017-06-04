//
//  SYWaterAnimationView.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 17/2/8.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import "SYWaterAnimationView.h"

/**
 正弦型函数解析式：y=Asin（ωx+φ）+h
 各常数值对函数图像的影响：
 φ（初相位）：决定波形与X轴位置关系或横向移动距离（左加右减）
 ω：决定周期（最小正周期T=2π/|ω|）
 A：决定峰值（即纵向拉伸压缩的倍数）
 h：表示波形在Y轴的位置关系或纵向移动距离（上加下减）
 */

@interface SYWaterAnimationView ()
{
//    // 波浪振幅
//    CGFloat waveAmplitude;
//    // 波浪周期
//    CGFloat wavePeriod;
//    // 波浪水平位移
//    CGFloat waveOffsetX;
//    // 当前波浪高度
//    CGFloat waveCurrentHeight;
//    // 波浪速度
//    CGFloat waveSpeed;
//    // 波浪宽
//    CGFloat waveWidth;
//    
//    // 水颜色
//    UIColor *waterColor;
//    // 波浪颜色
//    UIColor *waveColor;
    
    CAShapeLayer *firstWaveLayer;
    CAShapeLayer *secondWaveLayer;
    
    CADisplayLink *waveDisplaylink;
}

/// 波浪水平位移（默认：0.0）
@property (nonatomic, assign) CGFloat waveOffsetX;

@end

@implementation SYWaterAnimationView

#pragma mark - 实例

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.layer.masksToBounds = YES;
        
        [self initializeData];
        
        [self waterAnimation];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame waveColor:(UIColor *)wavecolor waterColor:(UIColor *)watercolor
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.layer.masksToBounds = YES;
        
        [self initializeData];
        
        _waveColor = wavecolor;
        _waterColor = watercolor;
        
        [self waterAnimation];
    }
    
    return self;
}

- (void)animationWaterInvalidate
{
    if (waveDisplaylink)
    {
        [waveDisplaylink invalidate];
    }
}

- (void)dealloc
{
    NSLog(@"波浪动画视图(%@)被释放了", self);
}

#pragma mark - 初始化默认值

- (void)initializeData
{
    // 水纹振幅
    _waveAmplitude = 8.0;
    // 水纹周期
    _wavePeriod = 2 * (M_PI) / self.bounds.size.width;
    // 波浪水平位移
    _waveOffsetX = 0.0;
    // 当前波浪高度-屏幕居中
    _waveCurrentHeight = self.bounds.size.height / 2;
    // 波浪速度
    _waveSpeed = 0.15 / (M_PI);
    // 波浪宽
    _waveWidth = self.bounds.size.width;
    
    _waveColor = [UIColor colorWithRed:(73 / 255.0) green:(142 / 255.0) blue:(178 / 255.0) alpha:0.5];
    _waterColor = [UIColor colorWithRed:(73 / 255.0) green:(142 / 255.0) blue:(178 / 255.0) alpha:0.5];
}

#pragma mark - 波浪动画

- (void)waterAnimation
{
    //
    firstWaveLayer = [[CAShapeLayer alloc] init];
    firstWaveLayer.strokeStart = 0.0;
    firstWaveLayer.strokeEnd = 0.8;
    // 设置闭环的颜色
    firstWaveLayer.fillColor = _waterColor.CGColor;
    // 设置边缘线的颜色
    firstWaveLayer.strokeColor = _waveColor.CGColor;
    
    
    
    //
    secondWaveLayer = [[CAShapeLayer alloc] init];
    secondWaveLayer.strokeStart = 0.0;
    secondWaveLayer.strokeEnd = 0.8;
    // 设置闭环的颜色
    secondWaveLayer.fillColor = _waterColor.CGColor;
    // 设置边缘线的颜色
    secondWaveLayer.strokeColor = _waveColor.CGColor;
    
    
    [self.layer addSublayer: firstWaveLayer];
    [self.layer addSublayer: secondWaveLayer];

    
    //
    waveDisplaylink = [CADisplayLink displayLinkWithTarget:self selector:@selector(getCurrentWave)];
    [waveDisplaylink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)getCurrentWave
{
    // 实时位移
    _waveOffsetX += _waveSpeed;
    [self setCurrentFirstWaveLayerPath];
}

- (void)setCurrentFirstWaveLayerPath
{
    CGFloat y = _waveCurrentHeight;
    
    // 创建一个路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0.0, y);
    
    for (int i = 0; i < (int)(_waveWidth); i++)
    {
        y = _waveAmplitude * sin(_wavePeriod * (CGFloat)(i) + _waveOffsetX) + _waveCurrentHeight;
        CGPathAddLineToPoint(path, NULL, (CGFloat)i, y);
    }
    
    CGPathAddLineToPoint(path, NULL, _waveWidth, self.bounds.size.height);
    CGPathAddLineToPoint(path, NULL, 0.0, self.bounds.size.height);
    CGPathCloseSubpath(path);
    
    firstWaveLayer.path = path;
    
    // 创建一个路径
    CGFloat y2 = _waveCurrentHeight;
    CGMutablePathRef path2 = CGPathCreateMutable();
    CGPathMoveToPoint(path2, NULL, 0.0, y);
    
    for (int i = 0; i < (int)(_waveWidth); i++)
    {
        y2 = _waveAmplitude * sin(_wavePeriod * (CGFloat)(i) + _waveOffsetX - _waveWidth / 2) + _waveCurrentHeight;
        CGPathAddLineToPoint(path2, NULL, (CGFloat)i, y2);
    }
    
    CGPathAddLineToPoint(path2, NULL, _waveWidth, self.bounds.size.height);
    CGPathAddLineToPoint(path2, NULL, 0.0, self.bounds.size.height);
    CGPathCloseSubpath(path2);
    secondWaveLayer.path = path2;
}

#pragma mark - setter

- (void)setWaterColor:(UIColor *)waterColor
{
    _waterColor = waterColor;
    if (_waterColor)
    {
        // 设置闭环的颜色
        firstWaveLayer.fillColor = _waterColor.CGColor;
        secondWaveLayer.fillColor = _waterColor.CGColor;
    }
}

- (void)setWaveColor:(UIColor *)waveColor
{
    _waveColor = waveColor;
    if (_waveColor)
    {
        // 设置边缘线的颜色
        firstWaveLayer.strokeColor = _waveColor.CGColor;
        secondWaveLayer.strokeColor = _waveColor.CGColor;
    }
}

@end
