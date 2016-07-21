//
//  Dealer.h
//  CardDeck
//
//  Created by Sejin Peo on 2016. 5. 13..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,CARD_COLOR)
{
    CardColorTypeBlack = 0,
    CardColorTypeRed = 1

};

@interface Dealer : NSObject

- (void)createDeck;
- (void)shuffleDeck;
- (void)printDeck;

@end
