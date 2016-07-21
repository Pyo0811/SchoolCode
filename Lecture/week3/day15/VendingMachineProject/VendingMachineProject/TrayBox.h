//
//  TrayBox.h
//  VendingMachineProject
//
//  Created by Sejin Peo on 2016. 5. 13..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DrinkObject.h"

static const NSInteger maximumDrinkCount = 4;

@interface TrayBox : NSObject

@property(nonatomic,readonly,strong) NSArray *drinkKinds;

@end
