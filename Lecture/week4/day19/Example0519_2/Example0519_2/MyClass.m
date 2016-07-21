//
//  MyClass.m
//  Example0519_2
//
//  Created by Sejin Peo on 2016. 5. 19..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass

-(NSInteger)age{
    NSLog(@"누군가 내 나이를 알아간다");
    return _age;
}

-(void)setAge:(NSInteger)age{
    _age = age;
}

-(NSString *)name{ // getName 재정의 할 수 도 있다.
    NSLog(@"내 이름을 알아가지마라");
    return [NSString stringWithFormat:@"내 이름은 %@입니다.",_name];
}
//
//-(void)setName:(NSString *)name{
//    _name = name;
//}

@end
