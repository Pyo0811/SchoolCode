//
//  DrinkObject.h
//  VendingMachineProject
//
//  Created by Sejin Peo on 2016. 5. 13..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DrinkObject : NSObject

@property (nonatomic, readonly, strong) NSString *name;
@property (nonatomic, readonly, assign) NSInteger cost;

-(instancetype)initWithName:(NSString *)name cost:(NSInteger)cost;

@end
