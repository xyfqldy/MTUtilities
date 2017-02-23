//
//  UITableView+AttachProperties.h
//  Lecai
//
//  Created by I_MT on 16/9/13.
//  Copyright © 2016年 John's Awesome App House. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (AttachProperties)
@property (nonatomic,strong)NSMutableArray *sources;
@property (nonatomic,strong)NSMutableArray *rowHeights;
@property (nonatomic,assign)NSInteger  pageIndex;//默认获取到的是1
@property (nonatomic,assign)NSInteger  pageSize;//默认获取到的是10


@end
