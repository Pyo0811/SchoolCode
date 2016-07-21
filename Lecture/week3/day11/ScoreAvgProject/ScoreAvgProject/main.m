//
//  main.m
//  ScoreAvgProject
//
//  Created by Sejin Peo on 2016. 5. 9..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>


//총점
NSInteger totScore(NSArray *subjects)
{
    NSInteger totalScore = 0;
    
    for(NSNumber *score in subjects){
        totalScore += score.integerValue;
    }
    
    return totalScore;
}

//평균
CGFloat averageSubjects(NSArray *subjects){
    
    CGFloat total = (CGFloat)totScore(subjects);
    return total/subjects.count;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSArray *subjectList = @[@100,@99,@34,@78,@85,@81];
        CGFloat average = averageSubjects(subjectList);
        NSLog(@"%f",average);

    }
    return 0;
}
