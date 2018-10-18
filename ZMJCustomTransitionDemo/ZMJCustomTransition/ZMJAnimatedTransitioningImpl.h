//
//  ZMJAnimatedTransitioningImpl.h
//  ZMJCustomTransitionDemo
//
//  Created by YZY on 2018/10/18.
//  Copyright © 2018 ZMJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ZMJTransitionModalType) {
    ZMJTransitionModalTypePresention,
    ZMJTransitionModalTypeDismiss
};

@interface ZMJAnimatedTransitioningImpl : NSObject <UIViewControllerAnimatedTransitioning>
- (instancetype)initWithModalType:(ZMJTransitionModalType)modalType;
@end

NS_ASSUME_NONNULL_END
