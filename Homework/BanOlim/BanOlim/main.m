//
//  main.m
//  BanOlim
//
//  Created by Sejin Peo on 2016. 5. 11..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Calculator.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Calculator *cal = [[Calculator alloc] init];
        
        CGFloat num = 3.1235;
        NSLog(@"before Round :  %0.5f ",num);
        
        num = [cal roundNum:num digit:4];
        NSLog(@"after Round : %0.5f",num);
        
        //NSInteger afterDay = 102;
        [cal calculateDate:2016 day:60];
        [cal calculateDate:2016 day:102];
        
        NSInteger num1=2016;
        NSLog(@"숫자 반대값 출력 전 : %ld ",num1);
        NSLog(@"숫자 반대값 출력 후 : %ld ",[cal reverseNum:num1]);
    }
    return 0;
}
