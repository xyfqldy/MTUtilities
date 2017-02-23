//
//  NSString+Formatter.m
//  Lecai
//
//  Created by ZhuangYinPing on 15/11/1.
//  Copyright (c) 2015年 John's Awesome App House. All rights reserved.
//

#import "NSString+Formatter.h"

@implementation NSString (Formatter)

static  NSDateFormatter *dateFormatter;

- (NSDate *)date;
{
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"yyyy-MM-dd";
    }
   
    return [dateFormatter dateFromString:self];
}
@end
