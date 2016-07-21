//
//  main.m
//  RoundingFunction
//
//  Created by Sejin Peo on 2016. 5. 5..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>


void Rounding(float a){
    NSLog(@"3자리수에서 자른 결과 : %0.2f ",a);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Rounding(3.126);
    }
    return 0;
}
