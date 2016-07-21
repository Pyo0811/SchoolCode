//
//  main.c
//  2×n 타일링
//
//  Created by Sejin Peo on 2016. 5. 25..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#include<stdio.h>
int n,a[1001];
int main(){
    scanf("%d",&n);
    a[0]=a[1]=1;
    for(int i=2; i<=n; i++)
        a[i]=(a[i-1]+a[i-2])%10007;
    printf("%d",a[n]);
    return 0;
}