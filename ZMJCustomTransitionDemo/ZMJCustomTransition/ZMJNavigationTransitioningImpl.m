//
//  ZMJNavigationTransitioningImpl.m
//  ZMJCustomTransitionDemo
//
//  Created by YZY on 2018/10/18.
//  Copyright © 2018 ZMJ. All rights reserved.
//

#import "ZMJNavigationTransitioningImpl.h"
#import "ZMJAnimatedTransitioningImpl.h"

@implementation ZMJNavigationTransitioningImpl
//- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
//                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController {
//    return self.interactive ? [[UIPercentDrivenInteractiveTransition alloc] init] : nil;
//
//}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC {
    ZMJTransitionModalType type = ZMJTransitionModalTypePresention;
    if (UINavigationControllerOperationPop == operation) {
        type = ZMJTransitionModalTypeDismiss;
    }
    
    ZMJAnimatedTransitioningImpl *animImpl = [[ZMJAnimatedTransitioningImpl alloc] initWithModalType: type];
    return animImpl;
}
@end
