//
//  Cache.m
//  Lecai
//
//  Created by ZhuangYinPing on 15/10/22.
//  Copyright (c) 2015年 John's Awesome App House. All rights reserved.
//

#import "Cache.h"
@interface Cache ()
@property(nonatomic,strong) NSCache *cache;
@end
@implementation Cache

+ (instancetype)sharedInstance
{
    static Cache *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] initPrivate];
    });
    return sharedInstance;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use + [Cache sharedInstance]"
                                 userInfo:nil];
}

- (instancetype)initPrivate
{
    self = [super init];
    if (self) {
        self.cache = [[NSCache alloc] init];
        self.cache.countLimit = 50;
        self.cache.totalCostLimit = 50 * 1024 * 1024; //50M
        
    }
    return self;
}

- (void)setObject:(id)obj forKey:(id)key
{
    NSLog(@"try to cache key:%@",key);
    if (obj && key) {
        [self.cache setObject:obj forKey:key];
    }    
}

- (id)objectForKey:(id)key
{
    return [self.cache objectForKey:key];
}

- (NSData *)imageFromCache:(NSString *)key
{
    NSData *cacheData = [[Cache sharedInstance] objectForKey:key];
    if (cacheData) {
        return cacheData;
    }
    return nil;
}

- (NSData *)imageFromDisk:(NSString *)key
{
    
    NSURL *filePath = [self pathFromKey:key];
    NSLog(@"try to load file from disk:%@",filePath);
    NSData *data = [NSData dataWithContentsOfURL:filePath];
    if (data) {
        NSLog(@"got the file from disk:%@",filePath);
        NSLog(@"Cached it on memory");
        [self setObject:data forKey:key];

        return data;
    }
    return nil;
}

static NSURL *imageCacheURL;
- (NSURL *)imageCacheDictionary
{
    if (!imageCacheURL) {
        NSURL *documentURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
        NSLog(@"Store image here:%@",[documentURL absoluteString]);
        
        
        imageCacheURL = [documentURL URLByAppendingPathComponent:@"imagecache" isDirectory:YES];
        NSError *error;
        if(![[NSFileManager defaultManager] createDirectoryAtURL:imageCacheURL withIntermediateDirectories:YES attributes:nil error:&error]){
            NSLog(@"Create directory error: %@", error);
        }
    }
    
    return imageCacheURL;
    
}

- (NSURL *)pathFromKey:(NSString *)key
{
#pragma mark ？崩溃？  key为nil？？？
    if (key) {
        NSURL *imageCacheDic = [self imageCacheDictionary];
        return [imageCacheDic URLByAppendingPathComponent:key]; 
    }else{
        return nil;
    }

}

- (void)setImage:(NSData *)imageData forKey:(NSString *)key
{
    [self setObject:imageData forKey:key];
    [imageData writeToURL:[[Cache sharedInstance] pathFromKey:key] atomically:YES];
}

- (NSData *)imageForKey:(NSString *)key
{
    NSData *data = [self objectForKey:key];
    if (!data) {
        data = [self imageFromDisk:key];
    }
    return data;
}

- (void)clearCache
{
    [self.cache removeAllObjects];
}
@end
