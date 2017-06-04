//
//  UIViewVC.m
//  DemoAnimation
//
//  Created by zhangSY on 14-4-3.
//  Copyright (c) 2014年 zhangshaoyu. All rights reserved.
//

#import "UIViewVC.h"

@interface UIViewVC ()

@property (nonatomic, retain) UIView *flyView;

@end

@implementation UIViewVC

@synthesize flyView;

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
    
    // 导航栏标题
    [self.navigationItem setTitle:@"UIView"];
    
    [self setUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)loadView
{
    [super loadView];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

#pragma mark - setUI

// 创建视图
- (void)setUI
{
    if ([[UIDevice currentDevice] systemVersion].floatValue >= 7.0)
    {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    
    self.flyView = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 120, 60)];
    self.flyView.layer.anchorPoint = CGPointMake(0.5, 1);
    self.flyView.layer.position = CGPointMake(160, 200);
    self.flyView.layer.transform = CATransform3DMakeRotation(M_PI, 0, 0, 1);
    [self.flyView setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:self.flyView];
    
    // 旋转按钮
    UIButton *showFly = [UIButton buttonWithType:UIButtonTypeCustom];
    [showFly setFrame:CGRectMake(10.0, 10.0, 60, 40)];
    showFly.titleLabel.adjustsFontSizeToFitWidth = YES;
    [showFly setTitle:@"旋转" forState:UIControlStateNormal];
    [showFly setBackgroundColor:[UIColor lightGrayColor]];
    [showFly addTarget:self action:@selector(Fly:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showFly];
    
    // 抖动按钮
    UIButton *showShake = [UIButton buttonWithType:UIButtonTypeCustom];
    [showShake setFrame:CGRectMake(80.0, 10.0, 60, 40)];
    showShake.titleLabel.adjustsFontSizeToFitWidth = YES;
    [showShake setTitle:@"Shake" forState:UIControlStateNormal];
    [showShake setBackgroundColor:[UIColor lightGrayColor]];
    [showShake addTarget:self action:@selector(shakeView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showShake];
    
    // 心动按钮
    UIButton *showHeartbeat = [UIButton buttonWithType:UIButtonTypeCustom];
    [showHeartbeat setFrame:CGRectMake(150.0, 10.0, 60, 40)];
    showHeartbeat.titleLabel.adjustsFontSizeToFitWidth = YES;
    [showHeartbeat setTitle:@"heartbeat" forState:UIControlStateNormal];
    [showHeartbeat setBackgroundColor:[UIColor lightGrayColor]];
    [showHeartbeat addTarget:self action:@selector(heartbeatView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showHeartbeat];
    
    // 放大缩小按钮
    UIButton *showBigAndSmall = [UIButton buttonWithType:UIButtonTypeCustom];
    [showBigAndSmall setFrame:CGRectMake(220.0, 10.0, 60, 40)];
    showBigAndSmall.titleLabel.adjustsFontSizeToFitWidth = YES;
    [showBigAndSmall setTitle:@"bigAndSmall" forState:UIControlStateNormal];
    [showBigAndSmall setBackgroundColor:[UIColor lightGrayColor]];
    [showBigAndSmall addTarget:self action:@selector(bigAndSmallView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showBigAndSmall];
}

// 旋转事件
- (void)Fly:(UIButton *)button
{
    switch (button.tag)
    {
        case 0:
        {
            [self showRoundMenu];
        }
            break;
        case 1:
        {
            [self hideRoundMenu];
        }
            break;
        default:
            break;
    }
    
    button.tag = (button.tag == 0 ? 1 : 0);
}

// 视图旋转动画
- (void)showRoundMenu
{
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"transform"];
    ani.duration = 0.6;
    ani.autoreverses = NO;
    ani.fillMode = kCAFillModeForwards;
    ani.removedOnCompletion = NO;
    ani.toValue = [NSValue valueWithCATransform3D:CATransform3DRotate(self.flyView.layer.transform, -M_PI, 0, 0, 1)];
    [self.flyView.layer addAnimation:ani forKey:nil];
}

- (void)hideRoundMenu
{
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"transform"];
    ani.duration = 0.6;
    ani.autoreverses = NO;
    ani.fillMode = kCAFillModeForwards;
    ani.removedOnCompletion = NO;
    ani.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 1)];
    [self.flyView.layer addAnimation:ani forKey:nil];
}

