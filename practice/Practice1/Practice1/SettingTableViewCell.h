//
//  SettingTableViewCell.h
//  Practice1
//
//  Created by Sejin Peo on 2016. 6. 12..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SettingTableViewCell;

@protocol SettingTableViewCellDelegate <NSObject>

-(void)settingTableViewCellSwitchValueChanged:(SettingTableViewCell *)cell isOn:(BOOL)isOn;

@end

@interface SettingTableViewCell : UITableViewCell

@property (nonatomic) UISwitch *settingSwitch;
@property (nonatomic, weak) id<SettingTableViewCellDelegate> delegate;

@end
