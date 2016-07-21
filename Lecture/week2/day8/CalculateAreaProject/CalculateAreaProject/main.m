//
//  main.m
//  CalculateAreaProject
//
//  Created by Sejin Peo on 2016. 5. 5..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>

int width = 0;
int height = 0;
const float pyeong = 3.3058;

void setWidth(int a){
    width = a;
}

void setHeight(int b){
    height = b;
}

float getPyeong(){
    
    return width*height/(pyeong*pyeong);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        setWidth(32);
        setHeight(20);
        NSLog(@"우리집은 %0.1f 평 입니다.",getPyeong());
    }
    return 0;
}
