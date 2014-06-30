//
//  MainCell.m
//  TestTableViewDataSource
//
//  Created by wangjun on 14-6-30.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import "MainCell.h"
#import "MainModel.h"

@interface MainCell()

@property (nonatomic, retain) UILabel *mainTextLabel;
@property (nonatomic, retain) UILabel *mainDescribeLabel;

@end

@implementation MainCell
@synthesize mainTextLabel = _mainTextLabel;
@synthesize mainDescribeLabel = _mainDescribeLabel;

- (void)dealloc
{
    RELEASE_SAFETY(_mainTextLabel);
    RELEASE_SAFETY(_mainDescribeLabel);
    
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.mainTextLabel = [self createLabelWithFrame:CGRectMake(0, 0, 200, 20)];
        _mainTextLabel.font = HELVETICANEUE_FONT(14);
        _mainTextLabel.textColor = TEXT_LABEL_COLOR;
        
        self.mainDescribeLabel = [self createLabelWithFrame:CGRectMake(0, 0, 200, 20)];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.mainTextLabel.bottom = self.mainDescribeLabel.top = self.height / 2.0;
    self.mainTextLabel.left = self.mainDescribeLabel.left = 10;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (UILabel *)createLabelWithFrame:(CGRect)frame
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentLeft;
    label.font = HELVETICANEUE_FONT(12);
    label.textColor = DETAILTEXT_LABEL_COLOR;
    [self addSubview:label];
    
    return [label autorelease];
}

- (void)setModel:(MainModel *)model
{
    self.mainTextLabel.text = model.mainName;
    self.mainDescribeLabel.text = model.mainDescribe;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
