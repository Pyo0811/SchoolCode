//
//  UITextTest.m
//  UIButtonTest
//
//  Created by Sejin Peo on 2016. 5. 26..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "UITextTest.h"

@interface UITextTest ()
<UITextFieldDelegate>

//@property (nonatomic, weak) IBOutlet UIView *view;
@property(nonatomic) UITextField *textField1;
@property(nonatomic) UILabel *label2;

@end

@implementation UITextTest

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.textField1 = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 150, 40)];
    self.textField1.placeholder = @"텍스트 입력";
    [self.textField1 setTextAlignment:NSTextAlignmentCenter];
    self.textField1.delegate = self;
    self.textField1.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textField1];
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(190, 100, 100, 40)];
    [button1 setTitle:@"확인" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(onTouchUpInsideBtn:) forControlEvents:UIControlEventTouchUpInside];
    [button1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self.view addSubview:button1];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, 50, 40)];
    [label1 setText:@"결과 :"];
    [label1 setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:label1];
    
    self.label2 = [[UILabel alloc] initWithFrame:CGRectMake(100, 150, 200, 40)];
    [self.label2 setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.label2];
    
}

-(void)onTouchUpInsideBtn:(UIButton *)sender
{
    [self.label2 setText:self.textField1.text];
}

//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;
//// return NO to disallow editing.
//- (void)textFieldDidBeginEditing:(UITextField *)textField;
//// became first responder
//- (BOOL)textFieldShouldEndEditing:(UITextField *)textField;
//// return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
//- (void)textFieldDidEndEditing:(UITextField *)textField;
//// may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
//
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
//// return NO to not change text
//
//- (BOOL)textFieldShouldClear:(UITextField *)textField;
//// called when clear button pressed. return NO to ignore (no notifications)
//- (BOOL)textFieldShouldReturn:(UITextField *)textField;

/*
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    // 입력 완료 텍스트를 얻기
    NSMutableString *str = [textField.text mutableCopy];
    // 입력 완료 텍스트와 입력되고 있는 텍스틀 결합
    [str replaceCharactersInRange:range withString:string];
    
    BOOL ret = YES;
    //ret = [self isNumber:str];
    
    return NO;
    //return ret;
}

-(BOOL)isNumber:(NSString *)value
{
    
    // 빈 문자의 경우는 NO
    if((value == nil) || ([@"" isEqualToString:value]))
    {
        return NO;
    }
    
    NSInteger l = [value length];
    
    BOOL b = NO;
    for(NSInteger i=0; i<l; i++){
        NSString *str = [[value substringFromIndex:i] substringToIndex:1];
        const char *c = [str cStringUsingEncoding:NSASCIIStringEncoding];
        if(c == nil)
        {
            b = NO;
            break;
        }
        if((c[0] >= 0x30) && (c[0] <= 0x39))
        {
            b = YES;
        }else
        {
            b = NO;
            break;
        }
    }
    
    if(b)
    {
        return YES; // 수치 문자열
    }else
        return NO;
    {
}
*/
    
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSLog(@"call textFieldShouldBeginEditing");
    
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"call textFieldDidBeginEditing:");
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    NSLog(@"call textFieldShouldEndEditing");
    
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"call Return Delegate Method");
    [textField resignFirstResponder];
    
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"call textFieldDidEndEditing");
}

-(BOOL)textFieldShouldClear:(UITextField *)textField
{
    NSLog(@"call textFieldShouldClear");
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
