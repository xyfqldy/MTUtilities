//
//  UIImage+Scala.m
//  Lecai
//
//  Created by ZhuangYinPing on 15/10/21.
//  Copyright (c) 2015年 John's Awesome App House. All rights reserved.
//

#import "UIImage+Scala.h"

@implementation UIImage (Scala)

- (UIImage *)imageByScalingToSize:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, YES, 0.0);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resizedImage;
}
@end
