//
//  main.m
//  MultiplicationProject
//
//  Created by Sejin Peo on 2016. 5. 5..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>

void getMultiplicationTable(int a){
    
    for(int i=1; i<10; i++){
        NSLog(@" %d x %d = %d ",a,i,a*i);
    }
}


void factorial(int b){
    int i;
    int result = 1;
    for(i=1; i<=b; i++){
        result *= i;
        
    }
    NSLog(@"%d! = %d ",i-1,result);
}

void game369(int c){

    
    for(int i=1; i<=c; i++){
        if(i<=10){
            if(i%10==3 || i%10==6 || i%10==9){
                NSLog(@" * ");
            }else{
                NSLog(@" %d ",i);
            }
        }else if(i>=11){
        
        if(i%10==3 || i%10==6 || i%10==9 || (i%30==0 || i%30==1 || i%30==2 || i%30==4
                                             || i%30==5 || i%30==7 || i%30==8) ){
            NSLog(@" * ");
            
        }else{
            NSLog(@" %d ",i);
        }
        }
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //getMultiplicationTable(3);
        
        factorial(5);
        game369(100);
    }
    return 0;
}
