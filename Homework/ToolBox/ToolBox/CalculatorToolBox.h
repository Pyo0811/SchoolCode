//
//  CalculatorToolBox.h
//  ToolBox
//
//  Created by Sejin Peo on 2016. 5. 10..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorToolBox : NSObject

-(NSInteger)numAdd:(NSInteger)num1 num2:(NSInteger)num2;
-(NSInteger)numSub:(NSInteger)num1 num2:(NSInteger)num2;
-(NSInteger)numMulti:(NSInteger)num1 num2:(NSInteger)num2;
-(CGFloat)numDiv:(NSInteger)num1 num2:(NSInteger)num2;
-(void)inchToCm:(NSInteger)num1;
-(void)cmToInch:(NSInteger)num1;
-(void)m2ToPyeong:(NSInteger)num1;
-(void)pyeongToM2:(NSInteger)num1;
-(void)fahToCel:(NSInteger)num1;
-(void)celToFah:(NSInteger)num1;
-(void)kbToMbGb:(NSInteger)num1;
-(void)mbToKbGb:(NSInteger)num1;
-(void)gbToMbKb:(NSInteger)num1;

@end
