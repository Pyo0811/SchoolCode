//
//  ViewController.m
//  DelegateTest
//
//  Created by Sejin Peo on 2016. 6. 3..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *myTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    
//    UITextField *myTextField = [[UITextField alloc] initWithFrame:CGRectMake(50,70, 150 , 30)];
//    [myTextField setBorderStyle:UITextBorderStyleRoundedRect];
//    [self.view addSubview:myTextField];
//    self.myTextField = myTextField;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - UITextFieldDelegate Methods

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    // 텍스트필드에 터치해서 글쓸려고 할때
    NSLog(@"사용자가 작업을 시작했구먼~?");
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"야 나 %@인데, 어떡할까?",textField);
    
    NSLog(@"어.. 이러면 이러고 저러면 저래라");
    if(textField.text.length >0){
        [textField endEditing:YES];
        return YES;
    }else{
        return NO;
    }
}
*/

@end
