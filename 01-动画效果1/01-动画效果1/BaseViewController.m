//
//  BaseViewController.m
//  01-动画效果1
//
//  Created by 疯癫不二 on 17/3/17.
//  Copyright © 2017年 TZEDU. All rights reserved.
//

#import "BaseViewController.h"
#import "CustomButton.h"
#import "SWRevealViewController.h"

/**
 *  基础动画展示
 */
@interface BaseViewController ()
@property (strong, nonatomic) NSArray *btnTitleArray;
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // 先调用数据 后布置视图
    [self initData];
    [self initView];
}

/**
 *  当前控制器的标题
 *
 *  @return 标题
 */
- (NSString *)controllerTitle {
    return @"默认";
}
/**
 *  初始化视图
 */
- (void)initView {
    // 添加头视图
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    headView.backgroundColor = HERRYCOLOR;
    [self.view addSubview:headView];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [self controllerTitle];
    [headView addSubview:label];
    
    // 动态创建按钮功能
    if (_btnTitleArray&&_btnTitleArray.count>0) {
        // 通过三目运算符来决定按钮行数
        NSInteger row = _btnTitleArray.count % 4 == 0 ?_btnTitleArray.count/4 : _btnTitleArray.count/4+1;
        
        // 创建一个底部视图用来存放按钮
        UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-(row*50+20), SCREEN_WIDTH, row*50+20)];
        footView.backgroundColor = HERRYCOLOR;
        [self.view addSubview:footView];
        
        for (int i = 0; i<_btnTitleArray.count; i++) {
            CustomButton *btn = [[CustomButton alloc]initWithFrame:[self rectForBtnAtIndex:i totalNum:_btnTitleArray.count] withTitle:_btnTitleArray[i]];
            // 按钮添加 tag 值,区分点击事件
            btn.tag = i;
            [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
            
            [footView addSubview:btn];
        }
    }
    //注册该页面可以执行滑动切换
    SWRevealViewController *revealController = self.revealViewController;
    [self.view addGestureRecognizer:revealController.panGestureRecognizer];
}

/**
 *  设置数据
 */
- (void)initData {
    _btnTitleArray = [self btnTitleArray];
}

/**
 *  按钮点击
 */
- (void)clickBtn : (UIButton *)btn {

}
/**
 *  按钮 frame 计算
 */
- (CGRect)rectForBtnAtIndex : (NSInteger)index totalNum: (NSUInteger) totalNum {
    // 每一行最多显示四个
    NSUInteger maxColumnNum = 4;
    // 每个按钮之间的距离(间接距)(行间距)
    CGFloat marginCol = 20;
    CGFloat marginRow = 20;
    
    // 按钮宽度
    CGFloat width = (SCREEN_WIDTH - marginCol * 5)/4;
    CGFloat height = 30;
    // 每个按钮的位移
    // X: 间距 + 列数 * 对应宽度+间距
    CGFloat offSetX = marginCol + (index%maxColumnNum) * (width + marginCol);
    // Y: 间距 + 行数 * 对应高度+间距
    CGFloat offSetY = marginRow + (index/maxColumnNum) * (height + marginRow);
    
    return CGRectMake(offSetX, offSetY, width, height);
}

@end
