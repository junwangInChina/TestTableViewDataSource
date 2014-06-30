//
//  MainView.m
//  TestTableViewDataSource
//
//  Created by wangjun on 14-6-27.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import "MainView.h"
#import "MainCell.h"
#import "MainModel.h"
#import "CUSTableDataSource.h"

static NSString * const mainIdentifier = @"MainCellIdentifier";

@interface MainView()<UITableViewDelegate>

@property (nonatomic, retain) UITableView *exampleTableView;
@property (nonatomic, retain) CUSTableDataSource *cusDatasource;

@end

@implementation MainView
@synthesize exampleTableView = _exampleTableView;
@synthesize cusDatasource = _cusDatasource;

- (void)dealloc
{
    RELEASE_SAFETY(_exampleTableView);
    RELEASE_SAFETY(_cusDatasource);
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.exampleTableView = [self createTableViewWithFrame:frame];
        _exampleTableView.top = 0;
    }
    return self;
}

- (UITableView *)createTableViewWithFrame:(CGRect)frame
{
    UITableView *tableView_ = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
    tableView_.delegate = self;
    [self addSubview:tableView_];
    
    return [tableView_ autorelease];
}

- (void)refreshTableView:(NSArray *)array
{
    self.cusDatasource = [[CUSTableDataSource alloc] initWithItems:array
                                                    cellIdentifier:mainIdentifier
                                                    configureBlock:^(MainCell *cell, MainModel *model)
    {
        [cell setModel:model];
    }];
    self.exampleTableView.dataSource = self.cusDatasource;
    [self.exampleTableView registerClass:[MainCell class] forCellReuseIdentifier:mainIdentifier];
}

#pragma mark - UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"%@",[(MainModel *)[self.cusDatasource itemAtIndexPath:indexPath] mainName]);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
