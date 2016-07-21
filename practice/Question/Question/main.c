//
//  main.c
//  Question
//
//  Created by Sejin Peo on 2016. 5. 18..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

    /*
    int num;
    scanf(" %d",&num);
    
    for(int i=1; i<=num; i++){
        
        for(int j=1; j<=i; j++)
        {
            printf("*");
        }
        
        for(int j=1; j<=2*(num-i); j++){
            printf(" ");
        }
        
        for(int j=1; j<=i; j++){
            printf("*");
        }
        printf("\n");
    }
    for(int i=num+1; i<=(num*2)-1; i++){
        
        for(int j=1; j<=i; j++)
        {
            printf("*");
        }
        
        for(int j=1; j<=2*(num-i); j++){
            printf(" ");
        }
        
        for(int j=1; j<=i; j++){
            printf("*");
        }
        printf("\n");
    }
     
     */
#include <stdio.h>
#include <stdlib.h>

struct Stack{
    int data[10000];
    int size;
    
    void push(int num);{
        data[size] = num;
        size += 1;
    }
    
    
    bool empty(){
        if(size == 0){
            return true;
        }else{
            return false;
        }
    }
    
    int pop(){
        if(empty()){
            return -1;
        }else{
            size -=1;
            return data[size];
        }
    }
    
    int top(){
        if(empty()){
            return -1;
        }else{
            return data[size-1];
        }
    }

};

int main(){
    
}
