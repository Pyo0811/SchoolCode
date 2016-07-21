//
//  DataCentre.m
//  TableEditing
//
//  Created by Sejin Peo on 2016. 6. 9..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "DataCentre.h"

@interface DataCentre()

@property (nonatomic, strong) NSMutableArray *firstSectionData;
@property (nonatomic, strong) NSMutableArray *secondSectionData;

@end

@implementation DataCentre

+ (instancetype)defaultData
{
    static DataCentre *dataCentre = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCentre = [[DataCentre alloc] init];
        dataCentre.firstSectionData = [[NSMutableArray alloc] initWithObjects:@"A",@"B",@"C", nil];
        dataCentre.secondSectionData = [[NSMutableArray alloc] initWithObjects:@"D",@"E",@"F", nil];
    });
    
    return dataCentre;
}


- (NSMutableArray *)dataForSection:(NSInteger)section{
    
    if(section == 0){
        
        return self.firstSectionData;
    }
    
    return self.secondSectionData;
}

- (void)insertNewItemInSecondSection{
    
    [self.secondSectionData addObject:@"New Data"];
}

- (void)removeFirstSectionItemAtIndex:(NSInteger)index{
    
    [self.firstSectionData removeObjectAtIndex:index];
}

@end
