//
//  DFLSpecialView.m
//  UIBezierPath(贝塞尔曲线)
//
//  Created by 杭州移领 on 17/1/13.
//  Copyright © 2017年 DFL. All rights reserved.
//

#import "DFLSpecialView.h"

@implementation DFLSpecialView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.strokeColor = [[UIColor redColor] CGColor];
    layer.fillColor = [UIColor yellowColor].CGColor;
    CGFloat viewW = rect.size.width , viewH = rect.size.height;
    CGFloat midX = CGRectGetWidth(rect) / 2;
    UIBezierPath *addLinePath = [UIBezierPath bezierPath];
    [addLinePath moveToPoint:CGPointMake(0, 10)];
    [addLinePath addLineToPoint:CGPointMake(midX - 5, 10)];
    [addLinePath addLineToPoint:CGPointMake(midX, 0)];
    [addLinePath addLineToPoint:CGPointMake(midX + 5, 10)];
    [addLinePath addLineToPoint:CGPointMake(viewW, 10)];
    [addLinePath addLineToPoint:CGPointMake(viewW, viewH)];
    [addLinePath addLineToPoint:CGPointMake(0, viewH)];
    [addLinePath addLineToPoint:CGPointMake(0, 10)];
    layer.path = addLinePath.CGPath;
    [self.layer addSublayer:layer];
}



@end
