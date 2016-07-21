//
//  Person.m
//  AllocInit
//
//  Created by Sejin Peo on 2016. 5. 11..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize age;

-(id)init{
    
    self = [super init];
    if(self){
        NSLog(@"init 호출전");
        self.age = 100;
    }
    
    return self;
}

-(id)initWithAge:(NSInteger)age1{
    
    self = [super init];
    if(self){
        NSLog(@"init 호출전");
        self.age = age1;
    }
    
    return self;
}

@end
