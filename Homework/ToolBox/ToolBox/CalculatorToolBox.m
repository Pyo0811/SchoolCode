//
//  CalculatorToolBox.m
//  ToolBox
//
//  Created by Sejin Peo on 2016. 5. 10..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "CalculatorToolBox.h"

@implementation CalculatorToolBox

-(NSInteger)numAdd:(NSInteger)num1 num2:(NSInteger)num2{
    
    return num1+num2;
}

-(NSInteger)numSub:(NSInteger)num1 num2:(NSInteger)num2{
    
    return num1-num2;
}

-(NSInteger)numMulti:(NSInteger)num1 num2:(NSInteger)num2{

    return num1*num2;
}

-(CGFloat)numDiv:(NSInteger)num1 num2:(NSInteger)num2{
    
    
    
    return (float)num1/(float)num2;
}

-(void)inchToCm:(NSInteger)num1{
    
    CGFloat num2 = (CGFloat)num1;
    
    CGFloat cm = 2.54;
    
    NSLog(@"%0.2f inch --> %0.2f cm",num2,num2*cm);
}

-(void)cmToInch:(NSInteger)num1{
    
    CGFloat num2 = (CGFloat)num1;
    
    CGFloat inch = 0.393701;
    
    NSLog(@"%0.2f cm --> %0.2f inch",num2,num2*inch);
}

-(void)m2ToPyeong:(NSInteger)num1{
    
    CGFloat num2 = (CGFloat)num1;
    
    CGFloat pyeong = 0.3025;
    
    NSLog(@"%0.2f m2 --> %0.2f 평",num2,pyeong*num2);
    
}

-(void)pyeongToM2:(NSInteger)num1{
    
    CGFloat num2 = (CGFloat)num1;
    
    CGFloat m2 = 3.305785;
    
    NSLog(@"%0.2f 평 --> %0.2f m2 ",num2,m2*num2);

}

-(void)fahToCel:(NSInteger)num1{
    
    CGFloat num2 = (CGFloat)num1;
    
    CGFloat cel = (num2 - 32)/ 1.8;

    NSLog(@"%0.2f .F --> %0.2f .C ",num2,cel);
}

-(void)celToFah:(NSInteger)num1{
    
    CGFloat num2 = (CGFloat)num1;
    
    CGFloat fah = (num2 * 1.8 ) + 32;
    
    NSLog(@"%0.2f .C --> %0.2f .F",num2,fah);
}

-(void)kbToMbGb:(NSInteger)num1{
    
    CGFloat mb = (CGFloat)num1/1024;
    CGFloat gb = (CGFloat)mb/1024;
    
    NSLog(@" %ld KB --> %0.4f MB ",num1,mb);
    NSLog(@" %ld KB --> %0.4f GB ",num1,gb);

}

-(void)mbToKbGb:(NSInteger)num1{
    
    NSInteger kb = num1*1024;
    CGFloat gb = (CGFloat)num1/1024;
    
    NSLog(@" %ld MB --> %ld KB ",num1,kb);
    NSLog(@" %ld mB --> %0.4f GB ",num1,gb);
}

-(void)gbToMbKb:(NSInteger)num1{
    
    NSInteger mb = num1*1024;
    NSInteger kb = mb*1024;
    
    NSLog(@" %ld MB --> %ld KB ",num1,mb);
    NSLog(@" %ld mB --> %ld GB ",num1,kb);
}

@end
