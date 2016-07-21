//
//  DataCentre.h
//  CustomTable
//
//  Created by Sejin Peo on 2016. 6. 8..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherTableViewController.h"

typedef NS_ENUM(NSInteger, SettingRow){
    SettingRowSound = 0,
    SettingRowVibrate
};

@interface DataCentre : NSObject

+ (instancetype)defaultData;
- (NSInteger)numberOfSectionForSettingTable;
- (NSArray *)settingTableDataForSection:(NSInteger)section;
- (NSInteger)numberOfRowsForSectionInSettingTable:(NSInteger)section;
- (NSString *)settingTableHeaderTitleForSection:(NSInteger)section;
- (void)setSetting:(SettingRow)function isOn:(BOOL)isOn;
- (BOOL)isOnForSetting:(SettingRow)function;
- (NSArray *)dataForWeather:(WeatherType)type;

@end
