//
//  main.m
//  Example0519
//
//  Created by Sejin Peo on 2016. 5. 19..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>

const int maxValue = 30;
const int minValue = 10;

typedef NS_ENUM(NSInteger, StudentCount){
    StudentCountMax = 25,
    StudentCountMin = 10
};

typedef NS_ENUM(NSInteger, Fruits){
    FruitsApple = 100, // 0
    FruitsPear, // 1
    FruitPeach, // 2
    FruitBanana, // 3
    FruitOrange // 4
};

typedef NS_OPTIONS(NSInteger, FruitsOption){
    FruitsOptionApple = 1 << 0,     // 0000 0001
    FruitsOptionPear = 1 << 1,      // 0000 0010
    FruitsOptionPeach = 1 << 2,     // 0000 0100
    FruitsOptionBanana = 1 << 3,    // 0000 1000
    FruitsOptionOrange = 1 << 4     // 0001 0000
};

void selectFruitsOptions(FruitsOption options){
    if((options & FruitsOptionApple) != false){
        printf("사과 ");
    }
    if((options & FruitsOptionPear) != false){
        printf("배 ");
    }
    if((options & FruitsOptionPeach) != false){
        printf("복숭아 ");
    }
    if((options & FruitsOptionBanana) != false){
        printf("바나나 ");
    }
    if((options & FruitsOptionOrange) != false){
        printf("오렌지 ");
    }
    
    printf("가 선택되었습니다.\n");
}

void chooseFruit(Fruits selectedFruit){
    switch (selectedFruit) {
        case FruitsApple:
            printf("사과를 선택하였습니다. \n");
            break;
        case FruitsPear:
            printf("배를 선택하였습니다. \n");
            break;
        case FruitPeach:
            printf("복숭아를 선택하였습니다. \n");
            break;
        case FruitBanana:
            printf("바나나를 선택하였습니다. \n");
            break;
        case FruitOrange:
            printf("오렌지를 선택하였습니다. \n");
            break;
            
        default:
            printf("선택이 잘못되었습니다.\n");
            break;
    }
}

bool canOpenClass(int numberOfStudent){
    if(numberOfStudent > StudentCountMax){
        printf("학생이 너무 많아요. 열 수 없어요.\n");
        return false;
    }else if (numberOfStudent < StudentCountMin){
        printf("학생이 너무 적어요. 열 수 없어요 \n");
        return false;
    }
    printf("좋아요 개강합니다.\n");
    
    
    return true;
}


int main(int argc, const char * argv[]) {
   
    //const NSString *myName = @"yagom";
    /*
    canOpenClass(100); // false
    canOpenClass(30); // true
    canOpenClass(5); // false
    
    chooseFruit(FruitOrange);
    chooseFruit(FruitsApple);
    
    chooseFruit(200);
    chooseFruit(-1);
    
    chooseFruit(103);
    */
    selectFruitsOptions(FruitsOptionApple | FruitsOptionBanana | FruitsOptionPear);
    selectFruitsOptions(1 | 4 | 16);
    selectFruitsOptions(25);
    
    return 0;
}