// 视图抖动动画
- (void)shakeView:(UIButton *)button
{
    CABasicAnimation *shake = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    // 设置抖动幅度
    shake.fromValue = [NSNumber numberWithFloat:-0.3];
    shake.toValue = [NSNumber numberWithFloat:+0.3];
    shake.duration = 0.1f;
    shake.repeatCount = 0.6 / 4 / 0.1f;
    shake.autoreverses = YES;
    [self.flyView.layer addAnimation:shake forKey:@"shakeView"];
}

// 心跳动画
- (void)heartbeatView:(UIButton *)button
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    CATransform3D scale1 = CATransform3DMakeScale(0.8, 0.8, 1);
    CATransform3D scale2 = CATransform3DMakeScale(1.4f, 1.4f, 1);
    CATransform3D scale3 = CATransform3DMakeScale(1.4f - 0.3f, 1.4f - 0.3f, 1);
    CATransform3D scale4 = CATransform3DMakeScale(1.0, 1.0, 1);
    
    NSArray *frameValues = [NSArray arrayWithObjects: [NSValue valueWithCATransform3D:scale1], [NSValue valueWithCATransform3D:scale2], [NSValue valueWithCATransform3D:scale3], [NSValue valueWithCATransform3D:scale4], nil];
    
    [animation setValues:frameValues];
    
    NSArray *frameTimes = [NSArray arrayWithObjects: [NSNumber numberWithFloat:0.05], [NSNumber numberWithFloat:0.2], [NSNumber numberWithFloat:0.6], [NSNumber numberWithFloat:1.0], nil]; [animation setKeyTimes:frameTimes];
    animation.fillMode = kCAFillModeForwards;
    animation.duration = 0.5f;
    animation.repeatCount = 1.2 / 0.5f;
    [self.flyView.layer addAnimation:animation forKey:@"heartbeatView"];
}

// 把view先放大，然后再缩小
- (void)bigAndSmallView:(UIButton *)button
{
    [UIView animateWithDuration:0.3 animations:^{
        self.flyView.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            self.flyView.transform = CGAffineTransformMakeScale(0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3 animations:^{
                self.flyView.transform = CGAffineTransformMakeScale(1.0, 1.0);
            } completion:^(BOOL finished) {
            }];
        }];
    }];
}

// 类似Facebook paper的一个动画
/*
- (void)didPan:(UIPanGestureRecognizer *)gesture
{
    CGPoint location = [gesture locationInView:self.view.superview];
    switch (gesture.state)
    {
        case UIGestureRecognizerStateBegan:
        {
                
            // Cleanup existing behaviors like the "snap" behavior when, after a pan starts, this view
            // gets snapped back into place
            [self.animator removeAllBehaviors];
                
            // Give the view some rotation
            UIDynamicItemBehavior *rotationBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.view]];
            rotationBehavior.allowsRotation = YES;
            rotationBehavior.angularResistance = 10.0f;
                
            [self.animator addBehavior:rotationBehavior];
                
            // Calculate the offset from the center of the view to use in the attachment behavior
            CGPoint viewCenter = self.view.center;
            UIOffset centerOffset = UIOffsetMake(location.x - viewCenter.x, location.y - viewCenter.y);
                
            // Attach to the location of the pan in the container view.
            self.panAttachment = [[UIAttachmentBehavior alloc] initWithItem:self.view offsetFromCenter:centerOffset attachedToAnchor:location];
            self.panAttachment.damping = 0.7f;
            self.panAttachment.length = 0;
            [self.animator addBehavior:self.panAttachment];
                
                break;
        }
        case UIGestureRecognizerStateChanged:
        {
            // Now when the finger moves around we just update the anchor point,
            // which will move the view around
            self.panAttachment.anchorPoint = location;
                
            break;
        }
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:
        {
            // Not enough velocity to exit the modal, so snap it back into the center of the screen
            [self.animator removeAllBehaviors];
            
            UISnapBehavior *snapIt = [[UISnapBehavior alloc] initWithItem:self.view snapToPoint:CGPointMake(160, 284)];
            snapIt.damping = 0.7;
            
            [self.animator addBehavior:snapIt];
            
            
            break;
        }
        default:
            break;
    }
}
*/

