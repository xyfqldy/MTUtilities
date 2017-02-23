//
//  UIColor+Hex.h
//  Lecai
//
//  Created by ZhuangYinPing on 15/8/7.
//  Copyright (c) 2015年 John's Awesome App House. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)
/**
 *给出16禁止的字符串  
 *例如：@“#112233”
 */
+ (UIColor *)colorFromHexString:(NSString *)hexString;

+ (UIColor *)defaultColorForLC;
@end
