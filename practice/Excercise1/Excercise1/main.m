//
//  main.m
//  Excercise1
//
//  Created by Sejin Peo on 2016. 5. 17..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Calculator.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Calculator *cal = [[Calculator alloc] init];
        
        //NSLog(@"문제를 해결해보자");
        
        [cal calDayAfter:2016 inputDay:402];
    }
    return 0;
}
