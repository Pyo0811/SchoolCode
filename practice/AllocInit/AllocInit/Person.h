//
//  Person.h
//  AllocInit
//
//  Created by Sejin Peo on 2016. 5. 11..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSInteger age;
}

@property(assign) NSInteger age;

-(id)init;  // 생성자
-(id)initWithAge:(NSInteger) age1;  // 인자가 있는 생성자

@end
