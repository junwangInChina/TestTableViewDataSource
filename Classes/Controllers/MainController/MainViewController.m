//
//  MainViewController.m
//  TestTableViewDataSource
//
//  Created by wangjun on 14-6-27.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"
#import "MainModel.h"

@interface MainViewController ()

@property (nonatomic, retain) MainView *mainView;

@end

@implementation MainViewController
@synthesize mainView = _mainView;

- (void)dealloc
{
    RELEASE_SAFETY(_mainView);
    
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    self.mainView = [[[MainView alloc] initWithFrame:MAIN_NAV_BOUNDS] autorelease];
    [self.view addSubview:_mainView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray *array = [NSMutableArray array];
    
    MainModel *model1 = [[[MainModel alloc] init] autorelease];
    model1.mainName = @"Test1";
    model1.mainDescribe = @"Describe1";
    [array addObject:model1];
    
    MainModel *model2 = [[[MainModel alloc] init] autorelease];
    model2.mainName = @"Test2";
    model2.mainDescribe = @"Describe2";
    [array addObject:model2];
    
    MainModel *model3 = [[[MainModel alloc] init] autorelease];
    model3.mainName = @"Test3";
    model3.mainDescribe = @"Describe3";
    [array addObject:model3];
    
    [self.mainView refreshTableView:array];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
