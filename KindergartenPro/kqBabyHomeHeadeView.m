//
//  kqBabyHomeHeadeView.m
//  KindergartenPro
//
//  Created by 程海峰 on 16/7/7.
//  Copyright © 2016年 海峰. All rights reserved.
//

#import "kqBabyHomeHeadeView.h"
#define PI 3.14
@implementation kqBabyHomeHeadeView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
//    [[UIColor whiteColor] set];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context,1,1,1,1.0);//画笔线的颜色
    CGContextSetLineWidth(context, 1.0);//线的宽度
    //void CGContextAddArc(CGContextRef c,CGFloat x, CGFloat y,CGFloat radius,CGFloat startAngle,CGFloat endAngle, int clockwise)1弧度＝180°/π （≈57.3°） 度＝弧度×180°/π 360°＝360×π/180 ＝2π 弧度
    // x,y为圆点坐标，radius半径，startAngle为开始的弧度，endAngle为 结束的弧度，clockwise 0为顺时针，1为逆时针。
    float x1 = 0,y1 = 120.0,x2 = SCREEN_W / 2, y2 = 110.0, x3 = SCREEN_W,y3 = 120.0;
    float a = 2 * (x2 - x1);
    float b = 2 * ( y2 - y1);
    float c = x2 * x2 + y2 * y2 - x1 * x1 - y1 * y1;
    float d = 2 * (x3 - x2);
    float e = 2 * (y3 - y2);
    float f = x3 * x3 + y3 * y3 - x2 * x2 - y2 * y2;
    float x = (b * f - e * c) / (b * d - e * a);
    float y = (d * c - a * f) / (b * d - e * a);
    float r = sqrt((x - x1) * (x - x1) + (y - y1) * (y - y1));
    //填充圆，无边框
    CGContextAddArc(context, x, y, r, 0, 2*PI, 0); //添加一个圆
    CGContextDrawPath(context, kCGPathFill);//绘制填充
}

@end
