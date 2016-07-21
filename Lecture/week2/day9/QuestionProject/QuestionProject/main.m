//
//  main.m
//  QuestionProject
//
//  Created by Sejin Peo on 2016. 5. 5..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>

int absoluteNum(int a){
    if(a<0){
        return -a;
    }else{
        return a;
    }
}

void checkAlphabet(char b){
    
    if(b>=65 && b<=90){
        NSLog(@"%c는 대문자입니다.",b);
    }else if(b>=97 && b<=122){
        NSLog(@"%c는 소문자입니다.",b);
    }else if(b>=48 && b<=57){
        NSLog(@"%c는 숫자입니다.",b);
    }else{
        NSLog(@"%c는 특수문자인가 봅니다.",b);
    }
}

void checkLeapYear(int c){
    
    if(c%400==0){
        NSLog(@"%d년은 윤년입니다.",c);
    }else if(c%100==0){
        NSLog(@"%d년은 윤년이 아닙니다.",c);
    }else if(c%4==0){
        NSLog(@"%d년은 윤년입니다.",c);
    }else{
        NSLog(@"%d년은 윤년이 아닙니다.",c);
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSLog(@"절대값 테스트 입니다. : %d ",absoluteNum(-124));
        NSLog(@"절대값 테스트 입니다. : %d ",absoluteNum(124));

        checkAlphabet('c');
        checkAlphabet('B');
        checkAlphabet('4');
        
        checkLeapYear(1995);
        checkLeapYear(2000);
        checkLeapYear(6000);
        checkLeapYear(4700);
        checkLeapYear(2004);
    }
    return 0;
}
