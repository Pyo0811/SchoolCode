//
//  SecondView.m
//  Practice1
//
//  Created by Sejin Peo on 2016. 6. 13..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "SecondView.h"
#import "ThirdView.h"

@interface SecondView ()

@property (nonatomic, weak) UILabel *label;
@property (nonatomic, weak) UIButton *nextButton;

@end

@implementation SecondView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createView];
    [self.navigationController setTitle:@"두번째 페이지입니다."];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createView{
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"두번째 화면";
    [self.view addSubview:label];
    self.label = label;
    
    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [nextButton setTitle:@"다음 화면으로!" forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(settingMoveToNextPage) forControlEvents:UIControlEventTouchUpInside];
    [nextButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [nextButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [self.view addSubview:nextButton];
    self.nextButton = nextButton;
    
    label.translatesAutoresizingMaskIntoConstraints = NO;
    nextButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSDictionary *views = NSDictionaryOfVariableBindings(label,nextButton);
    NSArray *consts = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-70-[label(==30)]-10-[nextButton(==label)]" options:0 metrics:0 views:views];
    NSArray *consts1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label(>=30)]" options:0 metrics:0 views:views];
    NSArray *consts2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[nextButton(>=70)]" options:0 metrics:0 views:views];
    
    [self.view addConstraints:consts];
    [self.view addConstraints:consts1];
    [self.view addConstraints:consts2];
}

- (void)settingMoveToNextPage{
    NSLog(@"세번째 화면으로 이동");
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ThirdView *thirdVC = [story instantiateViewControllerWithIdentifier:@"ThirdPage"];
    [self.navigationController pushViewController:thirdVC animated:YES];
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
