//
//  SYAddNumberAnimationView.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 14-4-10.
//  Copyright (c) 2014年 zhangshaoyu. All rights reserved.
//

#import "SYAddNumberAnimationView.h"

@implementation SYAddNumberAnimationView

/// 显示加1动画效果
+ (void)showAnimationAddOne:(UIImageView *)imageview
{
    if (!imageview)
    {
        return;
    }
    
    // 原始frame
    CGRect oldRect = imageview.frame;
    
    // 动画
    [UIView animateWithDuration:0.2 animations:^{
        
        // 出现
        imageview.alpha = 1.0;
        // 放大
        imageview.frame = CGRectMake(oldRect.origin.x - 10.0, oldRect.origin.y - 10.0, oldRect.size.width + 10.0, oldRect.size.height + 10.0);
        
    }completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.4 animations:^{
            
            // 变回原大小
            imageview.frame = oldRect;
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:1.2 animations:^{
                
                // 移动 缩小
                imageview.frame = CGRectMake(oldRect.origin.x - 20.0, oldRect.origin.y + 20.0 - 30.0, 0.0, 0.0);;
                // 消失 变淡
                imageview.alpha = 0.0;
                
            } completion:^(BOOL finished) {
                
                imageview.frame = oldRect;
                
            }];
            
        }];
    }];
}

@end
