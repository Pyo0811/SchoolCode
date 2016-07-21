//
//  DrinkObject.m
//  VendingMachineProject
//
//  Created by Sejin Peo on 2016. 5. 13..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "DrinkObject.h"

@implementation DrinkObject


-(instancetype)initWithName:(NSString *)name cost:(NSInteger)cost{
    self = [super init];
    if (self) {
        _name = name;
        _cost = cost;
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
