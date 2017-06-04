//
//  AnimationHeartVC.m
//  DemoAnimation
//
//  Created by herman on 2017/6/4.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import "AnimationHeartVC.h"

@interface AnimationHeartVC ()

@property (nonatomic, retain) UIView *animationView;

@end

@implementation AnimationHeartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"心跳动画";
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
    // 心跳动画
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    CATransform3D scale1 = CATransform3DMakeScale(0.8, 0.8, 1);
    CATransform3D scale2 = CATransform3DMakeScale(1.4f, 1.4f, 1);
    CATransform3D scale3 = CATransform3DMakeScale(1.4f - 0.3f, 1.4f - 0.3f, 1);
    CATransform3D scale4 = CATransform3DMakeScale(1.0, 1.0, 1);
    
    NSArray *frameValues = [NSArray arrayWithObjects: [NSValue valueWithCATransform3D:scale1], [NSValue valueWithCATransform3D:scale2], [NSValue valueWithCATransform3D:scale3], [NSValue valueWithCATransform3D:scale4], nil];
    
    [animation setValues:frameValues];
    
    NSArray *frameTimes = [NSArray arrayWithObjects: [NSNumber numberWithFloat:0.05], [NSNumber numberWithFloat:0.2], [NSNumber numberWithFloat:0.6], [NSNumber numberWithFloat:1.0], nil]; [animation setKeyTimes:frameTimes];
    animation.fillMode = kCAFillModeForwards;
    animation.duration = 0.5f;
    animation.repeatCount = 1.2 / 0.5f;
    
    [self.animationView.layer addAnimation:animation forKey:@"heartbeatView"];
}


@end
