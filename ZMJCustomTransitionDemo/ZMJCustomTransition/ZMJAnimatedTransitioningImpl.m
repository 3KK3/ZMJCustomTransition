//
//  ZMJAnimatedTransitioningImpl.m
//  ZMJCustomTransitionDemo
//
//  Created by YZY on 2018/10/18.
//  Copyright © 2018 ZMJ. All rights reserved.
//

#import "ZMJAnimatedTransitioningImpl.h"

@interface ZMJAnimatedTransitioningImpl () <CAAnimationDelegate>
@property (nonatomic, assign) ZMJTransitionModalType modalType;
@property (nonatomic, assign)id<UIViewControllerContextTransitioning> transitionContext;
@end

@implementation ZMJAnimatedTransitioningImpl

- (instancetype)initWithModalType:(ZMJTransitionModalType)modalType {
    if (self = [super init]) {
        _modalType = modalType;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {

    switch (_modalType) {
        case ZMJTransitionModalTypePresention: {
            return 0.25;
        }
            break;
        case  ZMJTransitionModalTypeDismiss: {
            return 0.16;
        }
    }
}

// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    _transitionContext = transitionContext;
    
    UIView *containerView = [transitionContext containerView];
    
    UIViewController * toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController * fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];

        //modal方式 custom，  只有present时候需要add  dismiss时候不需要add；nav都需要
    [containerView addSubview:toVC.view];
    
    CGPoint startPoint = CGPointMake(toVC.view.frame.size.width - 10, 60);

    UIBezierPath *initPath = [UIBezierPath bezierPathWithOvalInRect:(CGRect){startPoint,CGSizeZero}];
    CGFloat radius = sqrt(startPoint.x * startPoint.x  + ([UIScreen mainScreen].bounds.size.height-startPoint.y) * ([UIScreen mainScreen].bounds.size.height-startPoint.y));
    UIBezierPath *finalPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset((CGRect){startPoint,CGSizeZero}, -radius, -radius)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    
    CABasicAnimation *alphaAnim = [CABasicAnimation animationWithKeyPath: @"opacity"];
    alphaAnim.duration = [self transitionDuration:transitionContext];
    
    CABasicAnimation *pathAnim = [CABasicAnimation animationWithKeyPath:@"path"];
    
    switch (_modalType) {
        case ZMJTransitionModalTypePresention: {
            
            maskLayer.path = finalPath.CGPath;
            toVC.view.layer.mask = maskLayer;
            pathAnim.fromValue = (__bridge id _Nullable)(initPath.CGPath);
            pathAnim.toValue = (__bridge id _Nullable)(finalPath.CGPath);
            
            alphaAnim.fromValue = @(0);
            alphaAnim.toValue = @(1);
            [toVC.view.layer addAnimation: alphaAnim forKey: @"toaaa"];
        }
            break;
        case  ZMJTransitionModalTypeDismiss: {
            [containerView bringSubviewToFront: fromVC.view];
            
            maskLayer.path = initPath.CGPath;
            fromVC.view.layer.mask = maskLayer;
            pathAnim.fromValue = (__bridge id _Nullable)(finalPath.CGPath);
            pathAnim.toValue = (__bridge id _Nullable)(initPath.CGPath);
        }
            break;
    }
    pathAnim.duration = [self transitionDuration:transitionContext];
    pathAnim.delegate = self;
    [maskLayer addAnimation:pathAnim forKey:@"path"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (!flag) {
        return;
    }
    UIViewController * toVC = [_transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController * fromVC = [_transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    switch (_modalType) {
        case ZMJTransitionModalTypePresention: {

        }
            break;
        case  ZMJTransitionModalTypeDismiss: {
        }
            break;
    }
    [_transitionContext completeTransition: !_transitionContext.transitionWasCancelled];
}

@end
