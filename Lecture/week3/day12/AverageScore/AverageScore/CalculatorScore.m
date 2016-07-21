//
//  CalculatorScore.m
//  AverageScore
//
//  Created by Sejin Peo on 2016. 5. 10..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "CalculatorScore.h"

@implementation CalculatorScore{
    NSString *grade;
    CGFloat point;
}

-(NSString *)calGrade:(int)score{
    
    if(score>=90){
        grade = @"A+";
    }else if(score>=80){
        grade = @"A";
    }else if(score>=70){
        grade = @"B+";
    }else if(score>=65){
        grade = @"C+";
    }else if(score>=60){
        grade = @"C";
    }else{
        grade = @"F";
    }
    
    return grade;
}

-(void)calPoint{
    

    if([grade isEqual:@"A+"]){
        point = 4.5;
    }else if([grade isEqual:@"A"]){
        point = 4.0;
    }else if([grade isEqual:@"B+"]){
        point = 3.5;
    }else if([grade isEqual:@"B"]){
        point = 3.0;
    }else if([grade isEqual:@"C+"]){
        point = 2.5;
    }else if([grade isEqual:@"C"]){
        point = 2.0;
    }else{
        point = 1.0;
    }
    
}


-(void)printPoint{
    NSLog(@"당신의 학점은 : %0.1f ",point);
}

@end
