//
//  DataCentre.m
//  TabbarControllerExample
//
//  Created by Sejin Peo on 2016. 6. 14..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "DataCentre.h"

@interface DataCentre()



@end

@implementation DataCentre

+ (instancetype)defaultData{
    
    static DataCentre *dataCentre = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        dataCentre = [[DataCentre alloc]init];
    });
    
    return dataCentre;
}

@end
