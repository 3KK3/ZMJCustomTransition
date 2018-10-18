//
//  ZMJTransitioningImpl.m
//  ZMJCustomTransitionDemo
//
//  Created by YZY on 2018/10/18.
//  Copyright © 2018 ZMJ. All rights reserved.
//

#import "ZMJTransitioningImpl.h"
#import "ZMJAnimatedTransitioningImpl.h"
#import "ZMJPresentionController.h"

@implementation ZMJTransitioningImpl
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    ZMJAnimatedTransitioningImpl *animImpl = [[ZMJAnimatedTransitioningImpl alloc] initWithModalType: ZMJTransitionModalTypePresention];
    return animImpl;
    
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    ZMJAnimatedTransitioningImpl *animImpl = [[ZMJAnimatedTransitioningImpl alloc] initWithModalType: ZMJTransitionModalTypeDismiss];
    return animImpl;
}

- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source {
    
    return [[ZMJPresentionController alloc] initWithPresentedViewController: presented presentingViewController: presenting];
}
@end
