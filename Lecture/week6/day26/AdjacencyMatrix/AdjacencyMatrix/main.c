//
//  main.c
//  AdjacencyMatrix
//
//  Created by Sejin Peo on 2016. 5. 30..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#include <stdio.h>

int a[10][10];
int main(int argc, const char * argv[]) {
    // insert code here...
    int n, m;
    scanf("%d %d",&n,&m);
    for(int i=0; i<m; i++){
        int u,v,w;
        scanf("%d %d %d",&u,&v,&w);
        a[u][v] = a[v][u] = w;
    }
    return 0;
}
