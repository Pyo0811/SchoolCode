//
//  main.c
//  Fibonacci
//
//  Created by Sejin Peo on 2016. 5. 25..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#include <stdio.h>

int main(void){
    
    int n;
    int i, a = 0, b = 1;
    
    scanf("%d", &n);
    
    for(i=1; i<n+1; i++){
        a += b;
        b = a-b;
    }
    
    printf("%d\n",a);
    
    return 0;
}
