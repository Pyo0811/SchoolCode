//
//  DataCentre.m
//  TableViewExample
//
//  Created by Sejin Peo on 2016. 6. 15..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "DataCentre.h"

@interface DataCentre()

@property (nonatomic,strong) NSArray *settingTableData;
@property (nonatomic,strong) NSArray *settingHeaderTitle;


@end

@implementation DataCentre

+ (instancetype)defaultData{
    
    static DataCentre *dataCentre = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
       
        dataCentre = [[DataCentre alloc] init];
        dataCentre.settingTableData = @[ @[@"School",@"Camp"], @[@"Korea weather",@"World weather"],@[@"하연수",@"Amanda Seyfried",@"Chloe Moretz",@"みなとざき さな shy shy shy",@"篠崎 愛"]];
        dataCentre.settingHeaderTitle = @[ @"FastCampus", @"Weather",@"name"];
        
    });
    
    return dataCentre;
}

- (NSInteger)numberOfSectionsForSettingTable{
    
    return self.settingHeaderTitle.count;
}

- (NSArray *)settingTableDataForSection:(NSInteger)section{
    
    return (NSArray *)self.settingTableData[section];
}

- (NSInteger)numberOfRowsForSectionInSettingTable:(NSInteger)section{
    
    return [self settingTableDataForSection:section].count;
}


- (NSString *)settingTableHeaderTitleForSection:(NSInteger)section{
    
    return (NSString *)self.settingHeaderTitle[section];
}

//- (NSArray *)dataForFastCampus:(FastCampusType)type{
//    
//    if(type == FastCampusTypeSchool){
//        return @[@"iOS",@"Android",@"Back-end",@"Front-end"];
//    }else{
//        return @[@"iOS 입문",@"iOS 초급",@"iOS 중급"];
//        
//    }
//}
//
//- (NSArray *)dataForWeather:(WeatherType)type{
//    
//    if(type == WeatherTypeKorea){
//        return @[@"서울",@"대전",@"대구",@"부산",@"제주"];
//    }else{
//        return @[@"뉴욕",@"서울",@"도쿄",@"멜버른",@"타이페이"];
//    }
//}

- (NSArray *)dataForSecondTableView:(DataType)type{
    
    
    switch (type) {
        case DataTypeSchool:
            return @[@"iOS",@"Android",@"Back-end",@"Front-end"];
            break;
        case DataTypeCamp :
            return @[@"iOS 입문",@"iOS 초급",@"iOS 중급"];
            break;
        case DataTypeKorea:
            return @[@"서울",@"대전",@"대구",@"부산",@"제주"];
            break;
        case DataTypeWorld:
            return @[@"뉴욕",@"서울",@"도쿄",@"멜버른",@"타이페이"];
            break;
    }
    
}

@end
