//
//  MyClass.h
//  Example0519_2
//
//  Created by Sejin Peo on 2016. 5. 19..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyClass : NSObject{
    NSInteger _age;
}

-(NSInteger)age;
-(void)setAge:(NSInteger)age;

//-(NSString *)name;
//-(void)setName:(NSString *)name;

@property(strong,nonatomic) NSString *name;
// nonatomic 쓰레드 잠금을 해제한다. default(atomic) 쓰레드 잠그을 걸어둠
// readonly 접근만 할 수 있도록 값을 바꿀수 없음(setter 메소드 불가) default(readwright) setter getter 가능
// strong 객체에 강한참조를 걸어줌 default 값
// nullable nil을 할당해 줄 수 있다. (즉 비어있을수 있다)

@end
