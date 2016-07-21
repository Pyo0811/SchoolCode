//
//  main.m
//  ToolBox
//
//  Created by Sejin Peo on 2016. 5. 10..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CalculatorToolBox.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        CalculatorToolBox *calBox = [[CalculatorToolBox alloc] init];
        
        NSInteger num1,num2;
        // 소수점 세자리 반올림 1234.8790 -> 1234.880
        num1=74,num2=24;
         NSLog(@"두 수의 덧셈 : %ld + %ld = %0.4f",num1,num2,[calBox numAdd:num1 num2:num2]);
        num1=47,num2=85;
        NSLog(@"두 수의 뺄셈 : %ld - %ld = %0.4f",num1,num2,[calBox numSub:num1 num2:num2]);
        num1=24,num2=82;
        NSLog(@"두 수의 곱셈 : %ld * %ld = %0.4f",num1,num2,[calBox numMulti:num1 num2:num2]);
        num1=47,num2=3;
        NSLog(@"두 수의 나눗셈 : %ld / %ld = %0.4f",num1,num2,[calBox numDiv:num1 num2:num2]);
        
        //
        [calBox inchToCm:8];
        [calBox cmToInch:4.4];
        [calBox m2ToPyeong:4.5];
        [calBox pyeongToM2:12];
        [calBox fahToCel:75];
        [calBox celToFah:21];
        [calBox kbToMbGb:1029384];
        [calBox mbToKbGb:2451];
        [calBox gbToMbKb:3];
        
//        -(void)numAdd:(NSInteger)num1 num2:(NSInteger)num2;
//        -(void)numSub:(NSInteger)num1 num2:(NSInteger)num2;
//        -(void)numMulti:(NSInteger)num1 num2:(NSInteger)num2;
//        -(void)numDiv:(NSInteger)num1 num2:(NSInteger)num2;
//        -(void)inchToCm:(NSInteger)num1;
//        -(void)cmToInch:(NSInteger)num1;
//        -(void)m2ToPyeong:(NSInteger)num1;
//        -(void)pyeongToM2:(NSInteger)num1;
//        -(void)fahToCel:(NSInteger)num1;
//        -(void)celToFah:(NSInteger)num1;
//        -(void)kbToMbGb:(NSInteger)num1;
//        -(void)mbToKbGb:(NSInteger)num1;
//        -(void)gbToMbKb:(NSInteger)num1;
        
        
    }
    return 0;
}
