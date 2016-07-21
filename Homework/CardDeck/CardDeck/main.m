//
//  main.m
//  CardDeck
//
//  Created by Sejin Peo on 2016. 5. 13..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dealer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Dealer *dealer = [[Dealer alloc]init];
        
        [dealer createDeck];
        [dealer printDeck];
        //[dealer shuffleDeck];
        //[dealer printDeck];
    
    }
    return 0;
}
