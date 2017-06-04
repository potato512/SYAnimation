//
//  MainVC.m
//  DemoAnimation
//
//  Created by zhangSY on 14-4-3.
//  Copyright (c) 2014年 zhangshaoyu. All rights reserved.
//

#import "MainVC.h"
//#import "UIViewVC.h"
//#import "UIViewVCTwo.h"
//#import "AnimationGroupVC.h"
//#import "CMSCoinVC.h"
//#import "AnimationVCFourth.h"
#import "AnimationRotationVC.h"
#import "AnimationShakeVC.h"
#import "AnimationHeartVC.h"


@interface MainVC () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *array;

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
    
    self.title = @"动画Animation";
    [self setUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 创建视图
- (void)setUI
{
    self.array = @[@"旋转动画", @"抖动动画", @"心跳动画"];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.tableFooterView = [[UIView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    NSString *text = self.array[indexPath.row];
    cell.textLabel.text = text;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *nextVC = nil;
    if (0 == indexPath.row)
    {
        // 旋转动画
        nextVC = [AnimationRotationVC new];
    }
    else if (1 == indexPath.row)
    {
        // 抖动动画
        nextVC = [AnimationShakeVC new];
    }
    else if (2 == indexPath.row)
    {
        // 心跳动画
        nextVC = [AnimationHeartVC new];
    }
    
    [self.navigationController pushViewController:nextVC animated:YES];
}

@end
