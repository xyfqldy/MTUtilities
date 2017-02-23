//
//  UIColor+Hex.m
//  Lecai
//
//  Created by ZhuangYinPing on 15/8/7.
//  Copyright (c) 2015年 John's Awesome App House. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)
+ (UIColor *)colorFromHexString:(NSString *)hexString {
    
    NSString *noHashString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""]; // remove the #
    NSScanner *scanner = [NSScanner scannerWithString:noHashString];
    [scanner setCharactersToBeSkipped:[NSCharacterSet symbolCharacterSet]]; // remove + and $
    unsigned hex;
    if (![scanner scanHexInt:&hex]) return nil;
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    return [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:1.0f];
}

+ (UIColor *)defaultColorForLC
{
    return [UIColor colorFromHexString:@"#e74e3e"];
}

@end
