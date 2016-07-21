//
//  main.m
//  CommandToolTest
//
//  Created by Sejin Peo on 2016. 5. 4..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
int age = 26;
int height = 179;
const int PI = 3.14;
*/


//int age = 30;
//bool isLogin = true;
//int cokePrice, coffeePrice, juicePrice;
//int beverCont;
//const int beverMaxCont = 500;
//int change;
//NSString *selectedBeverName;
//int korScore, mathScore, engScore;
//int totScore;
//int avgScore;
//NSString *userName;
//NSString *currentMusicID;
//NSString *playedSongs;
//// 복수형은 보통 배열형에 쓰임
//int likeCont;
//NSString *areaCmt;
//NSString *menuBtn;
//NSString *setBtn;
// 결과 출력창 resultScreen; 메인화면 mainScreen 사용자 아이디 userId 사용자 정보 userInfo


int korScore = 0;
int matScore = 0;
int sciScore = 0;
int engScore = 0;

void setKorScore(int newScore)
{
    korScore = newScore;
}

void setMatScore(int newScore)
{
    matScore = newScore;
}

void setSciScore(int newScore)
{
    sciScore = newScore;
}

void setEngScore(int newScore)
{
    engScore = newScore;
}

int totScore(){
    return korScore+matScore+sciScore+engScore;
}

float avgScore(){
    return (float)totScore()/4;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//
//        NSLog(@"jjj");
//        
//        age = 26;
//        isLogin = false;
//        cokePrice= 1000;
//        coffeePrice = 600;
//        juicePrice = 700;
//        beverCont = 20;
//        change = 750;
//        selectedBeverName = @"코카콜라";
//        korScore = 95;
//        mathScore = 100;
//        engScore = 85;
//        totScore = korScore + mathScore + engScore;
//        avgScore = totScore/3;
//        userName = @"표세진";
//        
//        NSLog(@"저의 나이는 %d 입니다.",age);
//        NSLog(@"당신이 선택한 음료수는 %@ 입니다.",selectedBeverName);

        
        setKorScore(61);
        setMatScore(92);
        setSciScore(83);
        setEngScore(97);
        
        
        NSLog(@"당신의 총점은 %d 이고, 평균은 %0.2f 입니다. ",totScore(),avgScore());
        
    }
    return 0;
}

int a;
int b = 3;
