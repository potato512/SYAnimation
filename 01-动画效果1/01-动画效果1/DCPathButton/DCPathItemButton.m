//
//  DCPathItemButton.m
//  DCPathButton
//
//  Created by tang dixi on 31/7/14.
//  Copyright (c) 2014 Tangdxi. All rights reserved.
//

#import "DCPathItemButton.h"

@interface DCPathItemButton ()

@property (strong, nonatomic) UIImageView *backgroundImageView;

@end

@implementation DCPathItemButton

- (id)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage backgroundImage:(UIImage *)backgroundImage backgroundHighlightedImage:(UIImage *)backgroundHighlightedImage
{
    if (self = [super init]) {
        
        // Make sure the iteam has a certain frame
        // 视频帧处理 音频处理等等 我会收3个关门弟子 (VIP)
        // 关门弟子. 以后我的所有课只要研发出来你的都可以免费听而且是不看视频  VIP -- 一期我只上一次.  第二期 不用看视频. 进来听直播
        //1900006359 lina   助理老师 QQ: 977093060
        // Herry QQ: 3367353336  
        // 1. 关门弟子, 24小时可以骚扰我. (出来性骚扰)
        // 2. 关门弟子, 24小时问我工作上的疑点 我会及时给解决方案
        // 3. 关门弟子, 我只收3个. 可以新课程研发所有课程只要是我上的,都可以随时来听, 我会一对一的辅导.  VIP 是分 第 4 期 还有新课程 你只能看视频.  关门弟子,可以随时来听  可以加我微信.
        // 4. 如果来长沙,可以带老师去江南会所....(福利)
        //  5.睡老师免了.
        CGRect itemFrame = CGRectMake(0, 0, backgroundImage.size.width, backgroundImage.size.height);
        
        if (!backgroundImage || !backgroundHighlightedImage) {
            itemFrame = CGRectMake(0, 0, image.size.width, image.size.height);
        }
        self.frame = itemFrame;
        
        // Configure the item image
        //
        self.image = backgroundImage;
        self.highlightedImage = backgroundHighlightedImage;
        
        self.userInteractionEnabled = YES;
        
        // Configure background
        //
        _backgroundImageView = [[UIImageView alloc]initWithImage:image
                                                            highlightedImage:highlightedImage];
        
        _backgroundImageView.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
        
        [self addSubview:_backgroundImageView];
        
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.highlighted = YES;
    self.backgroundImageView.highlighted = YES;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint currentLocation = [[touches anyObject]locationInView:self];
    
    if (! CGRectContainsPoint([self scaleRect:self.bounds], currentLocation)) {
        self.highlighted = NO;
        self.backgroundImageView.highlighted = NO;
        
        return ;
    }
    
    self.highlighted = YES;
    self.backgroundImageView.highlighted = YES;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([_delegate respondsToSelector:@selector(itemButtonTapped:)]) {
        [_delegate itemButtonTapped:self];
    }
    
    self.highlighted = NO;
    self.backgroundImageView.highlighted = NO;
}

#pragma mark - Scale Item Button

- (CGRect)scaleRect:(CGRect)originRect
{
    return CGRectMake(- originRect.size.width * 2,
                      - originRect.size.height * 2,
                      originRect.size.width * 5,
                      originRect.size.height * 5);
}

@end
