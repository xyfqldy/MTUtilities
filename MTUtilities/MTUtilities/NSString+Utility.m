//
//  NSString+Utility.m
//  Lecai
//
//  Created by ZhuangYinPing on 15/11/19.
//  Copyright (c) 2015年 John's Awesome App House. All rights reserved.
//

#import "NSString+Utility.h"

@implementation NSString (Utility)
- (NSArray *)allIndexesOfOccurrence:(NSString *)substring
{
    NSMutableArray *indexesOfArray = [NSMutableArray new];
    
    NSRange range = NSMakeRange(0, self.length);
    
    int counter = 0;
    do {
        range = [self rangeOfString:substring options:NSLiteralSearch range:range];
        if (range.location != NSNotFound) {
            [indexesOfArray addObject:@(range.location - counter * substring.length -1)];
            range.length = self.length - range.location - substring.length;
            range.location = range.location + substring.length;
            counter++;
        }
    } while (range.location != NSNotFound);
  
    
    return indexesOfArray;
}

@end
