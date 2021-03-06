//
//  DataCentre.h
//  TableEditing
//
//  Created by Sejin Peo on 2016. 6. 9..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataCentre : NSObject

+ (instancetype)defaultData;

- (NSMutableArray *)dataForSection:(NSInteger)section;

- (void)insertNewItemInSecondSection;

- (void)removeFirstSectionItemAtIndex:(NSInteger)index;

@end
