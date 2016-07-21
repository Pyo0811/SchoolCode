//
//  Calculator.m
//  Excercise1
//
//  Created by Sejin Peo on 2016. 5. 17..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

-(NSInteger)lastDayOfMonth:(NSInteger)inputYear inputMonth:(NSInteger)inputMonth{
    
    NSInteger month = inputMonth;
    NSInteger day;
    
    switch(month){
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            day = 31;
            break;
        case 2:
            if ((inputYear%4 == 0 && inputYear%100 != 0) || inputYear%400 == 0){
                day = 29;
                break;
            }else{
                day = 28;
                break;
            }
        case 4:
        case 6:
        case 9:
        case 11:
            day = 30;
            break;
        default:
            day = 0;
            break;
    }
    
    return day;
}

-(void)calDayAfter:(NSInteger)inputYear inputDay:(NSInteger)inputDay{
    
    NSInteger month = 1;
    NSInteger rsltDay = inputDay;
    NSInteger day = 31;
    
    //NSLog(@"문제를 해결해보자");
    
    while(day < rsltDay){
        
        rsltDay -= day;
        
        if(month>12){
            month = 1;
        }else{
            month++;
        }
        
        day = [self lastDayOfMonth:inputYear inputMonth:month];
        
    }
    
    //NSLog(@"while문 끝냈을때 문제를 해결해보자");
    
    NSLog(@"%ld년의 %ld일 번째날은 %ld월 %ld일 입니다.",inputYear,inputDay,month,rsltDay);
}
@end
