//
//  NewViewController.m
//  ZMJCustomTransitionDemo
//
//  Created by YZY on 2018/10/18.
//  Copyright © 2018 ZMJ. All rights reserved.
//

#import "NewViewController.h"

@interface NewViewController ()

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated: YES completion: nil];
}


@end
