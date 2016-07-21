//
//  main.c
//  ParenthesisString
//
//  Created by Sejin Peo on 2016. 5. 23..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#include <stdio.h>
#include <string.h>
int main(int argc, const char * argv[]) {
    // insert code here...
    
    int t;
    scanf("%d",&t);
    for(int k=0; k<t; k++){
        char str[100];
        scanf("%s",str);
        int n = strlen(str); // string length 문자열 길이 재는 함수 string.h include 해야됨
        int cnt = 0;
        int negative =0;
        for (int i=0; i<n; i++){
            char c = str[i];   // 문자열 만큼 for문 돌려서 char 변수에 하나씩 넣어 검사
            if(c=='('){ // (
                cnt += 1;
            }else{ // )
                cnt -= 1;
            }
            if(cnt<0){   // )(  -1 0 이 되므로 처음에 음수가 나왔을때 negative 선언
                negative = 1;
            }
        }
        if(negative == 0 && cnt == 0){
            printf("YES\n");
        }else{
            printf("NO\n");
        }
    }
    
    return 0;
}
