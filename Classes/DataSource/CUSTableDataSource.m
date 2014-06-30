//
//  CUSTableDataSource.m
//  TestTableViewDataSource
//
//  Created by wangjun on 14-6-27.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import "CUSTableDataSource.h"

@interface CUSTableDataSource()

@property (nonatomic, retain) NSArray *itemsArray;
@property (nonatomic, retain) NSString *identifierString;
@property (nonatomic, copy) TableViewCellConfigureBlock configureBlock;

@end

@implementation CUSTableDataSource

- (instancetype)initWithItems:(NSArray *)items
               cellIdentifier:(NSString *)identifier
               configureBlock:(TableViewCellConfigureBlock)configureBlock
{
    self = [super init];
    if (self)
    {
        self.itemsArray = items;
        self.identifierString = identifier;
        self.configureBlock = [configureBlock copy];
    }
    return self;
}

- (instancetype)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.itemsArray[(NSUInteger)indexPath.row];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.itemsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.identifierString
                                                            forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    self.configureBlock(cell,item);
    return cell;
}

@end
