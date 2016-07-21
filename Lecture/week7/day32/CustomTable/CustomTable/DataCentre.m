//
//  DataCentre.m
//  CustomTable
//
//  Created by Sejin Peo on 2016. 6. 8..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "DataCentre.h"

static NSString *const keySoundSetting = @"UserSoundIsOn";
static NSString *const keyVibrateSetting = @"UserVibrateIsOn";

@interface DataCentre()

@property (nonatomic, strong) NSArray *settingTableData;
@property (nonatomic, strong) NSArray *weatherData;
@property (nonatomic, strong) NSArray *settingHeaderTitle;


@end


@implementation DataCentre

+ (instancetype)defaultData
{
    static DataCentre *dataCentre = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCentre = [[DataCentre alloc] init];
        dataCentre.settingTableData = @[ @[@"사운드",@"진동"], @[@"세계날씨",@"한국날씨"]];
        dataCentre.settingHeaderTitle = @[@"설정",@"날씨"];
    });
    
    return dataCentre;
}

- (NSInteger)numberOfSectionForSettingTable{
    return [self.settingHeaderTitle count];
}


- (NSArray *)settingTableDataForSection:(NSInteger)section{
    
    return (NSArray *)self.settingTableData[section];
}

- (NSInteger)numberOfRowsForSectionInSettingTable:(NSInteger)section{
    return [[self settingTableDataForSection:section] count ];
}

- (NSString *)settingTableHeaderTitleForSection:(NSInteger)section{
    return (NSString *)self.settingHeaderTitle[section];
}

- (void)setSetting:(SettingRow)function isOn:(BOOL)isOn{
    // 키에 해당되는 불값을 저장
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    NSString *key = nil;
    
    if(function == SettingRowSound){
        key = keySoundSetting;
    }else{
        key = keyVibrateSetting;
    }
    
    [userDefault setBool:isOn forKey:key];
    [userDefault synchronize];
    // 값을 저장한뒤 반드시 동기화
}

- (BOOL)isOnForSetting:(SettingRow)function{
    // 키에 해당되는 불값을 돌려줌
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    NSString *key = nil;
    
    if(function == SettingRowSound){
        key = keySoundSetting;
    }else{
        key = keyVibrateSetting;
    }
    
    return [userDefault boolForKey:key];
}

- (NSArray *)dataForWeather:(WeatherType)type{
    if(type == WeatherTypeKorea){
        return @[@"서울",@"대전",@"대구",@"부산"];
    }else{
        return @[@"서울",@"도쿄",@"뉴욕",@"베를린",@"싱가폴",@"알마티"];
    }
}

@end
