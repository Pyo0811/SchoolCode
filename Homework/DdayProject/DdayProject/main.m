//
//  main.m
//  DdayProject
//
//  Created by Sejin Peo on 2016. 5. 9..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>

int eventDate;

bool isLeapYear(int year){
    bool lastDay;
    
    if(((year%4==0) && (year%100!=0)) || (year % 400 ==0)){
        lastDay = true;
    }else{
        lastDay = false;
    }
    
    return lastDay;
}

int lastDayOfMonth(int month, int year){
    
    int lastDay=0;
    
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
            if(isLeapYear(year)){
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
    
int totalDayWithDate(int date){
    //20160504 5번째~6번째 숫자만 추출

    int day = date%100;
    date = date/100;
    int month = date%100;
    int year = date/100;
    int lastDay;
    int totalDay=0;
                
                
    for(int i=1; i<month; i++){
        lastDay = lastDayOfMonth(month,year);
        totalDay += lastDay;
    }
    
    return totalDay+day;
}

void setEventDate(int date){
    eventDate = date;
}


void calculationDday(int today){
    //date yyyyMMdd
    int afterDate = 0;
    int beforeDate = 0;
    
    if(eventDate > today){
        afterDate = eventDate;
        beforeDate = today;
    }else if(eventDate < today){
        beforeDate = eventDate;
        afterDate = today;
    }

    
    int afterY =  afterDate / 10000;
    int beforY = beforeDate / 10000;

    
    int diffY = (afterY - beforY)*365;
    
    for(int i=beforY; i<afterY; i++){
        if(isLeapYear(i))
            diffY += 1;
    }

    
    int diffDay = ( diffY - totalDayWithDate(beforeDate) + totalDayWithDate(afterDate)-1);
    
    NSLog(@"남은 일수는 %d 일입니다. ",diffDay);
    
        // 1. 이벤트 날짜가 지났는지 체크
        // 2. 년도 차이 구하기
        // 3. Day구하기
        // 로직
        // int diffYDay = (yearDif - beforeDay + afterDay);
        
        // 4. D+, D- 선택
}

//afterDate
int bidNum = 0;
// beforDate
int smalNum = 0;
//두수를 받아서 어느수가 더큰지 구하는 함수

void compareNum(int num2, int num1){
    
    if(num1>num2){
        bidNum = num1;
        smalNum = num2;
    }else{
        smalNum = num1;
        bidNum = num2;
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        compareNum(35,40);
        NSLog(@" %d ",20160724%10000);
        setEventDate(20160521);
        calculationDday(20160510);
        
    }
    return 0;
}
