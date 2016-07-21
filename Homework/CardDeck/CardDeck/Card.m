//
//  Card.m
//  CardDeck
//
//  Created by Sejin Peo on 2016. 5. 13..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "Card.h"

@implementation Card
{
    NSString *cardType;
    NSString *cardNumber;
    NSString *cardColor;
}

- (instancetype)initWithCard:(NSString *)type number:(NSString *)number color:(NSString *)color
{
    self = [super init];
    if (self) {
        cardType = type;
        cardNumber = number;
        cardColor = color;
    }
    return self;
}

-(void) printCard{
    NSLog(@"Card[%@, %@, %@]\n", cardType, cardNumber, cardColor);
}

@end
