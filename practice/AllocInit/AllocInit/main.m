//
//  main.m
//  AllocInit
//
//  Created by Sejin Peo on 2016. 5. 11..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p1 = [[Person alloc] init];
        p1.age = 10;
        NSLog(@"age : %ld",p1.age);
        
        printf("-------------------------------------------------------\n");
        
        // alloc : 메모리 할당 메서드
        // init : 초기화 메서드
        
        // [java]       Object : 최상위 클래스
        // [Objective-c]  id    : 객체 일반형 데이터 타입
        
        id obj = [Person alloc];
        Person *p2 = (Person *)[obj init];
        
        p2.age = 20;
        NSLog(@"age : %ld",p2.age);
        
        printf("-------------------------------------------------------\n");
        
        Person *p3 = [[Person alloc] init];     // 생성자에서 값 초기화
        NSLog(@"age : %ld ", p3.age);
        
        Person *p4 = [[Person alloc] initWithAge:200]; // 인자가 있는 생성자
        NSLog(@"age : %ld ",p4.age);
        
        printf("-------------------------------------------------------\n");
        
    }
    return 0;
}
