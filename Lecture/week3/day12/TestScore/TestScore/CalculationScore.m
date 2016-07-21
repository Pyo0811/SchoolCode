//
//  CalculationScore.m
//  TestScore
//
//  Created by Sejin Peo on 2016. 5. 10..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "CalculationScore.h"

@implementation CalculationScore
{
    NSMutableArray *subjects;
}

// 과목점수를 추가하는 함수
- (void)addSubjectScore:(NSInteger)score
{
    // 초기화
    if(subjects == nil){
        subjects = [[NSMutableArray alloc]initWithCapacity:1];
        // initWithCapacity 일단 배열 한개의 방을 지정한다
    }
    
    //NSNumber(참조형 타입)으로 변환
    //NSnumberWithInteger Number Class Method
    NSNumber *scoreNum = [NSNumber numberWithInteger:score];
    //배열에 추가
    [subjects addObject:scoreNum];
}

// 과목의 총점
- (NSInteger)totalScore
{
    NSInteger totalScore = 0;
    for(NSNumber *score in subjects){
        
        totalScore += score.integerValue;
    }
    
    return totalScore;
}

// 평균 구하기
-(CGFloat)averageScore
{
    // 과목의 점수가 1개 이상일때
    if(subjects.count>0){
       
        CGFloat averageS = ((CGFloat)[self totalScore])/subjects.count;
        
        return averageS;
    }else{ // 과목 점수가 없을때
        return 0;
    }
    
    
}

@end
