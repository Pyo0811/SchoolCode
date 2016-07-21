//
//  CalculationScore.h
//  TestScore
//
//  Created by Sejin Peo on 2016. 5. 10..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculationScore : NSObject

- (void)addSubjectScore:(NSInteger)score;
-(CGFloat)averageScore;

@end
