//
//  LeftViewController.m
//  01-动画效果1
//
//  Created by 疯癫不二 on 17/3/17.
//  Copyright © 2017年 TZEDU. All rights reserved.
//

#import "LeftViewController.h"
#import "SWRevealViewController.h"
#import "CenterViewController.h"
#import "KeyFrameViewController.h"
#include "IntegrationAnimationController.h"
#include "AffineTransformController.h"
#include "TransitionAnimationController.h"
#include "GroupAnimationController.h"

@interface LeftViewController ()<UITableViewDelegate, UITableViewDataSource>
/** 单元格 */
@property(nonatomic,strong) UITableView *tableView;
/** 数组 */
@property(nonatomic,strong)NSArray *animationArray;

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self initData];
}

// 设置单元格数据源
- (void)initData {
    self.animationArray = [NSArray arrayWithObjects:@"基础动画",@"关键帧动画",@"组合动画",@"过渡动画",@"仿射变换",@"综合案例",nil];
}

// 配置单元格
- (void)initView {
    self.view.backgroundColor = [UIColor lightGrayColor];
    // 设置单元格
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,20, SCREEN_WIDTH, SCREEN_HEIGHT-20) style:UITableViewStyleGrouped];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
}

#pragma mark- tableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _animationArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier
        ];
    }
    cell.textLabel.text = [_animationArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 注册抽屉效果
    SWRevealViewController *revealViewController = self.revealViewController;
    // 创建一个 viewController
    UIViewController *VC;
    
    switch (indexPath.row) {
        case 0:
            // 基础动画
            VC = [[CenterViewController alloc]init];
            break;
        case 1:
            // 关键帧动画
            VC = [[KeyFrameViewController alloc]init];
            break;
        case 2:
            // 组合动画
            VC = [[GroupAnimationController alloc]init];
            break;
        case 3:
            // 过渡动画
            VC = [[TransitionAnimationController alloc]init];
            break;
        case 4:
            // 仿射变换
            VC = [[AffineTransformController alloc]init];
            break;
        case 5:
            // 综合案例
            VC = [[IntegrationAnimationController alloc]init];
            break;
            
        default:
            break;
    }
    // 调用pushFrontViewController进行页面切换
    [revealViewController pushFrontViewController:VC animated:YES];
    
}

@end
