//
//  TransitionAnimationController.m
//  01-动画效果1
//
//  Created by 疯癫不二 on 17/3/17.
//  Copyright © 2017年 TZEDU. All rights reserved.
//

#import "TransitionAnimationController.h"

@interface TransitionAnimationController ()
@property (nonatomic ,strong) UIView *demoView;
/** 页数 label */
@property(nonatomic,strong)UILabel *demoLabel;
/** 索引 */
@property(nonatomic,assign) NSInteger index;

@end

@implementation TransitionAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    _index = 0;
    
    _demoView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-90, SCREEN_HEIGHT/2-200,180,260)];
    [self.view addSubview:_demoView];
    // 计算 frame 使 lable 居中显示
    _demoLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(_demoView.frame)/2-10, CGRectGetHeight(_demoView.frame)/2-20, 20, 40)];
    _demoLabel.textAlignment = NSTextAlignmentCenter;
    _demoLabel.font = [UIFont systemFontOfSize:20];
    [_demoView addSubview:_demoLabel];
    [self initView];
    
    [self changeView:YES];
}

- (NSString *)controllerTitle {
    return @"过渡动画";
}

/**
 *  管理页面变化
 *  @param isUp 页数是否变化
 */
- (void)changeView : (BOOL)isUp {
    if (_index > 3) {
        _index = 0;
    }
    if (_index < 0) {
        _index = 3;
    }
    NSArray *colorArray = [NSArray arrayWithObjects:[UIColor cyanColor],[UIColor redColor],[UIColor greenColor],[UIColor orangeColor], nil];
    NSArray *titleArray = [NSArray arrayWithObjects:@"一",@"二",@"三",@"四", nil];
    _demoView.backgroundColor = colorArray[_index];
    _demoLabel.text = titleArray[_index];
    if (isUp) {
        _index++;
    }else {
        _index--;
    }

}

- (NSArray *)btnTitleArray {
    return [NSArray arrayWithObjects:@"逐渐消失",@"移入",@"推出",@"移除",@"3D翻滚",@"飘出",@"翻转",@"动态覆盖",@"右翻页",@"左翻页",@"相机打开",@"相机关闭", nil];
}
/**
 *  按钮点击
 */
- (void)clickBtn:(UIButton *)btn {
    switch (btn.tag) {
        case 0:
            [self transformAnimation:kCATransitionFade];
            break;
        case 1:
            [self transformAnimation:kCATransitionMoveIn];
            break;
        case 2:
            [self transformAnimation:kCATransitionPush];
            break;
        case 3:
            [self transformAnimation:kCATransitionReveal];
            break;
        case 4:
            [self transformAnimation:@"cube"];
            break;
        case 5:
            [self transformAnimation:@"suckEffect"];
            break;
        case 6:
            [self transformAnimation:@"oglFlip"];
            break;
        case 7:
            [self transformAnimation:@"rippleEffect"];
            break;
        case 8:
            [self transformAnimation:@"pageCurl"];
            break;
        case 9:
            [self transformAnimation:@"pageUnCurl"];
            break;
        case 10:
            [self transformAnimation:@"cameraIrisHollowOpen"];
            break;
        case 11:
            [self transformAnimation:@"cameraIrisHollowClose"];
            break;
        default:
            break;
    }
}
/**
 *  自定义动画方法
 *
 *  @param AnimationType 动画类型  -1 0 1
 */
- (void)transformAnimation:(NSString *)AnimationType {
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = AnimationType;//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    //anima.startProgress = 0.3;//设置动画起点
    //anima.endProgress = 0.8;//设置动画终点
    anima.duration = 0.8;
    
    [_demoView.layer addAnimation:anima forKey:AnimationType];
}

@end
