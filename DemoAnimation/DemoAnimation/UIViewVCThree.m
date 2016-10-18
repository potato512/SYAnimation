//
//  UIViewVCThree.m
//  DemoAnimation
//
//  Created by zhangshaoyu on 15-1-25.
//  Copyright (c) 2015年 zhangshaoyu. All rights reserved.
//

#import "UIViewVCThree.h"
#import "SYViewAnimation.h"

@interface UIViewVCThree ()
{
    UIImageView *animationImageView;
}

@end

@implementation UIViewVCThree

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 导航栏标题
    [self.navigationItem setTitle:@"动画效果"];
    
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

    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height / 2;
    UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 0.0, width, height)];
    [self.view addSubview:scrollview];
    scrollview.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    scrollview.backgroundColor = [UIColor lightTextColor];
    
    NSArray *array = [NSArray arrayWithObjects:@"动画", @"方向动画", @"渐隐动画", @"翻转动画", @"翻页动画", @"推动动画", @"移动动画", @"旋转动画", @"旋转缩放动画", @"私-翻转动画", @"私-立方体动画", @"私-抽纸动画", @"私-水波动画", @"私-相机动画", @"旋转动画", @"缩放动画", @"旋转视图", nil];
    int count = array.count;
    CGFloat heightContent = 0.0;
    for (int i = 0; i < count; i++)
    {
        CGRect rect = CGRectMake((i % 4) * (60.0 + 16.0) + 16.0, (i / 4) * (20.0 + 16.0) + 16.0, 60.0, 20.0);
        NSString *title = [array objectAtIndex:i];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:rect];
        button.tag = i;
        button.titleLabel.adjustsFontSizeToFitWidth = YES;
        [button setTitle:title forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor brownColor]];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        
        heightContent = rect.size.height + rect.origin.y + 16.0;
    }
    scrollview.contentSize = CGSizeMake(width, heightContent);
    
    CGFloat sizeImage = 80.0;
    animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake((width - sizeImage) / 2, height + (height - sizeImage) / 2, sizeImage, sizeImage)];
    [self.view addSubview:animationImageView];
    animationImageView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    animationImageView.image = [UIImage imageNamed:@"second.jpg"];
    animationImageView.contentMode = UIViewContentModeScaleAspectFit;
    animationImageView.backgroundColor = [UIColor lightGrayColor];
//    animationImageView.layer.anchorPoint = CGPointMake(0.5, 1);
//    animationImageView.layer.position = CGPointMake(160, 200);
//    animationImageView.layer.transform = CATransform3DMakeRotation(M_PI, 0, 0, 1); // 180度翻转
}

- (void)buttonClick:(UIButton *)button
{
    if (0 == button.tag)
    {
        [SYViewAnimation showAnimationType:kCATransitionReveal withSubType:kCATransitionFromRight duration:0.6 timingFunction:kCAMediaTimingFunctionEaseInEaseOut view:animationImageView];
    }
    else if (1 == button.tag)
    {
        // 方向动画
        [SYViewAnimation animationRevealFromBottom:animationImageView];
    }
    else if (2 == button.tag)
    {
        // 渐隐动画 无效？
        [SYViewAnimation animationEaseOut:animationImageView];
    }
    else if (3 == button.tag)
    {
        // 翻转动画
        [SYViewAnimation animationFlipFromLeft:animationImageView];
    }
    else if (4 == button.tag)
    {
        // 翻页动画
        [SYViewAnimation animationCurlUp:animationImageView];
    }
    else if (5 == button.tag)
    {
        // 推动动画
        [SYViewAnimation animationPushDown:animationImageView];
    }
    else if (6 == button.tag)
    {
        // 移动动画
        [SYViewAnimation animationMoveUp:animationImageView duration:0.6];
    }
    else if (7 == button.tag)
    {
        // 旋转动画
        [SYViewAnimation animationRotateAndScaleEffects:animationImageView];
    }
    else if (8 == button.tag)
    {
        // 旋转缩放动画
        [SYViewAnimation animationRotateAndScaleDownUp:animationImageView];
    }
    else if (9 == button.tag)
    {
        // 私有-翻转动画
        [SYViewAnimation animationFlipFromTop:animationImageView];
    }
    else if (10 == button.tag)
    {
        // 私-立方体动画
        [SYViewAnimation animationCubeFromRight:animationImageView];
    }
    else if (11 == button.tag)
    {
        // 私-抽纸动画
        [SYViewAnimation animationSuckEffect:animationImageView];
    }
    else if (12 == button.tag)
    {
        // 私有-水波动画
        [SYViewAnimation animationRippleEffect:animationImageView];
    }
    else if (13 == button.tag)
    {
        // 私有-相机动画
        [SYViewAnimation animationCameraOpen:animationImageView];
    }
    else if (14 == button.tag)
    {
        // 旋转动画
        [SYViewAnimation animationRotation:animationImageView];
    }
    else if (15 == button.tag)
    {
        // 缩放动画
        [SYViewAnimation animationScale:animationImageView];
    }
    else if (16 == button.tag)
    {
        [UIView animateWithDuration:0.3 animations:^{
            animationImageView.transform = CGAffineTransformMakeRotation(M_PI * 1.0);
        }];
    }

}

@end
