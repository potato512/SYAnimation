//
//  CustomButton.m
//  01-动画效果1
//
//  Created by 疯癫不二 on 17/3/17.
//  Copyright © 2017年 TZEDU. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

-(instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title {
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitle:title forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.backgroundColor = [UIColor grayColor];
    }
    
    return self;
}

@end
