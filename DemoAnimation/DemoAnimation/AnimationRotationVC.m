//
//  AnimationRotationVC.m
//  DemoAnimation
//
//  Created by herman on 2017/6/4.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import "AnimationRotationVC.h"

@interface AnimationRotationVC ()

@property (nonatomic, retain) UIView *animationView;
@property (nonatomic, assign) BOOL isAnimation;

@end

@implementation AnimationRotationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"旋转动画";
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUI
{
    self.animationView = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 120, 60)];
    self.animationView.layer.anchorPoint = CGPointMake(0.5, 1);
    self.animationView.layer.position = CGPointMake(160, 200);
    self.animationView.layer.transform = CATransform3DMakeRotation(M_PI, 0, 0, 1);
    [self.animationView setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:self.animationView];
}

- (void)buttonClick
{
    // 旋转动画
    if (self.isAnimation)
    {
        [self showRoundMenu];
        self.isAnimation = YES;
    }
    else
    {
        [self hideRoundMenu];
        self.isAnimation = NO;
    }
}

- (void)showRoundMenu
{
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"transform"];
    ani.duration = 0.6;
    ani.autoreverses = NO;
    ani.fillMode = kCAFillModeForwards;
    ani.removedOnCompletion = NO;
    ani.toValue = [NSValue valueWithCATransform3D:CATransform3DRotate(self.animationView.layer.transform, -M_PI, 0, 0, 1)];
    [self.animationView.layer addAnimation:ani forKey:nil];
}

- (void)hideRoundMenu
{
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"transform"];
    ani.duration = 0.6;
    ani.autoreverses = NO;
    ani.fillMode = kCAFillModeForwards;
    ani.removedOnCompletion = NO;
    ani.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 1)];
    [self.animationView.layer addAnimation:ani forKey:nil];
}

@end
