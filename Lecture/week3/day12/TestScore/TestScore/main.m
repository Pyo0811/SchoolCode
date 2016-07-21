//
//  main.m
//  TestScore
//
//  Created by Sejin Peo on 2016. 5. 10..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CalculationScore.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //Calu~ Class 객체
        
        CalculationScore *csClas = [[CalculationScore alloc] init];
        
        // 객체 메소를 실행
        [csClas addSubjectScore:100];
        [csClas addSubjectScore:85];
        [csClas addSubjectScore:75];
        
        CGFloat average = [csClas averageScore];
        NSLog(@"average = %f",average);
    }
    return 0;
}
