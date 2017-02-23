//
//  Cache.h
//  Lecai
//
//  Created by ZhuangYinPing on 15/10/22.
//  Copyright (c) 2015年 John's Awesome App House. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cache : NSObject
+ (instancetype)sharedInstance;
- (void)setObject:(id)obj forKey:(id)key;
- (id)objectForKey:(id)key;

- (NSURL *)pathFromKey:(NSString *)key;
- (NSURL *)imageCacheDictionary;

- (NSData *)imageFromDisk:(NSString *)key;
- (NSData *)imageFromCache:(NSString *)key;

- (void)setImage:(NSData *)imageData forKey:(NSString *)key;
- (NSData *)imageForKey:(NSString *)key;

- (void)clearCache;
@end
