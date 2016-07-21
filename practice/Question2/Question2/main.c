//
//  main.c
//  Question2
//
//  Created by Sejin Peo on 2016. 5. 18..
//  Copyright © 2016년 Ubinet. All rights reserved.
//
#include <stdio.h>
int main(void)
{
    int num;
    
    scanf("%d", &num);//입력
    for (int i = 0; i < num; i++)//line: 0~n-1
    {
        for (int j=0; j<(num-i-1); j++)//공백 n-line-1개
        {
            printf(" ");
        }
        for (int k=0; k<(2*i+1); k++)//별 2*line +1개
        {
            printf("*");
        }
        printf("\n");
    }
    for (int i = num - 2; i >= 0; i--)//line:n-2 ~ 0
    {
        for (int j=0; j<(num-i-1); j++)//공백 n-line-1개
        {
            printf(" ");
        }
        for (int k=0; k<(2*k+1); k++)//별 2*line +1개
        {
            printf("*");
        }
        printf("\n");
    }
    return 0;
}
/*
#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
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
    for(int i=num-1; i>=1; i--){
        
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
    
    return 0;
}
 */
