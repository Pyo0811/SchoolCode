//
//  main.m
//  GooGooDanProject
//
//  Created by Sejin Peo on 2016. 5. 9..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>

void upgradeGooGooDan(NSArray *gooGooDan){
    
    for(NSNumber *gooGooNum in gooGooDan){
        for(int j=1; j<=9; j++){
            NSLog(@"%@ * %d = %ld",gooGooNum,j,(gooGooNum.integerValue * j));
        }
        NSLog(@"---------------------------");
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSArray *gooGooDan = (@[@3,@2,@7]);
        upgradeGooGooDan(gooGooDan);
    }
    return 0;
}
