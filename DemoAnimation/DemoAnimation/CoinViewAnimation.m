//
//  CoinViewAnimation.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 15-1-25.
//  Copyright (c) 2015年 zhangshaoyu. All rights reserved.
//

#import "CoinViewAnimation.h"
#import <QuartzCore/QuartzCore.h>

@interface CoinViewAnimation ()
{
    bool displayingPrimary;
}

@end

@implementation CoinViewAnimation

// 初始化
- (id)initWithFrame:(CGRect)frame view:(UIView *)superview primaryView:(UIView *)primaryView secondaryView:(UIView *)secondaryView
{
    self = [super init];
    if (self)
    {
        self.frame = frame;
        
        if (superview)
        {
            [superview addSubview:self];
        }
        
        // Initialization code
        self.primaryView = primaryView;
        self.secondaryView = secondaryView;
        
        displayingPrimary = YES;
        self.spinTime = 1.0;
    }
    return self;
}

#pragma mark - set方法

- (void)setPrimaryView:(UIView *)primaryView
{
    _primaryView = primaryView;
    
    CGRect frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.primaryView.frame = frame;
    [self roundView: self.primaryView];
    self.primaryView.userInteractionEnabled = YES;
    [self addSubview: self.primaryView];
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flipTouched:)];
    gesture.numberOfTapsRequired = 1;
    [self.primaryView addGestureRecognizer:gesture];
    [self roundView:self];
}

- (void)setSecondaryView:(UIView *)secondaryView
{
    _secondaryView = secondaryView;
    CGRect frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.secondaryView.frame = frame;
    [self roundView: self.secondaryView];
    self.secondaryView.userInteractionEnabled = YES;
    [self addSubview: self.secondaryView];
    [self sendSubviewToBack:self.secondaryView];
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flipTouched:)];
    gesture.numberOfTapsRequired = 1;
    [self.secondaryView addGestureRecognizer:gesture];
    [self roundView:self];
}

- (void)setSpinTime:(float)spinTime
{
    _spinTime = spinTime;
}

#pragma mark - 视图属性设置

- (void)roundView:(UIView *)view
{
    view.layer.cornerRadius = (self.frame.size.height / 2);
    view.layer.masksToBounds = YES;
}

#pragma mark - 响应方法
- (void)flipTouched:(UITapGestureRecognizer *)sender
{
    UIView *fromView = (displayingPrimary ? self.primaryView : self.secondaryView);
    UIView *toView = (displayingPrimary ? self.secondaryView : self.primaryView);
    UIViewAnimationOptions options = (displayingPrimary ? UIViewAnimationOptionTransitionFlipFromLeft : UIViewAnimationOptionTransitionFlipFromRight) + UIViewAnimationOptionCurveEaseInOut;
    
    [UIView transitionFromView:fromView
                        toView:toView
                      duration:self.spinTime
                       options:options
                    completion:^(BOOL finished) {
                        if (finished)
                        {
                            displayingPrimary = !displayingPrimary;
                        }
                    }
     ];
}

@end
