//
//  DFLBackgroundView.m
//  UIBezierPath(贝塞尔曲线)
//
//  Created by 杭州移领 on 17/1/13.
//  Copyright © 2017年 DFL. All rights reserved.
//

#import "DFLBackgroundView.h"

@interface DFLBackgroundView ()

@property (nonatomic , strong) UIImageView *imageView;

@property (nonatomic , strong) UIButton *loginButton;

@property (nonatomic , strong) DFLDrawRectView *drawView;

@end

@implementation DFLBackgroundView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        self.imageView = [UIImageView new];
        self.imageView.backgroundColor = [UIColor redColor];
        [self addSubview:self.imageView];
        
        self.loginButton = [UIButton new];
        [self.loginButton setTitle:@"马上登陆" forState:UIControlStateNormal];
        self.loginButton.backgroundColor = [UIColor redColor];
        [self addSubview:self.loginButton];
        
        self.drawView = [[DFLDrawRectView alloc] init];
        [self addSubview:self.drawView];
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    self.imageView.frame = CGRectMake((self.frame.size.width - 80) / 2, 10, 80, 80);
    self.drawView.frame = CGRectMake(0, CGRectGetMaxY(self.imageView.frame) + 10,self.frame.size.width, 20);
    self.loginButton.frame = CGRectMake(20, CGRectGetMaxY(self.drawView.frame) + 10, self.frame.size.width - 40, 40);
    self.loginButton.layer.cornerRadius = 20;
    self.loginButton.layer.masksToBounds = YES;

}

@end




@implementation DFLDrawRectView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
 
    }
    return self;
}


/**
  绘制圆弧线
 @param center 圆弧的中心点
 @param startAngle 开始角度
 @param endAngle 结束角度 
 @param radius 圆弧半经
 @return <#return value description#>
 */
- (CAShapeLayer *)drawRectArcWithCenter:(CGPoint)center
                             startAngle:(CGFloat)startAngle
                               endAngle:(CGFloat)endAngle
                                 radius:(CGFloat)radius {
    //创建绘制涂层
    CAShapeLayer *layer = [CAShapeLayer layer];
    // 画圆弧
    UIBezierPath *arcPath = [UIBezierPath bezierPathWithArcCenter:center
                                                           radius:radius
                                                       startAngle:startAngle
                                                         endAngle:endAngle
                                                        clockwise:YES];
//    //圆弧线宽
    layer.lineWidth = 4.0;
//    //设置填充色
    [layer setFillColor:[UIColor lightGrayColor].CGColor];
//    //线颜色
    [layer setStrokeColor:[UIColor redColor].CGColor];
    layer.path = arcPath.CGPath;
    return layer;
    
    
    
}

- (CAShapeLayer *)drawRectLineWithStartPoint:(CGPoint)startPoint
                                    endPoint:(CGPoint)endPoint {
    //创建绘制涂层
    CAShapeLayer *layer = [CAShapeLayer layer];
    //圆弧线宽
    layer.lineWidth = 0.5;
    //虚线间隔
    layer.lineDashPattern = @[@(5)];
  
    //设置填充色
    [layer setFillColor:[UIColor clearColor].CGColor];
    //线颜色
    [layer setStrokeColor:[UIColor redColor].CGColor];
    /**
     首尾连接类型
     kCGLineJoinMiter, 默认的表示斜接
     kCGLineJoinRound, 圆滑衔接
     kCGLineJoinBevel  斜角连接*/
    [layer setLineJoin:kCALineJoinBevel];
    /**
     LineCap 端点类型
     kCGLineCapButt,  默认的
     kCGLineCapRound, 轻微圆角
     kCGLineCapSquare 正方形 */
    [layer setLineCap:kCALineCapRound];

    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:startPoint];
    [linePath addLineToPoint:endPoint];
    layer.path = linePath.CGPath;
    return layer;
    
}


- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    CAShapeLayer *lineLayer = [self drawRectLineWithStartPoint:CGPointMake(15,self.frame.size.height / 2) endPoint:CGPointMake(self.frame.size.width - 15, self.frame.size.height / 2)];
    
    CAShapeLayer *leftArcLayer = [self drawRectArcWithCenter:CGPointMake(0, self.frame.size.height/ 2) startAngle:M_PI * 3 / 2 endAngle:M_PI  / 2  radius:self.frame.size.height/ 2];
    
    CAShapeLayer *rightArcLayer =  [self drawRectArcWithCenter:CGPointMake(self.frame.size.width, self.frame.size.height/ 2) startAngle:M_PI / 2 endAngle:M_PI * 3 / 2 radius:self.frame.size.height/ 2];
    [self.layer addSublayer:lineLayer];
    [self.layer addSublayer:leftArcLayer];
    [self.layer addSublayer:rightArcLayer];
}



@end
