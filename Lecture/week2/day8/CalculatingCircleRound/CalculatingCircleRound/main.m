//
//  main.m
//  CalculatingCircleRound
//
//  Created by Sejin Peo on 2016. 5. 5..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>

const float PI = 3.14;


float getCircleRound(int radius){
    
    return radius * (2*PI);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"원의 둘레 : %0.2f",getCircleRound(5));
    }
    return 0;
}
