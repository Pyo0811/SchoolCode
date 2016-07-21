//
//  ViewController.m
//  Practice1
//
//  Created by Sejin Peo on 2016. 6. 13..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "ViewController.h"
#import "SecondView.h"

@interface ViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *text;
@property (nonatomic, weak) UIButton *button;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, weak) UIButton *nextButton;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createView];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createView{
    UIView *subView1 = [[UIView alloc] init];
    subView1.backgroundColor = [UIColor greenColor];
    [self.view addSubview:subView1];
    
    
    UITextField *text = [[UITextField alloc] init];
    text.placeholder = @"텍스트를 입력하세요";
    text.textAlignment = NSTextAlignmentCenter;
    text.borderStyle = UITextBorderStyleRoundedRect;
    text.delegate = self;
    [subView1 addSubview:text];
    self.text = text;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"입력완료" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onTouchUpInsideBtn) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [subView1 addSubview:button];
    self.button = button;
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"LABEL";
    label.textAlignment = NSTextAlignmentLeft;
    [subView1 addSubview:label];
    self.label = label;
    
    UIButton *nextButton = [[UIButton alloc] init];
    [nextButton setTitle:@"다음 화면으로!" forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(settingNextPage:) forControlEvents:UIControlEventTouchUpInside];
    [nextButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [nextButton setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [subView1 addSubview:nextButton];
    self.nextButton = nextButton;
    
    
    subView1.translatesAutoresizingMaskIntoConstraints = NO;
    text.translatesAutoresizingMaskIntoConstraints = NO;
    button.translatesAutoresizingMaskIntoConstraints = NO;
    label.translatesAutoresizingMaskIntoConstraints = NO;
    nextButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSDictionary *views = NSDictionaryOfVariableBindings(subView1,text,button,label,nextButton);
    
    NSLayoutConstraint *centreX = [NSLayoutConstraint constraintWithItem:subView1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    [self.view addConstraint:centreX];
    
    NSArray *consts = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[subView1]-20-|" options:0 metrics:0 views:views];
    NSArray *consts2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[subView1(==150)]" options:0 metrics:0 views:views];
    NSArray *consts3 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[text(==30)]-10-[label(==text)]-10-[nextButton(==label)]" options:0 metrics:0 views:views];
    NSArray *consts4 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[button(==30)]" options:0 metrics:0 views:views];
    NSArray *consts5 = [NSLayoutConstraint constraintsWithVisualFormat:@"|-20-[text(>=240)]-10-[button]-20-|" options:0 metrics:0 views:views];
    NSArray *consts6 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label(>=30)]" options:0 metrics:0 views:views];
    NSArray *consts7 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[nextButton(>=100)]" options:0 metrics:0 views:views];
    
    //|-20-[l(==t)]-10-[t]-|"
    
    
    [self.view addConstraints:consts];
    [self.view addConstraints:consts2];
    [subView1 addConstraints:consts3];
    [subView1 addConstraints:consts4];
    [subView1 addConstraints:consts5];
    [subView1 addConstraints:consts6];
    [subView1 addConstraints:consts7];
}


- (void)onTouchUpInsideBtn{
    NSLog(@"%@",self.text.text);
    self.label.text = self.text.text;
    self.text.text = @"";
    //[self.text resignFirstResponder];
    [self.text endEditing:YES];
}

-(IBAction)tabGesture:(id)sender{
    NSLog(@"화면클릭됨");
    [self.text endEditing:YES];
}

-(void)settingNextPage:(id)sender{
    NSLog(@"다음화면으로 이동하겠습니다. FIRST_TO_SECOND");
    [self performSegueWithIdentifier:@"FIRST_TO_SECOND" sender:sender];
}


// This is from Stack over flow http://stackoverflow.com/questions/9674685/creating-a-segue-programmatically
/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"Associate"])
    {
        TranslationQuizAssociateVC *translationQuizAssociateVC = [segue destinationViewController];
        translationQuizAssociateVC.nodeID = self.nodeID; //--pass nodeID from ViewNodeViewController
        translationQuizAssociateVC.contentID = self.contentID;
        translationQuizAssociateVC.index = self.index;
        translationQuizAssociateVC.content = self.content;
    }
}
*/

/*
-(void)settingNextPage:(id)sender
{
    NSLog(@"다음화면으로 이동하겠습니다.");
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SecondView *secondVC = [story instantiateViewControllerWithIdentifier:@"SecondPage"];
        [self.navigationController pushViewController:secondVC animated:YES];
    
}
*/

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSLog(@"call textFieldShouldBeginEditing:(1st)");
    
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"call textFieldDidBeginEditing:(2nd)");
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    NSLog(@"call textFieldShouldEndEditing:(3rd)");
    
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
    NSLog(@"call textFieldDidEndEditing:(4th)");
}

-(BOOL)textFieldShouldClear:(UITextField *)textField
{
    NSLog(@"call textFieldShouldClear");
    
    return YES;
}



@end
