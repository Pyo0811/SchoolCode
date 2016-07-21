//
//  Casher.m
//  VendingMachineProject
//
//  Created by Sejin Peo on 2016. 5. 13..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "Casher.h"

@interface Casher()

@property(nonatomic) NSInteger inputMoney;

@end

@implementation Casher

- (instancetype)init
{
    self = [super init];
    if (self) {
        _inputMoney = 0;
    }
    return self;
}

/*
동전 추가
 */
-(void)addCoin500
{
    self.inputMoney += 50;
}

-(void)addDCoin100
{
    self.inputMoney += 10;
}
-(BOOL)buyDrink:(DrinkObject *)drink
{
    if(self.inputMoney >= drink.cost){
        self.inputMoney -= drink.cost;
        return YES;
    }else{
        return NO;
    }
    return NO;
}

-(NSDictionary *)changeMoney
{
    //잔돈 초기화
    NSMutableDictionary *changeDic = [[NSMutableDictionary alloc] initWithDictionary:@{@"50":@0,@"10":@0}];
    //500원짜리 계산
    if(self.inputMoney >= 50){
        //500원짜리 갯수
        NSInteger coin500 = self.inputMoney / 50;
        //리턴 딕에 추가
        [changeDic setValue:[NSNumber numberWithInteger:coin500] forKey:@"50"];
         //남은돈 갱신
         self.inputMoney %= 50;
    }
    //100원짜리
    if(self.inputMoney >= 10){
        //100원짜리 갯수
        NSInteger coin100 = self.inputMoney / 10;
        //리턴 딕에 추가
        [changeDic setValue:[NSNumber numberWithInteger:coin100] forKey:@"10"];
        //남은돈 갱신
        self.inputMoney %= 10;
    }
    self.inputMoney = 0;
    
    return changeDic;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
