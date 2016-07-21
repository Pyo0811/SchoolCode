//
//  main.m
//  ScholarDvisionProject
//
//  Created by Sejin Peo on 2016. 5. 5..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>

void scholarDivision(int score){
    
    switch(score){
        case 1:
            NSLog(@"전액 장학금");
            break;
        case 2:
            NSLog(@"50 %%  ");
            break;
        case 3:
            NSLog(@"25 %% ");
            break;
        default:
            NSLog(@"없음");
            break;
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        scholarDivision(2);
    }
    return 0;
}
