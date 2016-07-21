//
//  ViewController.h
//  MyCalculatorsProject
//
//  Created by Sejin Peo on 2016. 5. 4..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    //총 계산의 결과값 변수
    NSInteger resultNum;
    
    //연산기호를 넣어둘 버퍼
    NSString *operatorBuffer;
    
    //화면에 표시되는 내용
    NSString *displayText;
}


//UI TextField
@property (nonatomic, weak) IBOutlet UITextField *displayTextField;

@end

