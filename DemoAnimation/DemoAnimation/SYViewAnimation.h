//
//  SYViewAnimation.h
//  zhangshaoyu
//
//  Created by zhangSY on 14-4-3.
//  Copyright (c) 2014年 zhangshaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYViewAnimation : NSObject

#pragma mark - Custom Animation

/*
 1 type 各种动画效果  其中除了'fade', `moveIn', `push' , `reveal' ,其他属于似有的API(我是这么认为的,可以点进去看下注释).可以分别使用'kCATransitionFade', 'kCATransitionMoveIn', 'kCATransitionPush', 'kCATransitionReveal'来调用.
 @"cube"                  立方体翻滚效果
 @"moveIn"                新视图移到旧视图上面
 @"reveal"                显露效果(将旧视图移开,显示下面的新视图)
 @"fade"                  交叉淡化过渡(不支持过渡方向)(默认为此效果)
 @"pageCurl"              向上翻一页
 @"pageUnCurl"            向下翻一页
 @"suckEffect"            收缩效果，类似系统最小化窗口时的神奇效果(不支持过渡方向)
 @"rippleEffect"          滴水效果,(不支持过渡方向)
 @"oglFlip"               上下左右翻转效果
 @"rotate"                旋转效果
 @"push"
 @"cameraIrisHollowOpen"  相机镜头打开效果(不支持过渡方向)
 @"cameraIrisHollowClose" 相机镜头关上效果(不支持过渡方向)
 kCATransitionFade        交叉淡化过渡
 kCATransitionMoveIn      新视图移到旧视图上面
 kCATransitionPush        新视图把旧视图推出去
 kCATransitionReveal      将旧视图移开,显示下面的新视图
 
 2 subType 各种动画方向
 kCATransitionFromRight; 同字面意思(下同)
 kCATransitionFromLeft;
 kCATransitionFromTop;
 kCATransitionFromBottom;
 当type为@"rotate"(旋转)的时候,它也有几个对应的subtype,分别为:
 90cw   逆时针旋转90°
 90ccw  顺时针旋转90°
 180cw  逆时针旋转180°
 180ccw 顺时针旋转180°

 
 3 timingFunction 用于变化起点和终点之间的插值计算,形象点说它决定了动画运行的节奏,比如是均匀变化(相同时间变化量相同)还是先快后慢,先慢后快还是先慢再快再慢.
 动画的开始与结束的快慢,有五个预置分别为(下同):
 kCAMediaTimingFunctionLinear        线性,即匀速
 kCAMediaTimingFunctionEaseIn        先慢后快
 kCAMediaTimingFunctionEaseOut       先快后慢
 kCAMediaTimingFunctionEaseInEaseOut 先慢后快再慢
 kCAMediaTimingFunctionDefault       实际效果是动画中间比较快
 
*/

+ (void)showAnimationType:(NSString *)type
              withSubType:(NSString *)subType
                 duration:(CFTimeInterval)duration
           timingFunction:(NSString *)timingFunction
                     view:(UIView *)theView;

#pragma mark - Preset Animation

// reveal
+ (void)animationRevealFromBottom:(UIView *)view;
+ (void)animationRevealFromTop:(UIView *)view;
+ (void)animationRevealFromLeft:(UIView *)view;
+ (void)animationRevealFromRight:(UIView *)view;

// 渐隐渐消
+ (void)animationEaseIn:(UIView *)view;
+ (void)animationEaseOut:(UIView *)view;

// 翻转
+ (void)animationFlipFromLeft:(UIView *)view;
+ (void)animationFlipFromRigh:(UIView *)view;

// 翻页
+ (void)animationCurlUp:(UIView *)view;
+ (void)animationCurlDown:(UIView *)view;

// push
+ (void)animationPushUp:(UIView *)view;
+ (void)animationPushDown:(UIView *)view;
+ (void)animationPushLeft:(UIView *)view;
+ (void)animationPushRight:(UIView *)view;

// move
+ (void)animationMoveUp:(UIView *)view duration:(CFTimeInterval)duration;
+ (void)animationMoveDown:(UIView *)view duration:(CFTimeInterval)duration;
+ (void)animationMoveLeft:(UIView *)view;
+ (void)animationMoveRight:(UIView *)view;

// 旋转
+ (void)animationRotation:(UIView *)view;

// 缩放
+ (void)animationScale:(UIView *)view;

// 各种旋转缩放效果
+ (void)animationRotateAndScaleEffects:(UIView *)view;

// 旋转同时缩小放大效果
+ (void)animationRotateAndScaleDownUp:(UIView *)view;

#pragma mark - Private API

// 下面动画里用到的某些属性在当前API里是不合法的,但是也可以用.

+ (void)animationFlipFromTop:(UIView *)view;
+ (void)animationFlipFromBottom:(UIView *)view;

