//
//  ViewController.m
//  UIBezierPath(贝塞尔曲线)
//
//  Created by 杭州移领 on 17/1/13.
//  Copyright © 2017年 DFL. All rights reserved.
//

#import "ViewController.h"
#import "DFLBackgroundView.h"
#import "DFLSpecialView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    DFLBackgroundView *bgView = [[DFLBackgroundView alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width - 20, 180)];
    [self.view addSubview:bgView];
    
    DFLSpecialView *specialView = [[DFLSpecialView alloc] initWithFrame:CGRectMake(10, 300, self.view.frame.size.width - 20, 180)];
    [self.view addSubview:specialView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
