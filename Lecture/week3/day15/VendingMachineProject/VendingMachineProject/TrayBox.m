//
//  TrayBox.m
//  VendingMachineProject
//
//  Created by Sejin Peo on 2016. 5. 13..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "TrayBox.h"

@interface TrayBox()

@property(nonatomic,nullable) NSArray *nameList;
@property(nonatomic,nullable) NSArray *costList;
@property(nonatomic) NSArray *drinkKinds;

@end

@implementation TrayBox

-(instancetype)init{
    self = [super init];
    if(self){
        //self.nameList = @[@"コーラ(Coke)",@"サイダー(Sprite)",@"コーヒー(Coffee)",@"ジュース(Juice)"];
        //self.costList = @[@100,@90,@150,@130];
        self.nameList = @[@"ジュース(Juice)\n130円",@"コーヒー(Coffee)\n150円",@"サイダー(Sprite)\n90円",@"コーラ(Coke)\n100円"];
        self.costList = @[@130,@150,@90,@100];
        [self createTray];
    }
    return self;
}

-(void)createTray{
    NSMutableArray *drinkList = [[NSMutableArray alloc] init];
    for(int i=0; i<maximumDrinkCount; i++){
        NSString *drinkName = _nameList[i];
        NSInteger drinkCost = ((NSNumber *)_costList[i]).integerValue;
        DrinkObject *drink = [[DrinkObject alloc] initWithName:drinkName cost:drinkCost];
        [drinkList addObject:drink];
    }
    
    self.drinkKinds = [[NSArray alloc]initWithArray:drinkList];
}

@end
