//
//  AnimationVCFourth.m
//  DemoAnimation
//
//  Created by zhangshaoyu on 17/2/8.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import "AnimationVCFourth.h"
#import <QuartzCore/QuartzCore.h>
#import <CoreGraphics/CoreGraphics.h>
#import "SYViewAnimation.h"
#import "SYWaterAnimationView.h"

@interface AnimationVCFourth ()

@end

@implementation AnimationVCFourth

- (void)viewDidLoad {
    [super viewDidLoad];

    // 导航栏标题
    [self.navigationItem setTitle:@"其他动画"];
    
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView
{
    [super loadView];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

#pragma mark - setUI

// 创建视图
- (void)setUI
{
    if ([[UIDevice currentDevice] systemVersion].floatValue >= 7.0)
    {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    
    // 火焰动画
    UIView *fireView = [[UIView alloc] initWithFrame:CGRectMake(10.0, 10.0, 100.0, 100.0)];
    fireView.backgroundColor = [UIColor blackColor];
    [SYViewAnimation animationFireWithImage:@"fire" view:fireView frame:fireView.bounds];
    [self.view addSubview:fireView];
    
    // 弹簧动画
    [self springAnimation];
    
    // 波浪动画
    SYWaterAnimationView *waterView = [[SYWaterAnimationView alloc] initWithFrame:CGRectMake(10.0, 120.0, (self.view.frame.size.width - 10.0 * 2), 100.0) waveColor:[UIColor colorWithRed:73/255.0 green:142/255.0 blue:178/255.0 alpha:0.5] waterColor:[UIColor colorWithRed:73/255.0 green:142/255.0 blue:178/255.0 alpha:0.5]];
    waterView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.3];
    waterView.tag = 1000;
    [self.view addSubview:waterView];
    
    SYWaterAnimationView *waterView2 = [[SYWaterAnimationView alloc] initWithFrame:CGRectMake(10.0, 230.0, (self.view.frame.size.width - 10.0 * 2), 100.0)];
    waterView2.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.3];
    waterView2.waterColor = [UIColor redColor];
    waterView2.waveColor = [UIColor greenColor];
    waterView2.waveAmplitude = 11.0;
    waterView2.waveSpeed = 0.05;
    waterView2.wavePeriod = (M_PI) / self.view.frame.size.width;
    waterView2.waveWidth = self.view.frame.size.width;
    waterView2.waveCurrentHeight = 20.0;
    waterView2.tag = 1001;
    [self.view addSubview:waterView2];
    
    // 线条动画
    [self lineAnimation];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    SYWaterAnimationView *waterView = (SYWaterAnimationView *)[self.view viewWithTag:1000];
    [waterView animationWaterInvalidate];
    
    waterView = (SYWaterAnimationView *)[self.view viewWithTag:1001];
    [waterView animationWaterInvalidate];
}

#pragma mark springAnimation

- (void)springAnimation
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(120.0, 10.0, (self.view.frame.size.width - 10.0 - 120.0), 100.0)];
    [self.view addSubview:view];
    view.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.2];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, 50.0, 30.0)];
    label.backgroundColor = [UIColor redColor];
    [view addSubview:label];
    
    CASpringAnimation *spring = [CASpringAnimation animationWithKeyPath:@"position.x"];
    spring.damping = 5;
    spring.stiffness = 100;
    spring.mass = 1;
    spring.initialVelocity = 0;
    spring.fromValue = @(label.layer.position.x);
    spring.toValue = @(label.layer.position.x + 50.0);
    spring.autoreverses = YES;
    spring.repeatCount = MAXFLOAT;
    spring.duration = spring.settlingDuration;
    
    [label.layer addAnimation:spring forKey:spring.keyPath];
}

#pragma mark lineAnimation

- (void)lineAnimation
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10.0, 340.0, (self.view.frame.size.width - 10.0 * 2), 100.0)];
    [self.view addSubview:view];
    view.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.2];

    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:view.bounds];
 
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.strokeColor = [UIColor purpleColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 2;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = bezierPath.CGPath;
    [view.layer addSublayer:shapeLayer];
    
    CABasicAnimation *pathAnim = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnim.duration = 5.0;
    pathAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnim.fromValue = @(0);
    pathAnim.toValue = @(1);
    pathAnim.autoreverses = true;
    pathAnim.fillMode = kCAFillModeForwards;
    pathAnim.removedOnCompletion = NO;
    pathAnim.repeatCount = MAXFLOAT;
    [shapeLayer addAnimation:pathAnim forKey:@"strokeEndAnim"];
}

@end
