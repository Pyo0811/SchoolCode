//
//  SettingTableViewCell.m
//  CustomTable
//
//  Created by Sejin Peo on 2016. 6. 8..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "SettingTableViewCell.h"


@implementation SettingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)switchValueChanged:(UISwitch *)sender {
    NSLog(@"Switch %d",sender.isOn);
    [self.delegate settingTableViewCellSwitchValueChanged:self isOn:sender.isOn];
}

//- (void)drawRect:(CGRect)rect{
//    [super drawRect:rect];
//    // 화면에 단지 표시되기위해서
//    
//    if (self.settingSwitch == nil){
//        
//    }
//    
//}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.settingSwitch = [[UISwitch alloc] init];
    self.accessoryView = self.settingSwitch;
    [self.settingSwitch addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
