//
//  AnimationShakeVC.m
//  DemoAnimation
//
//  Created by herman on 2017/6/4.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import "AnimationShakeVC.h"

@interface AnimationShakeVC ()

@property (nonatomic, retain) UIView *animationView;

@end

@implementation AnimationShakeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"抖动动画";
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
    // 视图抖动动画
    CABasicAnimation *shake = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        
    // 设置抖动幅度
    shake.fromValue = [NSNumber numberWithFloat:-0.3];
    shake.toValue = [NSNumber numberWithFloat:+0.3];
    shake.duration = 0.1f;
    shake.repeatCount = 0.6 / 4 / 0.1f;
    shake.autoreverses = YES;
    [self.animationView.layer addAnimation:shake forKey:@"shakeView"];
}

@end
