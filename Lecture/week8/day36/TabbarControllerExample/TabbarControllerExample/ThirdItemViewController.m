//
//  ThirdItemViewController.m
//  TabbarControllerExample
//
//  Created by Sejin Peo on 2016. 6. 14..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "ThirdItemViewController.h"
#import "FourthItemViewController.h"
#import "ThirdItemSecondPage.h"
#import "ThirdItemModalView.h"
#import "DataCentre.h"

@interface ThirdItemViewController () <UITextViewDelegate>

@property (nonatomic,strong) UITextView *textView;

@property (nonatomic,strong) DataCentre *dataCentre;

@end

@implementation ThirdItemViewController

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createThirdBar];
    [self createNextButton];
    [self.navigationController setNavigationBarHidden:YES];
    self.dataCentre = [DataCentre defaultData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createThirdBar{
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 20, 150, 200)];
    textView.text = @"TextView";
    textView.font = [UIFont systemFontOfSize:14.0f];
    textView.backgroundColor = [UIColor yellowColor];
    textView.delegate = self;
    [self.view addSubview:textView];
    self.textView = textView;
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(150, 250, 130, 300)];
    label.text = @"label";
    label.numberOfLines = 0;
    [self.view addSubview:label];
    self.label = label;
    
}

-(void)createNextButton{
    
    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nextButton.frame = (CGRectMake(50, 70, 100, 200));
    [nextButton setTitle:@"다음 화면" forState:UIControlStateNormal];
    [nextButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [nextButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [nextButton addTarget:self action:@selector(goToNextPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextButton];
    
    UIButton *nextButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    nextButton2.frame = (CGRectMake(50, 70, 100, 200));
    [nextButton2 setTitle:@"모달 뷰" forState:UIControlStateNormal];
    [nextButton2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [nextButton2 setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [nextButton2 addTarget:self action:@selector(goToModalView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextButton2];
    
    nextButton.translatesAutoresizingMaskIntoConstraints = NO;
    nextButton2.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSDictionary *views = NSDictionaryOfVariableBindings(nextButton,nextButton2);
    NSArray *nextButtonRight30 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[nextButton(>=50,<=70)]-30-|" options:0 metrics:0 views:views];
    NSArray *nextButtonTop30 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[nextButton(==30)]" options:0 metrics:0 views:views];
    
    NSArray *nextButton2Right30 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[nextButton2(>=50,<=70)]-30-|" options:0 metrics:0 views:views];
    NSArray *nextButton2Top20 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[nextButton]-20-[nextButton2(==30)]" options:0 metrics:0 views:views];
    
    [self.view addConstraints:nextButtonRight30];
    [self.view addConstraints:nextButtonTop30];
    [self.view addConstraints:nextButton2Right30];
    [self.view addConstraints:nextButton2Top20];
}

- (void)textViewDidChange:(UITextView *)textView{
    //NSLog(@"call textViewDidChange 바뀔때마다");
    self.label.text = self.textView.text;
    
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    NSLog(@"call textViewDidEndEditing");
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    NSLog(@"call textViewDidBeginEditing");
}

- (void)textViewDidChangeSelection:(UITextView *)textView{
    //NSLog(@"textViewDidChangeSelection 바뀔때마다");
}

- (IBAction)nextPage:(id)sender{
    NSLog(@"아무거나 클릭");
    [self.textView endEditing:YES];
    self.dataCentre.tempData = self.textView.text;
    NSLog(@"%@",self.dataCentre.tempData);
//    FourthItemViewController *fourth = self.tabBarController.viewControllers[3];
//    fourth.label.text = self.label.text;
//    
//    ThirdItemSecondPage *secondOfThirdBar = self.navigationController.viewControllers[0];
//    secondOfThirdBar.label.text = self.label.text;
}

- (void)goToNextPage{
    UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ThirdItemSecondPage *secondOfThirdBar = [main instantiateViewControllerWithIdentifier:@"SecondOfThirdTab"];
    [self.navigationController pushViewController:secondOfThirdBar animated:YES];
}

- (void)goToModalView{
    UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ThirdItemModalView *modal = [main instantiateViewControllerWithIdentifier:@"SecondOfModalView"];
//    [self.navigationController presentModalViewController:modal animated:YES];
    [self.navigationController presentViewController:modal animated:YES completion:nil];
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
