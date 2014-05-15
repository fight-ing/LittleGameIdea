//
//  PlayerCell.m
//  LittleGameIdea
//
//  Created by zp_liufei on 14-5-14.
//  Copyright (c) 2014年 zp_liufei. All rights reserved.
//

#import "PlayerCell.h"

@implementation PlayerCell
@synthesize pHeadImageView = _pHeadImageView,pNameLabel = _pNameLabel,pNumberLabel = _pNumberLabel;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self initSubviews];
    }
    return self;
}

-(void)initSubviews {
    _pHeadImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 70, 70)];
    [self.contentView addSubview:_pHeadImageView];
    
    _pNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(85, 5, 200, 30)];
    _pNameLabel.backgroundColor = [UIColor lightGrayColor];
    _pNameLabel.textColor = [UIColor blackColor];
    _pNameLabel.font = [UIFont systemFontOfSize:18];
    [self.contentView addSubview:_pNameLabel];
    
    _pNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(85, 40, 200, 30)];
    _pNumberLabel.backgroundColor = [UIColor lightGrayColor];
    _pNumberLabel.textColor = [UIColor blackColor];
    _pNumberLabel.font = [UIFont systemFontOfSize:18];
    [self.contentView addSubview:_pNumberLabel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
