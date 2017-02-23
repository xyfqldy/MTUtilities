//
//  NSString+Hash.h
//  Lecai
//
//  Created by ZhuangYinPing on 15/10/22.
//  Copyright (c) 2015年 John's Awesome App House. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Hash)
- (NSString *)MD5String;

- (NSString *)base64String;

- (NSString *)decodeBase64;

@end
