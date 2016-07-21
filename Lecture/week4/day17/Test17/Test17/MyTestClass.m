//
//  MyTestClass.m
//  Test17
//
//  Created by Sejin Peo on 2016. 5. 17..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "MyTestClass.h"

@implementation MyTestClass

// override 재정의
+(instancetype)alloc{
    NSLog(@"My Test Class alloc");
    
    [self testClassMethod];
   // [self testInstanceMethod]; // 호출 불가
    
    return [super alloc];
}

-(void)dealloc{
    NSLog(@"My Test Class dealloc");
    
    [self testInstanceMethod];
   // [self testClassMethod]; //호출 불가
    
    [[self class] testClassMethod];
    [MyTestClass testClassMethod];
    
    // 사용하고 있던 메모리 공간을 해제해줘야 할 때
    // 객체가 메모리에서 해제되는 시점을 파악하고자 할때
// [super dealloc];
}


-(void)testInstanceMethod{
    NSLog(@"testInstanceMethod called");
}

+(void)testClassMethod{
    NSLog(@"testClassMethod called");
}

@end
