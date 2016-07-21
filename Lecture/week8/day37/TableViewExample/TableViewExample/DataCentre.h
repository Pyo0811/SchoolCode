//
//  DataCentre.h
//  TableViewExample
//
//  Created by Sejin Peo on 2016. 6. 15..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SecondTableViewController.h"

@interface DataCentre : NSObject

+ (instancetype)defaultData;
- (NSInteger)numberOfSectionsForSettingTable;
- (NSArray *)settingTableDataForSection:(NSInteger)section;
- (NSInteger)numberOfRowsForSectionInSettingTable:(NSInteger)section;
- (NSString *)settingTableHeaderTitleForSection:(NSInteger)section;
- (NSArray *)dataForSecondTableView:(DataType)type;


@end
