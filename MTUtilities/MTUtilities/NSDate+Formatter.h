//
//  NSDate+Formatter.h
//  Lecai
//
//  Created by ZhuangYinPing on 15/10/11.
//  Copyright (c) 2015年 John's Awesome App House. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Formatter)
- (NSString *)formattedStringWithFormatter:(NSString *)formatter;


- (NSString *)defaultFormattedString;
/**
 date转换成本地时间（标准date）
 */
+(NSDate *)changeDateToLocalDate:(NSDate *)date;
/**
 *string转换成本地时间（标准date对应的string）
 *不用转，这个就是本地时间？why？
 */
+(NSDate *)changeStringToLocalDate:(NSString *)string;
/**
 date转number
 */
+(NSNumber *)changeDateToNumber:(NSDate *)date;
/**
 将date转化成制定format的string
 */
+(NSString *)changeDateToString:(NSDate *)date WithDateFormart:(NSDateFormatter *)dateFormatter;
/**
 number转换成nsdate
 */
@end
