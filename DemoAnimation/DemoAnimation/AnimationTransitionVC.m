//
//  AnimationTransitionVC.m
//  DemoAnimation
//
//  Created by zhangshaoyu on 17/6/7.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import "AnimationTransitionVC.h"

@interface AnimationTransitionVC () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *array;

@end

@implementation AnimationTransitionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"转场动画";
    
    self.array = @[@"立体翻滚", @"新视图移到旧视图上面", @"旧视图移开显示下面的新视图", @"交叉淡化", @"向上翻页", @"向下翻页", @"抽纸收缩", @"滴水", @"上下左右翻转", @"旋转", @"新视图把旧视图推出去", @"相机开", @"相机关", @"交叉淡化2", @"新视图移到旧视图上面2", @"新视图把旧视图推出去2", @"旧视图移开显示下面的新视图2"];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    tableView.tableFooterView = [UIView new];
    tableView.delegate = self;
    tableView.dataSource = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 25.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
        cell.textLabel.font = [UIFont systemFontOfSize:12.0];
    }
    
    cell.textLabel.text = self.array[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 转场动画
    CATransition *animation = [CATransition animation];
    animation.duration = 0.6;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    // 转场效果-动画类型type 动画方向subtype
    if (0 == indexPath.row)
    {
        animation.type = @"cube";
        animation.subtype = kCATransitionFromLeft;
    }
    else if (1 == indexPath.row)
    {
        animation.type = @"moveIn";
        animation.subtype = kCATransitionFromLeft;
    }
    else if (2 == indexPath.row)
    {
        animation.type = @"reveal";
        animation.subtype = kCATransitionFromLeft;
    }
    else if (3 == indexPath.row)
    {
        animation.type = @"fade";
        animation.subtype = kCATransitionFromLeft;
    }
    else if (4 == indexPath.row)
    {
        animation.type = @"pageCurl";
        animation.subtype = kCATransitionFromLeft;
    }
    else if (5 == indexPath.row)
    {
        animation.type = @"pageUnCurl";
        animation.subtype = kCATransitionFromRight;
    }
    else if (6 == indexPath.row)
    {
        animation.type = @"suckEffect";
        animation.subtype = kCATransitionFromLeft;
    }
    else if (7 == indexPath.row)
    {
        animation.type = @"rippleEffect";
        animation.subtype = kCATransitionFromLeft;
    }
    else if (8 == indexPath.row)
    {
        animation.type = @"oglFlip";
        animation.subtype = kCATransitionFromLeft;
    }
    else if (9 == indexPath.row)
    {
        animation.type = @"rotate";
        animation.subtype = @"90cw";
    }
    else if (10 == indexPath.row)
    {
        animation.type = @"push";
        animation.subtype = kCATransitionFromLeft;
    }
    else if (11 == indexPath.row)
    {
        animation.type = @"cameraIrisHollowOpen";
        animation.subtype = kCATransitionFromLeft;
    }
    else if (12 == indexPath.row)
    {
        animation.type = @"cameraIrisHollowClose";
        animation.subtype = kCATransitionFromLeft;
    }
    else if (13 == indexPath.row)
    {
        animation.type = @"kCATransitionFade";
        animation.subtype = kCATransitionFromLeft;
    }
    else if (14 == indexPath.row)
    {
        animation.type = @"kCATransitionMoveIn";
        animation.subtype = kCATransitionFromLeft;
    }
    else if (15 == indexPath.row)
    {
        animation.type = @"kCATransitionPush";
        animation.subtype = kCATransitionFromLeft;
    }
    else if (16 == indexPath.row)
    {
        animation.type = @"kCATransitionReveal";
        animation.subtype = kCATransitionFromLeft;
    }
    // 添加转场动画到导航视图控制上
    [self.navigationController.view.layer addAnimation:animation forKey:nil];
    
    
    BaseViewController *nextVC = [BaseViewController new];
    nextVC.title = self.array[indexPath.row];
//    nextVC.view.backgroundColor = [UIColor colorWithRed:(arc4random_uniform(256) / 255.0) green:(arc4random_uniform(256) / 255.0) blue:(arc4random_uniform(256) / 255.0) alpha:1.0];
    [self.navigationController pushViewController:nextVC animated:YES];
}

@end
