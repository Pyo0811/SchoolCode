//
//  MainTableViewCell.m
//  MyProject
//
//  Created by Sejin Peo on 2016. 7. 15..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "MainTableViewCell.h"

@interface MainTableViewCell()

@property (nonatomic, strong) UIImageView *yImageView;


@end

@implementation MainTableViewCell

- (void)setInfoDic:(NSDictionary *)infoDic {
    _infoDic = infoDic;
    [self setInfoWithInfoDic];
}

- (void)setInfoWithInfoDic {
    self.yImageView.image = self.infoDic[@"image"];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];

    self.yImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.frame.size.width, self.frame.size.height-80)];
    self.yImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:self.yImageView];
    
    
    self.yImageView.image = self.infoDic[@"image"];
    
}

@end
