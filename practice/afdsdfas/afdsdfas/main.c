//
//  main.c
//  afdsdfas
//
//  Created by Sejin Peo on 2016. 5. 18..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#include <stdio.h>

int lastDayOfMonth(int month){
    
    int day;
    // 1, 3, 5, 7, 8, 10, 12월은 31일까지, 4, 6, 9, 11월은 30일까지, 2월은 28
    switch (month) {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            day = 31;
            break;
        case 4:
        case 6:
        case 9:
        case 11:
            day = 30;
            break;
        case 2:
            day = 28;
            break;
        default:
            day = 0;
            break;
    }
    
    return day;
    
}

void calDate(int month, int day){
    
    int totDay=0;
    int tempDay = 0;
    
    if(month>1){
        
    
    for(int i=1; i<month; i++){
        tempDay = lastDayOfMonth(i);
        totDay += tempDay;
    }
        
    }
    
    totDay += day;
    // SUN, MON, TUE, WED, THU, FRI, SAT
    if(totDay>=7){
        switch(totDay%7){
            case 0:
                printf("SUN\n");
                break;
            case 1:
                printf("MON\n");
                break;
            case 2:
                printf("TUE\n");
                break;
            case 3:
                printf("WED\n");
                break;
            case 4:
                printf("THU\n");
                break;
            case 5:
                printf("FRI\n");
                break;
            case 6:
                printf("SAT\n");
                break;
        }
    }else{
        switch (totDay) {
            case 1:
                printf("MON\n");
                break;
            case 2:
                printf("TUE\n");
                break;
            case 3:
                printf("WED\n");
                break;
            case 4:
                printf("THU\n");
                break;
            case 5:
                printf("FRI\n");
                break;
            case 6:
                printf("SAT\n");
                break;
        }
    }
}

int main(int argc, const char * argv[]) {
    // insert code here...
    
    int day;
    int month;
    
    scanf("%d %d",&month,&day);
    calDate(month, day);
}
