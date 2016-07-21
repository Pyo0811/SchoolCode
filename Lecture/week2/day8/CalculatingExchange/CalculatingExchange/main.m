//
//  main.m
//  CalculatingExchange
//
//  Created by Sejin Peo on 2016. 5. 5..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>


float krw = 0.0;
float usd = 0.0;
const float currentKrw=1155.50;

void setKrw(float a){
    krw = a;
}

void setUsd(float b){
    usd = b;
}

float changeKrwToUsd(){
    return krw/currentKrw;
}

float changeUsdToKrw(){
    return currentKrw*usd;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        setUsd(32000);
        NSLog(@"환전 결과 : %0.2f 달러 -> %0.2f 원",usd,changeUsdToKrw());
        setKrw(4500);
        NSLog(@"환전 결과 : %0.2f 원 -> %0.2f 달러",krw,changeKrwToUsd());
    }
    return 0;
}
