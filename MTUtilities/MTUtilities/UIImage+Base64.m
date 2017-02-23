//
//  UIImage+Base64.m
//  Lecai
//
//  Created by ZhuangYinPing on 15/10/28.
//  Copyright (c) 2015年 John's Awesome App House. All rights reserved.
//

#import "UIImage+Base64.h"

@implementation UIImage (Base64)
- (NSString *)base64
{
    NSData *imageData = UIImagePNGRepresentation(self);
    NSString *base64String = [imageData base64EncodedStringWithOptions:0];
    return base64String;
}
@end
