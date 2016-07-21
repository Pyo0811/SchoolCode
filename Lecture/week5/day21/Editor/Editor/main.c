//
//  main.c
//  Editor
//
//  Created by Sejin Peo on 2016. 5. 25..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#include <stdio.h>
#include <string.h>
char left[500000];
char right[500000];
long left_size = 0;
long right_size = 0;


int main(int argc, const char * argv[]) {
    
    scanf("%s",left);
    left_size = strlen(left);
    int t;
    scanf("%d",&t);
    for(int k=0; k<t; k++){
        char cmd;
        scanf(" %c",&cmd);
        if(cmd == 'L'){
            
            if(left_size > 0){
                right[right_size] = left[left_size-1];
                right_size += 1;
                left_size -= 1;
            }
            //            left[left_size] = t;
            //            left_size += 1;
            //
            //            right[right_size-1] = 0;
            //            right_size -=1;
            
        }else if(cmd == 'D'){
            
            if(right_size > 0){
                left[left_size] = right[right_size-1];
                left_size += 1;
                right_size -= 1;
            }
            
            //            right[right_size] = t;
            //            right_size += 1;
            //
            //            left[left_size-1] = 0;
            //            left_size -= 1;
            
        }else if(cmd == 'B'){
            if(left_size>0){
                left[left_size-1] = 0;
                left_size -=1;
            }
        }else if(cmd == 'P'){
            char x;
            scanf(" %c",&x);
            left[left_size]=x;
            left_size +=1;
        }
        
    }
    
    for (long i=0; i<left_size; i++){
        printf("%c",left[i]);
    }
    for (long i=right_size-1; i>=0; i--){
        printf("%c",right[i]);
    }
    printf("\n");
    return 0;
}