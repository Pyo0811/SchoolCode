//
//  Singleton.m
//  StopWatchWithGCD
//
//  Created by Sejin Peo on 2016. 6. 17..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

+ (instancetype)singleTonMethod{
    
    static Singleton *defaultValue;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultValue = [[Singleton alloc] init];
    });
    
    return defaultValue;
}

@end
