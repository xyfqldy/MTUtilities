//
//  UIView+Circle.m
//  Lecai
//
//  Created by ZhuangYinPing on 15/10/22.
//  Copyright (c) 2015年 John's Awesome App House. All rights reserved.
//

#import "UIView+Circle.h"

@implementation UIView (Circle)

-(void)setCornerRadius:(CGFloat )value{
    self.layer.cornerRadius = value;
    self.layer.masksToBounds = YES;
}

- (void)viewWithCircle
{
    [self viewWithCircle:[UIColor whiteColor] circleWidth:1.0];
}

- (void)viewWithCircle:(BOOL)whiteCorner//YES display circle bound，NO, does not display
{
    CGFloat width = 0.0f;
    if (whiteCorner) {
        width = 1.0f;
    }
    [self viewWithCircle:[UIColor whiteColor] circleWidth:width];
}

- (void)viewWithCornerRadius:(CGFloat)cornerRadius;
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius =cornerRadius;
}

- (void)viewWithCircle:(UIColor *)circleColor circleWidth:(CGFloat)circleWidth
{
    self.clipsToBounds = YES;
    self.layer.cornerRadius = self.frame.size.width/2;
    if (circleWidth) {
        self.layer.borderWidth = circleWidth;
        self.layer.borderColor = circleColor.CGColor;
    }
}

@end
