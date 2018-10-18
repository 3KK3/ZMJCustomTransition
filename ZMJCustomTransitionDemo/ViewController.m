//
//  ViewController.m
//  ZMJCustomTransitionDemo
//
//  Created by YZY on 2018/10/18.
//  Copyright © 2018 ZMJ. All rights reserved.
//

#import "ViewController.h"
#import "NewViewController.h"
#import "ZMJCustomTransition/ZMJTransitioningImpl.h"

@interface ViewController ()
@property (nonatomic, strong) ZMJTransitioningImpl *transitionImpl;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // present
    NewViewController *newVC = [NewViewController new];
    newVC.transitioningDelegate = self.transitionImpl;
    [self presentViewController: newVC animated: YES completion: nil];
    
    
    // nav push ：需要初始化 ZMJNavigationTransitioningImpl并设置为转场代理
//    NewViewController *pcVC = [[NewViewController alloc] init];
//    self.navigationController.delegate = self.navTransitionImpl;
//    [self.navigationController pushViewController: pcVC animated: YES];
}

#pragma mark -- getter
- (ZMJTransitioningImpl *)transitionImpl {
    if (!_transitionImpl) {
        _transitionImpl = [[ZMJTransitioningImpl alloc] init];
    }
    return _transitionImpl;
}

@end
