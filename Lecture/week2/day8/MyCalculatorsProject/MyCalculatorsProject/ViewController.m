//
//  ViewController.m
//  MyCalculatorsProject
//
//  Created by Sejin Peo on 2016. 5. 4..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //데이터 초기화
    [self initData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 여기는 주석라인 입니다. 이건 코드가 읽히지 않습니다.


/*
 30번 부터 36번은 주석입니다.
 0
 0
 0
 0
 */


//데이터 초기화
- (void)initData{
    resultNum = 0;
    operatorBuffer = @"";
    displayText = @"";
    
    [self.displayTextField setText: [NSString stringWithFormat:@"%zd",resultNum]];
}

//더하기 연산
-(void) operationAdd : (NSInteger) secondNum
{
    resultNum = resultNum + secondNum;
}

//빼기 연산
-(void) operationSub : (NSInteger) secondNum
{
    resultNum = resultNum + secondNum;
}

//곱하기 연산
-(void) operationMulti : (NSInteger) secondNum
{
    resultNum = resultNum + secondNum;
}

//나누기 연산
-(void) operationDividing : (NSInteger) secondNum
{
    resultNum = resultNum + secondNum;
}

- (IBAction)onTouchUpInsideNumberBtn:(id)sender{
    
    NSString *numberStr = ((UIButton *)sender).titleLabel.text;
    displayText = [displayText stringByAppendingString:numberStr];
    
    [self.displayTextField setText:displayText];
}

-(void)operatingWithSecondNum:(NSInteger)num
{
    if(operatorBuffer.length != 0){
        if([operatorBuffer isEqualToString:@"+"])
        {//더하기 연산
            [self operationAdd:num];
        }else if([operatorBuffer isEqualToString:@"-"])
        {//빼기 연산
            [self operationSub:num];
        }else if([operatorBuffer isEqualToString:@"x"])
        {//곱하기 연산
            [self operationMulti:num];
        }else if([operatorBuffer isEqualToString:@"/"])
        {//나누기 연산
            [self operationDividing:num];
        }else
        {
            NSLog(@"error");
        }
                 
    }else
    {
        resultNum = num;
    }
}

- (IBAction)onTouchUpInsideOperationBtn:(UIButton *)sender{
    
    //처음에는 숫자가 들어가야 한다.
    if(displayText.length > 0 ) {
        //기존에 display에 있는 숫자를 결과에 추가한다.
        [self operatingWithSecondNum:displayText.integerValue];
        
        //result(결과값)을 텍스트로 변경해서 표시
        [self.displayTextField setText: [NSString stringWithFormat:@"%zd",resultNum]];
        //displaytext 지워준다
        displayText = @"";
        //오퍼레이션을 버퍼에 넣는다.
        operatorBuffer = sender.titleLabel.text;
    }else{
        if(operatorBuffer.length != 0 ){
            operatorBuffer = sender.titleLabel.text;
        }
    }
}

- (IBAction)onTouchUpInsideResultBtn:(UIButton *)sender{
    
}

- (IBAction)onTouchUpInsideCancelBtn:(UIButton *)sender{
    
    [self initData];
}


@end
