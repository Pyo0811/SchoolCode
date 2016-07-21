//
//  main.m
//  Practice1Project
//
//  Created by Sejin Peo on 2016. 5. 9..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        CGFloat b = 3.1234;
        NSInteger c = b;
        NSLog(@" %ld ",c);
        NSInteger cnt=0;
        while((CGFloat)c != b){
            b=b*10;
            cnt++;
        }
        NSLog(@"cnt의 값 : %ld ",cnt);
        NSLog(@"왜 씨발 출력이 안되지");
        //CGFloat jari=5;
        int sum =0;
        for(int i=0; i<cnt; i++){
            
            sum = sum + i;
        }
        printf("%d",sum);
        NSLog(@"왜 씨발 출력이 안되지");
            }
    return 0;
}
