//
//  main.c
//  DdayCalculatorProject
//
//  Created by Sejin Peo on 2016. 5. 6..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#include <stdio.h>

int currentDay, currentMonth, currentYear; // 기준 날짜를 저장하는 변수

int futureDay , futureMonth , futureYear; // 다가오는 날짜를 저장하는 변수

int jan = 31, feb = 28, mar = 31, apr = 30, may = 31, jun = 30, jul = 31, aug = 31,
sep = 30, oct = 31, nov = 30, dec = 31; // 배열을 안배웠다는 전제하에 각 월마다 일수 일일이 입력

int all_day, sum_current, sum_future; // 총날짜, 기준날짜 일수, 다가오는 날짜 일수 변수

int leap(int year){ // 윤년인지 구하는 함수
    
    if(((year%4==0) && (year%100!=0)) || (year % 400 ==0)){
        feb = 29;
    }else{
        feb = 28;
        
    }
    return feb;
}

int all_day1(int year, int month, int day){ // d day 구하는 함수
    
    int all_day = 0, ye = 0, mo = 0 , a = 0, i;
    for(i=1; i<year; ++i){
        ye += 365;
        if(leap(i) ==29)
            ++ye;
    }
    switch(month){ // 노가다 ( 배열을 사용하지 않으므로)
            
        case 1 : mo = jan;
            break;
        case 2 : mo = jan+feb;
            break;
        case 3 : mo = jan+feb+mar;
            break;
        case 4 : mo = jan+feb+mar+apr;
            break;
        case 5 : mo = jan+feb+mar+apr+may;
            break;
        case 6 : mo = jan+feb+mar+apr+may+jun;
            break;
        case 7 : mo = jan+feb+mar+apr+may+jun+jul;
            break;
        case 8 : mo = jan+feb+mar+apr+may+jun+jul+aug;
            break;
        case 9 : mo = jan+feb+mar+apr+may+jun+jul+aug+sep;
            break;
        case 10 : mo = jan+feb+mar+apr+may+jun+jul+aug+sep+oct;
            break;
        case 11 : mo = jan+feb+mar+apr+may+jun+jul+aug+sep+oct+nov;
            break;
        case 12 : mo = jan+feb+mar+apr+may+jun+jul+aug+sep+oct+nov+dec;
            break;
        default: // 1~12 까지 입력했을때는 에러로 처리하여 아무것도 안나오도록 만듬
             mo = 0;
    }
    
    if(leap(year) == 29 && month > 2) // 윤년일 경우 일수에서 하루를 더해주는 변수 a
        a = 1;
    
    all_day = day + ye + mo + a;
    
    return all_day;
}

int getCurrentDay(int y, int m, int d){ // main 문에서 기준 날짜 함수 호출
    
    currentYear = y;
    currentMonth = m;
    currentDay = d;
    
    return sum_current = all_day1(currentYear, currentMonth, currentDay);
    
}

int getFutureDay(int y, int m, int d){ // main 문에서 다가오는 날짜 함수 호출
    
    futureYear = y;
    futureMonth = m;
    futureDay = d;
    
    return sum_future = all_day1(futureYear, futureMonth, futureDay);
}

void printOutDay(){ // 기준 날짜 에서 다가 오는 날짜 일수(d-day)를 출력해주는 함수
    
    all_day = (sum_future +1) - sum_current;
    
    printf("%d 년 %d 월 %d 일 까지 %d 일 남았습니다. \n",futureYear,futureMonth,futureDay,all_day);
    printf("프로그램을 종료하려면 y키를 누르시고 계속진행 하시려면 아무키나 누르세요 \n" );
}

//void checkDDay(int y, int m, int d){
//    
//    
//
//    
//    dayBefore = d;
//    monthBefore = m;
//    yearBefore = y;
//    
//    
//}

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    
    printf("d-Day(기념일) 계산기입니다. 반갑습니다. ^^ \n");
    printf("기준 날짜를 입력하세요 예(2016년 4월 22일은 2016,4,22 라고 입력) : \n"); // 입력부분
    getCurrentDay(2016,1,21);
    printf("기준 날짜는 %d 년 %d 월 %d 일 입니다.\n",currentYear, currentMonth, currentDay);
    printf("미래를 날짜를 입력하세요 현재 기준 날짜 보다 더 앞서게 \n");
    getFutureDay(2016,5,9);
    printf("미래 날짜는 %d 년 %d 월 %d 일 입니다.\n",futureYear, futureMonth, futureDay);
    printf("--------------------------------------------\n");
    printf("--------------------------------------------\n");
    printOutDay();
    
    
    return 0;
}