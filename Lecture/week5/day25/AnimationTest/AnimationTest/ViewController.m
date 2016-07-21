//
//  ViewController.m
//  AnimationTest
//
//  Created by youngmin joo on 2016. 5. 25..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UIView *view1;

@property (nonatomic, weak) UITextField *tf2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UITextField *tf1 = [[UITextField alloc] initWithFrame:CGRectMake(30, 100, 100, 40)];
    tf1.tag = 1;
    tf1.placeholder = @"input Text";
    tf1.delegate = self;
    tf1.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:tf1];
    
    UITextField *tf2 = [[UITextField alloc] initWithFrame:CGRectMake(30, 150, 100, 40)];
    tf2.tag = 2;
    tf2.placeholder = @"input Text";
    tf2.delegate = self;
    tf2.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:tf2];
    self.tf2 = tf2;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSUInteger tagNum =  textField.tag;
    
    if (tagNum ==1) {
        [self.tf2 becomeFirstResponder];
    }else if (tagNum == 2)
    {
        //self.tf1 == textField
        //        [self.tf1 resignFirstResponder];
        [textField resignFirstResponder];
    }else
    {
        NSLog(@"안불릴껄");
    }
    
    NSLog(@"call Return Delegate Method");
    //    [textField resignFirstResponder];
    
    return NO;
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSLog(@"call textFieldShouldBeginEditing");
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
  
    NSLog(@"call textFieldDidBeginEditing");
}





- (void)onTouchUpInsideBtn:(UIButton *)sender
{
    if(sender.selected)
    {
        sender.selected = NO;
    }else{
        sender.selected = YES;
    }
    
    
    NSInteger selectedBtnNum = sender.tag;
    switch (selectedBtnNum) {
        case 1:
            NSLog(@"룰루랄라");
            
            break;
        case 2:
            NSLog(@"울루랄라");
            break;
        default:
            break;
    }
    
    
}


- (void)simpleMethod:(void(^)(NSString *name))param
{
    NSLog(@"befor StartBlock");
    
    param(@"in param");
    
    NSLog(@"after EndBlock");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startAni:(id)sender
{
//    [UIView animateWithDuration:0.3 animations:^{
//        CGPoint newCenter = CGPointMake(self.view1.center.x + 100, self.view1.center.y);
//        self.view1.center =  newCenter;
//    }];
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn|UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse animations:^{
        CGPoint newCenter = CGPointMake(self.view1.center.x + 150, self.view1.center.y);
        self.view1.center =  newCenter;
    } completion:^(BOOL finished) {
        NSLog(@"complete animation");
    }];
    
//    [UIView animateWithDuration:3 delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:1.5 options:UIViewAnimationOptionCurveLinear animations:^{
//        CGPoint newCenter = CGPointMake(self.view1.center.x + 150, self.view1.center.y);
//        self.view1.center =  newCenter;
//    } completion:nil];
}

@end

@protocol jjj <NSObject>



@end
