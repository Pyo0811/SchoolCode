//
//  main.m
//  ChosungConvert
//
//  Created by Sejin Peo on 2016. 5. 23..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>

// ㄱ ㄴ ㄷ
// ㅏ ㅑ
// 없음 ㅇ ㅅ

// 가 강 갓 갸 걍 걋 나 낭 낫 냐 냥 낫 다 당 닷 댜 댱 댯 ( 18개)
// -------------- ------------- --------------
//      가(6개)        나(6개)         다(6개)
// ------- ------
//    ㅏ      ㅑ
// (2*3)*cho + 3*jung + jong = 번째
// (2,0,1) = 2*3*2 + 3*0 + 1 = 13

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        // 초성 ㄱ ㄲ ㄴ ㄷ ㄹ ㅁ ㅂ ㅃ ㅅ ㅆ ㅇ ㅈ ㅉ ㅊ ㅋ ㅌ ㅍ ㅎ ( 19개)
        // 중성 21개
        // 종성 28개
        // 19 * 21 * 28
        // 0xAC00 21*28*cho + 28*jung + jong = 최
        NSArray *chosung = @[@"ㄱ",@"ㄲ",@"ㄴ",@"ㄷ",@"ㄸ",@"ㄹ",@"ㅁ",@"ㅂ",
                             @"ㅃ",@"ㅅ",@"ㅆ",@"ㅇ",@"ㅈ",@"ㅉ",@"ㅊ",@"ㅋ",@"ㅌ",@"ㅍ",
                             @"ㅎ"];
        NSString *name = @"안녕하세요. Heelo! hiㅎㅇㅎㅇ하이 배가고파요ㅠㅠ";
        NSLog(@"%@",name);
        NSMutableString *result = [NSMutableString string];
        for(NSUInteger i=0; i<[name length]; i++){
            //NSLog(@"%tu",i);
            unichar c = [name characterAtIndex:i];
            // 'a', @"a"
            if(0xAC00 <= c && c <= 0xD7AF){
            NSLog(@"%tu %C %ld",i,c,(NSInteger)c);
            NSInteger x = (NSInteger)c - 0xAC00;
            NSLog(@"%ld 번째",x);
            // 21*28*cho + 28*jung + jong = x;
            // 28*(21*cho + jung) + jong = x;
            NSInteger jong = x % 28;
            // 28*(21*cho + jung) = x
            x = x - jong;
            // 21*cho + jung = x
            x = x / 28;
            NSInteger jung = x % 21;
            x -= jung;
            // 21 * cho = x
            NSInteger cho = x / 21;
            NSString *chosungs = chosung[cho];
            NSLog(@"%C %zd 번째 초성 %@",c, cho, chosungs);
            [result appendString:chosungs];
            }else{
                NSString *letter = [name substringWithRange:NSMakeRange(i,1)];
                NSLog(@"예외: %@",letter);
                NSUInteger index = [chosung indexOfObject:letter];
                NSLog(@"인덱스: %tu",index);
                if(index != NSNotFound){
                    [result appendString:letter];
                }
            }
        }
        
        NSString *converted = result;
        converted = [converted stringByReplacingOccurrencesOfString:@"ㄱㄱ"
                                                         withString:@"ㄲ"];
        converted = [converted stringByReplacingOccurrencesOfString:@"ㄷㄷ"
                                                         withString:@"ㄸ"];
        converted = [converted stringByReplacingOccurrencesOfString:@"ㅂㅂ"
                                                         withString:@"ㅃ"];
        converted = [converted stringByReplacingOccurrencesOfString:@"ㅅㅅ"
                                                         withString:@"ㅆ"];
        converted = [converted stringByReplacingOccurrencesOfString:@"ㅈㅈ"
                                                         withString:@"ㅉ"];
        NSLog(@"%@",result);
        NSLog(@"%@",converted);
    }
    return 0;
}
