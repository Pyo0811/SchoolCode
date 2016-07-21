//
//  main.m
//  MatchingGradeProject
//
//  Created by Sejin Peo on 2016. 5. 5..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>

void matchingGrade(NSString *name,int avgScore){
    
    if(avgScore>=90){
        NSLog(@"%@님은 %d점으로 1등급 입니다.",name,avgScore);
    }else if(avgScore>80){
        NSLog(@"%@님은 %d점으로 2등급 입니다.",name,avgScore);
    }else if(avgScore>70){
        NSLog(@"%@님은 %d점으로 3등급 입니다.",name,avgScore);
    }else if(avgScore>60){
        NSLog(@"%@님은 %d점으로 4등급 입니다.",name,avgScore);
    }else if(avgScore>50){
        NSLog(@"%@님은 %d점으로 5등급 입니다.",name,avgScore);
    }else if(avgScore>40){
        NSLog(@"%@님은 %d점으로 6등급 입니다.",name,avgScore);
    }else if(avgScore>30){
        NSLog(@"%@님은 %d점으로 7등급 입니다.",name,avgScore);
    }else if(avgScore>20){
        NSLog(@"%@님은 %d점으로 8등급 입니다.",name,avgScore);
    }else{
        NSLog(@"%@님은 %d점으로 9등급 입니다.",name,avgScore);
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        matchingGrade(@"김민지",24);
        matchingGrade(@"신두식",84);
        matchingGrade(@"표세진",74);
        matchingGrade(@"주영민",100);
        
    }
    return 0;
}
