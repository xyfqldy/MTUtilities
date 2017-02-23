//
//  NSDate+Formatter.m
//  Lecai
//
//  Created by ZhuangYinPing on 15/10/11.
//  Copyright (c) 2015年 John's Awesome App House. All rights reserved.
//

#import "NSDate+Formatter.h"

@implementation NSDate (Formatter)


static NSDateFormatter *dateFormatter = nil;

- (NSString *)formattedStringWithFormatter:(NSString *)formatter
{
    [self dateFormatter].dateFormat = formatter;
    
    return [[self dateFormatter] stringFromDate:self];
}

- (NSDateFormatter *)dateFormatter
{
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
    }
    return dateFormatter;
}

-(NSString *)defaultFormattedString
{
    return [self formattedStringWithFormatter:@"HH:mm MM/dd"];
}
+
(NSDate *)changeDateToLocalDate:(NSDate *)date{
    NSTimeZone *zone=[NSTimeZone systemTimeZone];
    NSInteger interval=[zone secondsFromGMTForDate:date];
    NSDate *localDate=[date dateByAddingTimeInterval:interval];
    return localDate;
}
+(NSDate *)changeStringToLocalDate:(NSString *)string{
    NSDateFormatter *dateFormart=[[NSDateFormatter alloc]init];
    [dateFormart setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate *dateFromString=[dateFormart dateFromString:string];
    NSDate *localDate=[self changeDateToLocalDate:dateFromString];
    return localDate;
}
+(NSNumber *)changeDateToNumber:(NSDate *)date{
    return  [NSNumber numberWithDouble:[[NSDate date] timeIntervalSinceReferenceDate]];
}
+(NSString *)changeDateToString:(NSDate *)date WithDateFormart:(NSDateFormatter *)dateFormatter{
    NSDateFormatter *formatter=dateFormatter;
    if (!dateFormatter ||!dateFormatter.dateFormat) {
     formatter = [[NSDateFormatter alloc]init];
//        yyyy-MM-dd HH:mm:ss.SSS
    [formatter setDateFormat:@"MM-dd HH:mm:ss"];//默认方式
    }

    return [formatter stringFromDate:date];
}
@end
