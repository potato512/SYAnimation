//
//  UIViewVCTwo.m
//  DemoAnimation
//
//  Created by zhangSY on 14-4-10.
//  Copyright (c) 2014年 zhangshaoyu. All rights reserved.
//

#import "UIViewVCTwo.h"

// 导入封装方法头文件
#import "SYAddNumberAnimationView.h"

@interface UIViewVCTwo ()

@property (nonatomic, retain) UIImageView *animationImageView;

@end

@implementation UIViewVCTwo

@synthesize animationImageView;

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
    [self.navigationItem setTitle:@"放大缩小淡出"];
    
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

#pragma mark - setUI

// 创建视图
- (void)setUI
{
    if ([[UIDevice currentDevice] systemVersion].floatValue >= 7.0)
    {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    
    
    UIImage *image = [UIImage imageNamed:@"icon_10.png"];
    self.animationImageView = [[UIImageView alloc] init];
    self.animationImageView.image = image;
    [self.animationImageView setBackgroundColor:[UIColor clearColor]];
    self.animationImageView.alpha = 0.0;
    
    // 方法1 加在当前视图中会被导航栏遮挡
//    UIView *currentview = self.view;
//    self.animationImageView.frame = CGRectMake(self.view.frame.size.width - 30.0 - 10.0, 0.0, 30.0, 30.0);

    // 方法2 加在当前APP的主视图上
    UIView *currentview = [[[UIApplication sharedApplication] delegate] window];
    self.animationImageView.frame = CGRectMake(self.view.frame.size.width - 30.0 - 10.0, 20.0 + 44.0, 30.0, 30.0);
    
    [currentview addSubview:self.animationImageView];
    
    
    // 旋转按钮
    UIButton *showFly = [UIButton buttonWithType:UIButtonTypeCustom];
    [showFly setFrame:CGRectMake(10.0, 10.0, 60, 40)];
    showFly.titleLabel.adjustsFontSizeToFitWidth = YES;
    [showFly setTitle:@"Fly" forState:UIControlStateNormal];
    [showFly setBackgroundColor:[UIColor lightGrayColor]];
    [showFly addTarget:self action:@selector(Fly:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showFly];
}

// 旋转事件
- (void)Fly:(UIButton *)button
{
//    [self showRoundMenu];
    
    // 使用封装方法
    [SYAddNumberAnimationView showAnimationAddOne:self.animationImageView];
}

// 动画
- (void)showRoundMenu
{
    // 出现-放大-移动-缩小-变淡-消失
    // 方法1
//    [UIView animateWithDuration:2.0 animations:^{
//        // 出现
//        self.animationImageView.alpha = 1.0;
//        self.animationImageView.frame = CGRectMake(self.view.frame.size.width - 30.0 - 10.0, 0.0, 30.0, 30.0);
//
//        // 放大
//        self.animationImageView.frame = CGRectMake(self.view.frame.size.width - 35.0 - 10.0, -5.0, 35.0, 35.0);
//        
//        /********************/
//        
//        // 移动 缩小
//        self.animationImageView.frame = CGRectMake(self.view.frame.size.width - 30.0 - 10.0 - 20.0, -30.0, 0.0, 0.0);
//        // 消失 变淡
//        self.animationImageView.alpha = 0.0;
//    }];
    
    // 方法2 嵌套使用
    [UIView animateWithDuration:0.2 animations:^{
        
        // 出现
        self.animationImageView.alpha = 1.0;
        // 放大
        self.animationImageView.frame = CGRectMake(self.view.frame.size.width - 40.0 - 10.0, 20.0 + 44.0 - 10.0, 40.0, 40.0);
    
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:0.4 animations:^{
            
            // 变回原大小
            self.animationImageView.frame = CGRectMake(self.view.frame.size.width - 30.0 - 10.0, 20.0 + 44.0, 30.0, 30.0);
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:1.2 animations:^{
                
                // 移动 缩小
                self.animationImageView.frame = CGRectMake(self.view.frame.size.width - 30.0 - 10.0 - 20.0, 20.0 + 44.0 +20.0 - 30.0, 0.0, 0.0);
                // 消失 变淡
                self.animationImageView.alpha = 0.0;
                
            } completion:^(BOOL finished) {
                
                self.animationImageView.frame = CGRectMake(self.view.frame.size.width - 30.0 - 10.0, 20.0 + 44.0, 30.0, 30.0);
                
            }];
        
        }];
    }];
}

@end
