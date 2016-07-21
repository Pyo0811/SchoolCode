//
//  main.m
//  TriangleProject
//
//  Created by Sejin Peo on 2016. 5. 6..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>


void swapFunc(int a, int b){
    int num1 = a;
    int num2 = b;
    
    int temp=num1;
    num1=num2;
    num2=temp;
    
    NSLog(@"Before swap n1 : %d , n2 : %d",num1,num2);
}

void triangularNum(int b){
    int i;
    int result = 0;
    for(i=1; i<=b; i++){
        result += i;
        
    }
    NSLog(@"결과 : %d",result);
}



void triangularRangeNum(int a, int b){
    int i;
    int result = 0;
    
    for(i=a; i<=b; i++){
        if(i%5==0){
            
            NSLog(@" %d ",result);
//            //////////////////
//            
//            for(int j=1; j<=i; j++){
//                result += j;
//                
//            }
//            //////////////////////
//            NSLog(@"결과 : %d",result);
//            
            
        }
    }
    
}

int sum = 0;

void eachSum(int m){
  
    do{
        sum += m%10;
        
        m /= 10;
    }while(m>0);
}

void addAllNum(int n){
   
    
    
    if(n > 0){
        
        if( n < 10){
            
            // 두 자리 미만인 경우
            NSLog(@"각자리 결과 : %d ",n);
        }else{
            eachSum(n);
            NSLog(@"각자리 결과 : %d ",sum);
        }
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int n1, n2;
        
        n1=10;
        n2=20;
        NSLog(@"Before swap n1 : %d , n2 : %d",n1,n2);
        swapFunc(n1,n2);
        triangularNum(10);
        triangularRangeNum(1,25);
        addAllNum(386);
        
    }
    return 0;
}
