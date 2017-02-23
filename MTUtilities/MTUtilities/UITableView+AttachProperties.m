//
//  UITableView+AttachProperties.m
//  Lecai
//
//  Created by I_MT on 16/9/13.
//  Copyright © 2016年 John's Awesome App House. All rights reserved.
//

#import "UITableView+AttachProperties.h"
#import <objc/runtime.h>
@implementation UITableView (AttachProperties)
@dynamic sources;
@dynamic rowHeights;
@dynamic pageIndex;
@dynamic pageSize;
static   char *sources_associate_key = "sources";
static char *rowHeight_associate_key = "rowHeight";
static char *pageIndex_associate_key = "pageIndex";
static char *pageSize_associate_key = "pageSize";
-(void)setSources:(NSMutableArray *)sources{
    objc_setAssociatedObject(self, sources_associate_key, sources, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSMutableArray *)sources{
    NSMutableArray *sources = objc_getAssociatedObject(self, sources_associate_key);
    if (!sources) {
        sources=[NSMutableArray array];
    }
    return sources;
}
-(void)setRowHeights:(NSMutableArray *)rowHeights{
    objc_setAssociatedObject(self, rowHeight_associate_key, rowHeights, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSMutableArray *)rowHeights{
   NSMutableArray *rowHeights = objc_getAssociatedObject(self, rowHeight_associate_key);
    if (!rowHeights) {
        rowHeights=[NSMutableArray array];
    }
    return rowHeights;
}
-(void)setPageIndex:(NSInteger )pageIndex{
    objc_setAssociatedObject(self, pageIndex_associate_key, @(pageIndex), OBJC_ASSOCIATION_RETAIN);
}
-(NSInteger)pageIndex{
    NSNumber *number =objc_getAssociatedObject(self, pageIndex_associate_key);
    if (!number) {
        number =@(1);
    }
    return [number integerValue];
}
-(void)setPageSize:(NSInteger)pageSize{
    objc_setAssociatedObject(self, pageSize_associate_key, @(pageSize), OBJC_ASSOCIATION_RETAIN);
}
-(NSInteger)pageSize{
    NSNumber *number=objc_getAssociatedObject(self, pageSize_associate_key);
    if (!number) {
        number=@10;
    }
    return [number integerValue];
}
@end
