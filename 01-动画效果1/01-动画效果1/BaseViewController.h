//
//  BaseViewController.h
//  01-动画效果1
//
//  Created by 疯癫不二 on 17/3/17.
//  Copyright © 2017年 TZEDU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

/**
 *  当前控制器的标题
 *
 *  @return 标题
 */
- (NSString *)controllerTitle;
/**
 *  初始化视图
 */
- (void)initView;
/**
 *  按钮元素
 *
 *  @return 按钮数组
 */
- (NSArray *)btnTitleArray;
/**
 *  每个按钮的点击事件
 */
-(void)clickBtn : (UIButton *)btn;


@end
