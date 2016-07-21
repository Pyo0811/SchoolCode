//
//  Calculator.m
//  BanOlim
//
//  Created by Sejin Peo on 2016. 5. 11..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

-(CGFloat)roundNum:(CGFloat)num digit:(NSInteger)digit{
    
    
    CGFloat decimal = 5.0;
    CGFloat numDivide=1;
    NSInteger numMultiple=1;
    NSInteger tempNum;
    

    for(int i=1; i<=digit; i++){
        
        decimal *= 0.1;
    }
    
    for(int i=1; i<=digit-1; i++){
        
        numDivide *= 0.1;
        numMultiple *= 10;
    }
    
        
    num += decimal;
    num *= numMultiple;
    
    tempNum = num;
    
    num = (CGFloat)tempNum;
    num *= numDivide;
    
    return num;
}

/*-(NSInteger)calculateMonthOfDay:(NSInteger)year afterDay:(NSInteger)afterDay{
   
    NSInteger month;
    
    NSInteger lastDay=0;
    
   
    
    switch(month){
        case 1 :
        case 3 :
        case 5 :
        case 7 :
        case 8 :
        case 10 :
        case 12 :
            lastDay = 31;
            break;
        case 2 :
            
            if(((year%4==0) && (year%100!=0)) || (year % 400 ==0)){
                lastDay = 29;
            }else{
                lastDay = 28;
            }
            break;
        case 4:
        case 6:
        case 9:
        case 11:
            lastDay = 30;
            break;
    }
    return lastDay;
}
*/

-(void)calculateDate:(NSInteger)inputYear day:(NSInteger)afterDay{
    
    //NSInteger totalDay = 0;
    NSInteger cnt = 0;
    //NSInteger lastMonthOfDay;
    NSInteger calDay = afterDay;
    BOOL isLeap;
    NSInteger day = 0;
    NSInteger month = 0;
    
    /*
     while(totalDay < afterDay){
     
     // lastMonthOfDay = [self calculateMonthOfDay:afterDay] 이런식으로 만들기
     totalDay += lastMonthOfDay;
     cnt++;
     }
     
     */
    
    NSArray *monthArray = @[@31,@28,@31,@30,@31,@30,@31,@31,@30,@31,@30,@31];
    
    
    if(((inputYear%4==0) && (inputYear%100!=0)) || (inputYear % 400 ==0)){
        isLeap = YES;
    }else{
        isLeap = NO;
    }
    
    
    for(NSNumber *monthIndex in monthArray){
        if(cnt==0){
            //1월 일때만
            if(calDay-monthIndex.integerValue<=0){
                cnt++;
                day = afterDay;
                break;
            }
            calDay -= monthIndex.integerValue;
            cnt++;
        }else if(cnt==1 && isLeap){
            
            if(calDay-(monthIndex.integerValue+1)<=0){
                cnt++;
                day = calDay;
                break;
            }
            calDay -= (monthIndex.integerValue+1);
            cnt++;
            
        }else{
            
            //2월 부터
            if(calDay-monthIndex.integerValue<=0){
                cnt++;
                day = calDay;
                break;
            }
            
            calDay -= monthIndex.integerValue;
            cnt++;
        }
        
    }
    
    //day = totalDay - afterDay;
    month = cnt;
    
    //NSLog(@"%ld 년의 %ld 일 번째 날은 %ld월 %ld일 입니다. ",inputYear,afterDay,month,day);
    NSLog(@"%ld年の %ld日目は %ld月 %ld日です。 ",inputYear,afterDay,month,day);
}

-(NSInteger)reverseNum:(NSInteger)inputNum{
    
    NSInteger temp = 0;
    NSInteger result=0 ;
    while(YES){
        
        temp = inputNum%10;
        result = (result + temp)*10;
        inputNum /= 10;
        
        if(inputNum==0){
            result /= 10;
            break;
        }
    }
    
    return result;
}

@end
