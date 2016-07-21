//
//  Dealer.m
//  CardDeck
//
//  Created by Sejin Peo on 2016. 5. 13..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "Dealer.h"
#import "Card.h"

@implementation Dealer
{
    NSArray *type;    NSMutableArray *cardDeck;

    NSArray *number;
    NSArray *color;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        type = @[@"♠︎",@"♣︎",@"♥︎",@"♦︎"];
        number = @[@"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9",
                            @"10",@"J",@"Q",@"k"];
        color = @[@"Black",@"Red"];
    }
    return self;
}

-(void)createDeck{
    
     // cardDeck 생성 1번째 방을 초기화 시켜준다.
    cardDeck = [[NSMutableArray alloc]initWithCapacity:1];
    // 카드덱을 만들 카드 객체를 생성한다. 기본적으로 초기화시킴
    Card *card = [[Card alloc]init];
    NSString *cardType, *cardNumber, *cardColor;
    for(int i=0; i<type.count; i++){
        for(int j=0; j<number.count; j++){
            cardType = type[i];
            cardNumber = number[j];
            if([cardType isEqualToString:@"♠︎"] || [cardType isEqualToString:@"♣︎"]){
                cardColor = color[CardColorTypeBlack];
            }else{
                cardColor = color[CardColorTypeRed];
            }
            
            card = [[Card alloc] initWithCard:type[i] number:number[j] color:cardColor];
            [card printCard];
            [cardDeck addObject:card];
            
        }
    }
    //NSLog(@"%ld",cardDeck.count);
    
    //셔플(섞을꺼에요)
    cardDeck = [self suffleDeck:cardDeck];
    
}

-(void)shuffleDeck{
    for(int i=0; i<250; i++){
        NSInteger ranNum1 = arc4random() % 52;
        NSInteger ranNum2 = arc4random() % 52;
        [cardDeck exchangeObjectAtIndex:ranNum1 withObjectAtIndex:ranNum2];
    }
}

- (NSMutableArray *) suffleDeck:(NSMutableArray *)array{
    
    NSMutableArray *rtnArray = array;
    for(int i=0; i<1000; i++){
        NSInteger ranNum1 = arc4random() % 52;
        NSInteger ranNum2 = arc4random() % 52;
        [rtnArray exchangeObjectAtIndex:ranNum1 withObjectAtIndex:ranNum2];
    }
    return rtnArray;
}

-(void)printDeck{
    for(Card *c in cardDeck){
        [c printCard];
    }
}

@end