// 图像左右抖动
- (void)shakeView
{
    CABasicAnimation* shake = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    shake.fromValue = [NSNumber numberWithFloat:-M_PI/32];
    
    shake.toValue = [NSNumber numberWithFloat:+M_PI/32];
    
    shake.duration = 0.1;
    
    shake.autoreverses = YES; //是否重复
    
    shake.repeatCount = 4;
    
    [self.flyView.layer addAnimation:shake forKey:@"shakeAnimation"];
    
    self.flyView.alpha = 1.0;
    
    [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionAllowUserInteraction animations:^{
        self.flyView.alpha = 0.0; //透明度变0则消失
    } completion:nil];
}

// 图像顺时针旋转
- (void)transView
{
    CABasicAnimation* shake = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    shake.fromValue = [NSNumber numberWithFloat:0];
    shake.toValue = [NSNumber numberWithFloat:2 * M_PI];
    shake.duration = 0.8;
    shake.autoreverses = NO;
    shake.repeatCount = 1;
    [self.flyView.layer addAnimation:shake forKey:@"shakeAnimation"];
    self.flyView.alpha = 1.0;
    [UIView animateWithDuration:10.0 delay:0.0 options:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionAllowUserInteraction animations:^{
        self.flyView.alpha = 0.0;
    } completion:nil];
}

    
// 图像关键帧动画
- (void)keyView
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    CGMutablePathRef aPath = CGPathCreateMutable();
    CGPathMoveToPoint(aPath, nil, 20, 20);
    CGPathAddCurveToPoint(aPath, nil, 160, 30, 220, 220, 240, 420);
    animation.path = aPath;
    animation.autoreverses = YES;
    animation.duration = 2;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation.rotationMode = @"auto";
    [self.flyView.layer addAnimation:animation forKey:@"position"];
}
    
// 组合动画 CAAnimationGroup
- (void)groupView
{
    CABasicAnimation *flip = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    flip.toValue = [NSNumber numberWithDouble:-M_PI];
    CABasicAnimation *scale= [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.toValue = [NSNumber numberWithDouble:12];
    scale.duration = 1.5;
    scale.autoreverses = YES;

    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = [NSArray arrayWithObjects:flip, scale, nil];
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    group.duration = 3;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    
    [self.flyView.layer addAnimation:group forKey:@"position"];
}

    
// 指定时间内旋转图片
/*
//启动定时器旋转光圈
- (void)startRotate
{
    self.rotateTimer = [NSTimer scheduledTimerWithTimeInterval:0.02
                                                        target:self
                                                      selector:@selector(rotateGraduation)
                                                      userInfo:nil
                                                       repeats:YES];
}
    
// 关闭定时器
- (void)stopTimer
{
    if ([self.rotateTimerisValid])
    {
        [self.rotateTimerinvalidate];
        self.rotateTimer = nil;
    }
}
     
// 旋转动画
- (void)rotateGraduation
{
    self.timeCount--;
    if (self.timeCount == 0)
    {
        [self stopTimer];
        // doSomeThing //旋转完毕 可以干点别的
        self.timeCount = 25;
    }
    else
    {
        //计算角度 旋转
        static CGFloat radian = 150 * (M_2_PI / 360);
        CGAffineTransform transformTmp = self.lightImageView.transform;
        transformTmp = CGAffineTransformRotate(transformTmp, radian);
        self.lightImageView.transform = transformTmp;
    };
}
*/

//    调用方法
//     
//    self.timeCount = 25; //动画执行25次
//     
//    [self startRotate];
//    
//    最后那个
//    static CGFloat radian = 150 * (M_2_PI / 360);
//     
//    应该改为
//    static CGFloat radian = 150 * (M_PI * 2 / 360);
    
/////////

// 自定义弹出动画，类似于苹果弹出视图。
// 直接调用代码，添加到视图层上，就会看到效果。
+ (CAKeyframeAnimation *)getKeyframeAni
{
    CAKeyframeAnimation *popAni = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    popAni.duration = 0.4;
    popAni.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01, 0.01, 1.0)],
                      [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1, 1.1, 1.0)],
                      [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)],
                      [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    popAni.keyTimes = @[@0.0, @0.5, @0.75, @1.0];
    popAni.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                               [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                               [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                               [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    return popAni;
}
    
@end
