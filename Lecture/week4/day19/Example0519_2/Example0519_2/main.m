//
//  main.m
//  Example0519_2
//
//  Created by Sejin Peo on 2016. 5. 19..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyClass.h"


int main(int argc, const char * argv[]) {
  
    MyClass *myInstance = [[MyClass alloc] init];
    
    [myInstance setName:@"yagom"];

    NSLog(@"%@",[myInstance name]);
    
    [myInstance setAge:10];     // myInstance.setAge = 10;
    
    NSLog(@"%ld",[myInstance age]); // NSLog(@"%ld",myInstance.age);
    
    return 0;
}
