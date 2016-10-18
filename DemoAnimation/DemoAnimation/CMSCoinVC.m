//
//  CMSCoinVC.m
//  DemoAnimation
//
//  Created by zhangshaoyu on 15-1-25.
//  Copyright (c) 2015年 zhangshaoyu. All rights reserved.
//

#import "CMSCoinVC.h"
#import "CoinViewAnimation.h"

@interface CMSCoinVC ()

@end

@implementation CMSCoinVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 导航栏标题
    [self.navigationItem setTitle:@"硬币翻转"];
    
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

    UIImageView *firstImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"profile.png"]];
    UIImageView *secondImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"second.jpg"]];
    
    CoinViewAnimation *coinView = [[CoinViewAnimation alloc] initWithFrame:CGRectMake(50.0, 50.0, 120.0, 120.0) view:self.view primaryView:firstImageView secondaryView:secondImageView];
    coinView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.3];
}

@end
