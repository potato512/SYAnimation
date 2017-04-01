//
//  IntegrationAnimationController.m
//  01-动画效果1
//
//  Created by 疯癫不二 on 17/3/17.
//  Copyright © 2017年 TZEDU. All rights reserved.
//

#import "IntegrationAnimationController.h"
#import "DCPathButton.h"
#import "MCFireworksButton.h"
#import "DWBubbleMenuButton.h"

@interface IntegrationAnimationController ()
/**动画子按钮弹出*/
@property (nonatomic ,strong) DCPathButton *pathAnimationView;
/**冒泡*/
@property(nonatomic,strong) DWBubbleMenuButton *bubbleAnimationView;
/**点赞粒子效果*/
@property(nonatomic,strong)MCFireworksButton *fireworksAnimationView;
/** 是否被选 */
@property(nonatomic,assign)BOOL selected;

@end

@implementation IntegrationAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self pathAnimation];
}

-(NSArray *)btnTitleArray{
    return [NSArray arrayWithObjects:@"子按钮",@"冒泡按钮",@"粒子点赞", nil];
}

-(void)clickBtn : (UIButton *)btn{
    switch (btn.tag) {
        case 0:
            [self pathAnimation];
            break;
        case 1:
            [self bubbleAnimation];
            break;
        case 2:
            [self fireworksAnimation];
            break;
        default:
            break;
    }
}

#pragma mark - 子按钮弹出
- (void)pathAnimation {
    if (_fireworksAnimationView) {
        _fireworksAnimationView.hidden = YES;
    }
    if (_bubbleAnimationView) {
        _bubbleAnimationView.hidden = YES;
    }
    if (!_pathAnimationView) {
        [self functionOfDCPathButton];
    }else {
        _pathAnimationView.hidden = NO;
    }
}

- (void)functionOfDCPathButton {
    // 中央按钮创建
    DCPathButton *dcPathButton = [[DCPathButton alloc]initWithCenterImage:[UIImage imageNamed:@"chooser-button-tab"]
                                                           hilightedImage:[UIImage imageNamed:@"chooser-button-tab-highlighted"]];
    _pathAnimationView = dcPathButton;
    dcPathButton.delegate = self;
    
    // 子按钮创建
    //
    DCPathItemButton *itemButton_1 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-music"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-music-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_2 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-place"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-place-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_3 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-camera"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-camera-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_4 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-thought"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-thought-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_5 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-sleep"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-sleep-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    // 添加进中央按钮
    //
    [dcPathButton addPathItems:@[itemButton_1, itemButton_2, itemButton_3, itemButton_4, itemButton_5]];
    
    [self.view addSubview:dcPathButton];
}
/**
 *  代理
 */
- (void)itemButtonTappedAtIndex:(NSUInteger)index
{
    // 处理子按钮点击事件
    NSLog(@"You tap at index : %ld", index);
}
#pragma mark - 冒泡按钮
- (void)bubbleAnimation {
    if (_fireworksAnimationView) {
        _fireworksAnimationView.hidden = YES;
    }
    if (_pathAnimationView) {
        _pathAnimationView.hidden = YES;
    }
    if (!_bubbleAnimationView) {
        UILabel *homeLabel = [self createHomeButtonView];
        
        DWBubbleMenuButton *upMenuView = [[DWBubbleMenuButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - homeLabel.frame.size.width - 20,self.view.frame.size.height - homeLabel.frame.size.height - 20,homeLabel.frame.size.width,homeLabel.frame.size.height)expansionDirection:DirectionUp];
        upMenuView.homeButtonView = homeLabel;
        [upMenuView addButtons:[self createDemoButtonArray]];
        _bubbleAnimationView = upMenuView;
        
        [self.view addSubview:upMenuView];
    }else {
        _bubbleAnimationView.hidden = NO;
    }
}

- (UILabel *)createHomeButtonView {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.f, 0.f, 40.f, 40.f)];
    
    label.text = @"Tap";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.layer.cornerRadius = label.frame.size.height / 2;
    label.backgroundColor =[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    label.clipsToBounds = YES;
    
    return label;
}

- (NSArray *)createDemoButtonArray {
    NSMutableArray *buttonsMutable = [[NSMutableArray alloc] init];
    
    int i = 0;
    for (NSString *title in @[@"A", @"B", @"C", @"D", @"E", @"F"]) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitle:title forState:UIControlStateNormal];
        
        button.frame = CGRectMake(0.f, 0.f, 30.f, 30.f);
        button.layer.cornerRadius = button.frame.size.height / 2.f;
        button.backgroundColor = [UIColor colorWithRed:0.f green:0.f blue:0.f alpha:0.5f];
        button.clipsToBounds = YES;
        button.tag = i++;
        
        [button addTarget:self action:@selector(dwBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [buttonsMutable addObject:button];
    }
    
    return [buttonsMutable copy];
}
- (void)dwBtnClick:(UIButton *)sender {
    // 处理子按钮的方法
    NSLog(@"DWButton tapped, tag: %ld", (long)sender.tag);
}
#pragma mark - 粒子点赞
- (void)fireworksAnimation {
    if (_bubbleAnimationView) {
        _bubbleAnimationView.hidden = YES;
    }
    if (_pathAnimationView) {
        _pathAnimationView.hidden = YES;
    }
    if (!_fireworksAnimationView) {
        _fireworksAnimationView = [[MCFireworksButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-25, SCREEN_HEIGHT/2-25, 50, 50)];
        _fireworksAnimationView.particleImage = [UIImage imageNamed:@"Sparkle"];
        _fireworksAnimationView.particleScale = 0.05;
        _fireworksAnimationView.particleScaleRange = 0.02;
        [_fireworksAnimationView setImage:[UIImage imageNamed:@"Like"] forState:UIControlStateNormal];
        
        [_fireworksAnimationView addTarget:self action:@selector(functionOfMCFireworksButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_fireworksAnimationView];
    }else {
       _fireworksAnimationView.hidden = NO;
    }
}

- (void)functionOfMCFireworksButton:(UIButton *)sender {
    _selected = !_selected;
    if(_selected) {
        [_fireworksAnimationView popOutsideWithDuration:0.5];
        [_fireworksAnimationView setImage:[UIImage imageNamed:@"Like-Blue"] forState:UIControlStateNormal];
        [_fireworksAnimationView animate];
    }else {
        [_fireworksAnimationView popInsideWithDuration:0.4];
        [_fireworksAnimationView setImage:[UIImage imageNamed:@"Like"] forState:UIControlStateNormal];
    }

    }
@end
