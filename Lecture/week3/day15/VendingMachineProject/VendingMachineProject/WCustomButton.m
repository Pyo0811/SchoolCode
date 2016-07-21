//
//  WCustomButton.m
//  VendingMachineProject
//
//  Created by Sejin Peo on 2016. 5. 13..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "WCustomButton.h"

@interface WCustomButton()

@property (nonatomic, weak) UIImageView *drinkImg;
@property (nonatomic, weak) UILabel *titleLB;
@property (nonatomic, weak) UIButton *actionBtn;

@end

@implementation WCustomButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createView];
    }
    return self;
}

-(void)createView
{
    UIImageView *drinkImg = [[UIImageView alloc] init];
    [self addSubview:drinkImg];
    self.drinkImg = drinkImg;
    
    UILabel *titleLB = [[UILabel alloc] init];
    titleLB.textAlignment = NSTextAlignmentCenter;
    titleLB.textColor = [UIColor blackColor];
    titleLB.font = [UIFont systemFontOfSize:15];
    [self addSubview:titleLB];
    self.titleLB = titleLB;
    
    UIButton *actionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [actionBtn addTarget:self action:@selector(onTouchUpInsideActionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:actionBtn];
    self.actionBtn = actionBtn;
    
}

-(void)updateLayout
{
    [self.drinkImg setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-22)];
    [self.titleLB setFrame:CGRectMake(0, self.frame.size.height-22, self.frame.size.width, 22)];
    [self.actionBtn setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}

-(void)setTitle:(NSString *)title
{
    [self.titleLB setText:title];
}

-(void)setImageWithName:(NSString *)imageName
{
    [self.drinkImg setImage:[UIImage imageNamed:imageName]];
}

-(void)onTouchUpInsideActionBtn:(UIButton *)sender
{
    if([self.delegate respondsToSelector:@selector(didSelectWCustomButton:)]){
        [self.delegate didSelectWCustomButton:self];
    }
}

@end
