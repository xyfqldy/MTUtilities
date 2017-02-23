//
//  UIView+Circle.h
//  Lecai
//
//  Created by ZhuangYinPing on 15/10/22.
//  Copyright (c) 2015年 John's Awesome App House. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Circle)
/**
 *设置圆角
 *通过cornerRadius、masksToBounds设置。
 */
-(void)setCornerRadius:(CGFloat )value;

- (void)viewWithCircle;
- (void)viewWithCircle:(BOOL)whiteCorner;//YES display circle bound，NO, does not display
- (void)viewWithCornerRadius:(CGFloat)cornerRadius;
- (void)viewWithCircle:(UIColor *)circleColor circleWidth:(CGFloat)circleWidth;
@end
