//
//  CUSTableDataSource.h
//  TestTableViewDataSource
//
//  Created by wangjun on 14-6-27.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^TableViewCellConfigureBlock)(id cell, id item);

@interface CUSTableDataSource : NSObject <UITableViewDataSource>

/**
 *  初始化方法
 *
 *  @param  items           :cell 中用于展示的数据源
 *  @param  identifier      :cell 的标识，用于重用机制
 *  @param  configureBlock  :block，用于处理回调
 *  @return 当前实例
 *
 */
- (instancetype)initWithItems:(NSArray *)items
               cellIdentifier:(NSString *)identifier
               configureBlock:(TableViewCellConfigureBlock)configureBlock;

/**
 *  获取当前行对应的 item
 *
 *  @param  indexPath       :表格行信息
 *  @return 对应的 item
 *
 */
- (instancetype)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
