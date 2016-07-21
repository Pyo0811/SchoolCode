//
//  DataCentre.m
//  SingletonTest
//
//  Created by Jihoon Pyo on 2016. 6. 2..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "DataCentre.h"

@implementation DataCentre

+ (instancetype)sharedInstance{
    
    static DataCentre *dataCentre = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCentre = [[self alloc] init];
    });
    return dataCentre;
}

- (void)printData
{
    NSLog(@"name is %@, age is %ld",self.name,(long)self.age);
}

@end
