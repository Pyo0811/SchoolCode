//
//  Calculator.h
//  BanOlim
//
//  Created by Sejin Peo on 2016. 5. 11..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

-(CGFloat)roundNum:(CGFloat)num digit:(NSInteger)digit;
-(void)calculateDate:(NSInteger)inputYear day:(NSInteger)afterDay;
-(NSInteger)reverseNum:(NSInteger)inputNum;

@end
