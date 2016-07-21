//
//  main.c
//  Queue
//
//  Created by Sejin Peo on 2016. 5. 23..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#include <stdio.h>
#include <string.h>
int queue[10000];
int begin, end;
int main(int argc, const char * argv[]) {
    // insert code here...
    
    // data[
    // empty : left == right
    
    int n;
    
    scanf("%d",&n);
    for(int k=0; k<n; k++){
        char cmd[100];
        scanf("%s",cmd);
        if(!strcmp(cmd,"pop")){
            if(begin == end){
                printf("-1\n");
            }else{
            printf("%d\n",queue[begin]);
            begin += 1;
            }
    }else if(!strcmp(cmd,"push")){
        if(begin == end){
            printf("-1\n");
        }else{
            printf("%d\n",queue[end]);
            end += 1;
        }
    }else if(!strcmp(cmd,"size")){
        printf("%d\n",end-begin);
    }else if(!strcmp(cmd,"empty")){
        if(begin == end){
            printf("1\n");
        }else{
            printf("0\n");
        }
    }else if(!strcmp(cmd,"front")){
        if(begin == end){
            printf("-1\n");
        }else{
            printf("%d\n",queue[begin-1]);
        }
    
    }else if(!strcmp(cmd,"back")){
        if(begin == end){
            printf("-1\n");
        }else{
            printf("%d\n",queue[end-1]);
        }
    }else{
        int num;
        scanf("%d",&num);
        queue[end] = num;
        end += 1;
        }
    }
    return 0;
}
