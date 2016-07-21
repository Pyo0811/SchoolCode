//
//  ThirdView.m
//  Practice1
//
//  Created by Sejin Peo on 2016. 6. 13..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "ThirdView.h"
#import "SecondView.h"
#import "ViewController.h"

@interface ThirdView ()

@property (nonatomic, weak) UIButton *moveToBackButton;
@property (nonatomic, weak) UIButton *moveToMainButton;

@end

@implementation ThirdView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createView];
    [self.navigationController setTitle:@"세번째 페이지입니다."];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createView{
    
    UIButton *moveToBackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [moveToBackButton setTitle:@"이전 화면으로!" forState:UIControlStateNormal];
    [moveToBackButton addTarget:self action:@selector(settingMoveToBeforePage) forControlEvents:UIControlEventTouchUpInside];
    [moveToBackButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [moveToBackButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [self.view addSubview:moveToBackButton];
    self.moveToBackButton = moveToBackButton;
    
    UIButton *moveToMainButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [moveToMainButton setTitle:@"메인 화면으로!" forState:UIControlStateNormal];
    [moveToMainButton addTarget:self action:@selector(settingMoveToMainPage) forControlEvents:UIControlEventTouchUpInside];
    [moveToMainButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [moveToMainButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [self.view addSubview:moveToMainButton];
    self.moveToMainButton = moveToMainButton;
    
    moveToBackButton.translatesAutoresizingMaskIntoConstraints = NO;
    moveToMainButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSDictionary *views = NSDictionaryOfVariableBindings(moveToBackButton,moveToMainButton);
    NSArray *consts = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-70-[moveToBackButton(==30)]-10-[moveToMainButton(==moveToBackButton)]" options:0 metrics:0 views:views];
    NSArray *consts1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[moveToBackButton(>=70)]" options:0 metrics:0 views:views];
    NSArray *consts2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[moveToMainButton(>=70)]" options:0 metrics:0 views:views];
    
    [self.view addConstraints:consts];
    [self.view addConstraints:consts1];
    [self.view addConstraints:consts2];
}

- (void)settingMoveToBeforePage{
    NSLog(@"이전 페이지로 이동!");
    UIStoryboard *secondPage = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SecondView *secondVC = [secondPage instantiateViewControllerWithIdentifier:@"SecondPage"];
    [self.navigationController pushViewController:secondVC animated:YES];
}

- (void)settingMoveToMainPage{
    NSLog(@"메인 화면으로 이동");
    UIStoryboard *mainPage = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *mainVC = [mainPage instantiateViewControllerWithIdentifier:@"MainPage"];
    [self.navigationController pushViewController:mainVC animated:YES];
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
