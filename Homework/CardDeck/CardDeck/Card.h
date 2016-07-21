//
//  Card.h
//  CardDeck
//
//  Created by Sejin Peo on 2016. 5. 13..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject


- (instancetype)initWithCard:(NSString *)type number:(NSString *)number color:(NSString *)color;

-(void) printCard;
@end
