//
//  SettingTableViewCell.h
//  CustomTable
//
//  Created by Sejin Peo on 2016. 6. 8..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SettingTableViewCell;

@protocol SettingTableViewCellDelegate <NSObject>
// 스위치의 값이 변경될 때 메소드
- (void)settingTableViewCellSwitchValueChanged:(SettingTableViewCell *)cell isOn:(BOOL)isOn;

@end

@interface SettingTableViewCell : UITableViewCell

//@property (nonatomic) UILabel *titleLabel;
//@property (nonatomic) UILabel *textLabel;
@property (nonatomic) UISwitch *settingSwitch;
@property (nonatomic,weak) id<SettingTableViewCellDelegate> delegate;




@end
