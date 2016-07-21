//
//  Casher.h
//  VendingMachineProject
//
//  Created by Sejin Peo on 2016. 5. 13..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DrinkObject.h"

@interface Casher : NSObject

//동전 추가 메소드
-(void)addCoin500;
-(void)addDCoin100;
-(NSInteger)inputMoney;

//@property (nonatomic, readonly) NSInteger inputMoney;

//음료수 사는 메소드
-(BOOL)buyDrink:(DrinkObject *)drink;

//돈 거슬러줄(동전 List)
//{@"500":count, @"100":count}
-(NSDictionary *)changeMoney;

@end