+ (void)animationCubeFromLeft:(UIView *)view;
+ (void)animationCubeFromRight:(UIView *)view;
+ (void)animationCubeFromTop:(UIView *)view;
+ (void)animationCubeFromBottom:(UIView *)view;

+ (void)animationSuckEffect:(UIView *)view;

+ (void)animationRippleEffect:(UIView *)view;

+ (void)animationCameraOpen:(UIView *)view;
+ (void)animationCameraClose:(UIView *)view;


/**
 使用步骤
 1 导入QuartzCore.framework
 2 导入头文件 #import "CoreAnimationEffect.h"
 3 使用 [CoreAnimationEffect animationMoveLeft:your view];
 */

/*
 UIViewAnimation
 UIView动画应该是最简单便捷创建动画的方式了,详解http://www.cocoachina.com/bbs/read.php?tid=110168.
 beginAnimations:context               第一个参数用来作为动画的标识,第二个参数给代理代理传递消息.至于为什么一个使用
 setAnimationCurve:                    设置动画的加速或减速的方式(速度)
 setAnimationDuration:                 动画持续时间
 setAnimationTransition:forView:cache: 第一个参数定义动画类型，第二个参数是当前视图对象，第三个参数是是否使用缓冲区
 commitAnimations                      动画结束

 
 CABasicAnimation
 https://developer.apple.com/library/mac/#documentation/cocoa/conceptual/CoreAnimation_guide/Articles/KVCAdditions.html
 便利构造函数 animationWithKeyPath: KeyPath需要一个字符串类型的参数,实际上是一个键-值编码协议的扩展,参数必须是CALayer的某一项属性,你的代码会对应的去改变该属
 性的效果，具体可以填写什么请参考https://developer.apple.com/library/mac/#documentation/cocoa/conceptual/CoreAnimation_guide/Articles/KVCAdditions.html
 例如这里填写的是 @"transform.rotation.z" 意思就是围绕z轴旋转,旋转的单位是弧度.
 这个动画的效果是把view旋转到最小,再旋转回来.你也可以填写@"opacity" 去修改透明度...以此类推.修改layer的属性,可以用这个类.
 toValue 动画结束的值.CABasicAnimation自己只有三个属性(都很重要)(其他属性是继承来的),分别为:
 fromValue(开始值), toValue(结束值), byValue(偏移值),
 这三个属性最多只能同时设置两个;
 他们之间的关系如下:
 如果同时设置了fromValue和toValue,那么动画就会从fromValue过渡到toValue;
 如果同时设置了fromValue和byValue,那么动画就会从fromValue过渡到fromValue + byValue;
 如果同时设置了byValue  和toValue,那么动画就会从toValue - byValue过渡到toValue;
 如果只设置了fromValue,那么动画就会从fromValue过渡到当前的value;
 如果只设置了toValue  ,那么动画就会从当前的value过渡到toValue;
 如果只设置了byValue  ,那么动画就会从从当前的value过渡到当前value + byValue.
 可以这么理解,当你设置了三个中的一个或多个,系统就会根据以上规则使用插值算法计算出一个时间差并同时开启一个Timer.Timer的间隔也就是这个时间差,通过这个Timer去不停地
 刷新keyPath的值.
 而实际上,keyPath的值(layer的属性)在动画运行这一过程中,是没有任何变化的,它只是调用了GPU去完成这些显示效果而已.
 在这个动画里,是设置了要旋转到的弧度,根据以上规则,动画将会从它当前的弧度专旋转到我设置的弧度.
 duration       动画持续时间
 timingFunction 动画起点和终点之间的插值计算,也就是说它决定了动画运行的节奏,是快还是慢,还是先快后慢...

 
 CAAnimationGroup
 顾名思义,这是一个动画组,它允许多个动画组合在一起并行显示.比如这里设置了两个动画,把他们加在动画组里,一起显示.例如你有几个动画,在动画执行的过程中需要同时修改动画的
 某些属性,这时候就可以使用CAAnimationGroup.
 duration     动画持续时间,值得一提的是,如果添加到group里的子动画不设置此属性,group里的duration会统一设置动画(包括子动画)的duration属性;但是如果子动画设置了
 duration属性,那么group的duration属性的值不应该小于每个子动画中duration属性的值,否则会造成子动画显示不全就停止了动画.
 autoreverses 动画完成后自动重新开始,默认为NO.
 repeatCount  动画重复次数,默认为0.
 animations   动画组(数组类型),把需要同时运行的动画加到这个数组里.
 addAnimation:forKey这个方法的forKey参数是一个字符串,这个字符串可以随意设置.如果你需要在动画group执行结束后保存动画效果的话,设置 fillMode 属性,并且把removedOnCompletion 设置为NO;
 
 */

@end
