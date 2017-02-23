//
//  NSNumber+Yuan.m
//  Lecai
//
//  Created by ZhuangYinPing on 15/8/29.
//  Copyright (c) 2015年 John's Awesome App House. All rights reserved.
//

#import "NSNumber+Yuan.h"

@implementation NSNumber (Yuan)
- (NSNumber *)yuan
{
    
//    NSString *fString=[NSString stringWithFormat:@".2%f",[self floatValue]/1000.0f];
//    return @([fString floatValue]);
    return [NSNumber numberWithDouble:(double)[self floatValue] / 1000.0f];
}

static dispatch_once_t onceToken;
- (NSString *)localizeYuan
{
    static NSNumberFormatter *currencyFormatter;
    dispatch_once(&onceToken, ^{
       currencyFormatter =  [[NSNumberFormatter alloc] init];
       currencyFormatter.numberStyle =NSNumberFormatterCurrencyStyle;
        NSLocale *local = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
       currencyFormatter.locale = local;
    });
    

    return  [currencyFormatter stringFromNumber:[self yuan]];
}
           
@end
