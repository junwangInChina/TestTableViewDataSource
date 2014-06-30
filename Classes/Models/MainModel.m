//
//  MainModel.m
//  TestTableViewDataSource
//
//  Created by wangjun on 14-6-30.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import "MainModel.h"

@implementation MainModel
@synthesize mainName = _mainName;
@synthesize mainDescribe = _mainDescribe;

- (void)dealloc
{
    RELEASE_SAFETY(_mainName);
    RELEASE_SAFETY(_mainDescribe);
    
    [super dealloc];
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.mainName = @"";
        self.mainDescribe = @"";
    }
    return self;
}

@end
