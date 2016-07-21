//
//  main.c
//  2xn타일링2
//
//  Created by Sejin Peo on 2016. 5. 25..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#include <stdio.h>
#define MAX 1001

int dp[MAX];
int calc(int n){
    
    if( n == 0 || n == 1) return 1;
    
    if(dp[n] >0) return dp[n];
    
    dp[n] = calc(n-1) + 2 * calc(n-2);
    dp[n] %= 10007;
    
    return dp[n];
}

int main(int argc, const char * argv[]) {
    
    int n;
    scanf("%d",&n);
    
    printf("%d",calc(n));
    
    return 0;
}