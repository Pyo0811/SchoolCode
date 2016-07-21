//
//  main.m
//  AverageScore
//
//  Created by Sejin Peo on 2016. 5. 10..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CalculatorScore.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        CalculatorScore *cal = [[CalculatorScore alloc] init];
        NSString *grade;
        
        grade = [cal calGrade:96];
        NSLog(@"당신의 등급은 :  %@ ",grade);
        [cal calPoint];
        [cal printPoint];
        
    }
    return 0;
}
