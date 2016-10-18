//
//  MainVC.m
//  DemoAnimation
//
//  Created by zhangSY on 14-4-3.
//  Copyright (c) 2014年 zhangshaoyu. All rights reserved.
//

#import "MainVC.h"
#import "UIViewVC.h"
#import "UIViewVCTwo.h"
#import "UIViewVCThree.h"
#import "CMSCoinVC.h"

@interface MainVC ()

@end

@implementation MainVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 导航栏标题
    [self.navigationItem setTitle:@"动画Animation"];
    
    // 视图
    [self setUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)loadView
{
    [super loadView];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

// 自定义函数
#pragma mark - custom method

// 创建视图
- (void)setUI
{
    NSArray *titleArray = [NSArray arrayWithObjects:@"UIView", @"UIViewVCTwo", @"UIViewVCThree", @"硬币翻转", nil];
    NSInteger buttonCount = [titleArray count];
    
    // 主背景视图
    UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [scrollview setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:scrollview];
    
    // 按钮
    for (int i = 0; i < buttonCount; i++)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [scrollview addSubview:btn];
        [btn setBackgroundColor:[UIColor brownColor]];
        [btn setFrame:CGRectMake((self.view.frame.size.width - 240) / 2, (44 + 10) * i + 10, 240, 44)];
        [[btn titleLabel] setTextAlignment:NSTextAlignmentCenter];
        [[btn titleLabel] setAdjustsFontSizeToFitWidth:YES];
        [btn setTitle:[titleArray objectAtIndex:i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(buttonClickChangeVC:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTag:i];
    }
    
    // 总高度，用于设置主视图contentsize
    CGFloat realHeight = 44 * buttonCount + 10 * (buttonCount + 1);
    // 重置主视图的contentsize
    [scrollview setContentSize:CGSizeMake(self.view.frame.size.width, realHeight)];
}

// 按钮事件
- (void)buttonClickChangeVC:(UIButton *)button
{
    // 视图
    UIViewVC *vcOne = [[UIViewVC alloc] init];
    UIViewVCTwo *vcTwo = [[UIViewVCTwo alloc] init];
    UIViewVCThree *vcThree = [[UIViewVCThree alloc] init];
    CMSCoinVC *vcFour = [[CMSCoinVC alloc] init];
//    UILabelVC *vcFive = [[UILabelVC alloc] init];
    
    // 视图数组
    NSArray *vcArray = [NSArray arrayWithObjects:vcOne, vcTwo, vcThree, vcFour, nil];
    
    // 视图切换
    [self.navigationController pushViewController:[vcArray objectAtIndex:button.tag] animated:YES];
}


@end
