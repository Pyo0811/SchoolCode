//
//  SecondItemViewController.m
//  TabbarControllerExample
//
//  Created by Sejin Peo on 2016. 6. 14..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "SecondItemViewController.h"

@interface SecondItemViewController ()

@end

@implementation SecondItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createSecondBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createSecondBar{
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"Second View";
    titleLabel.font = [UIFont systemFontOfSize:40.0f];
    titleLabel.textColor = [UIColor blueColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
    
    UILabel *subTitleLabel = [[UILabel alloc] init];
    subTitleLabel.text = @"Loaded by second view controller";
    subTitleLabel.font = [UIFont systemFontOfSize:20.0f];
    subTitleLabel.textColor = [UIColor blueColor];
    subTitleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:subTitleLabel];
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    subTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSDictionary *views = NSDictionaryOfVariableBindings(titleLabel,subTitleLabel);
    
    NSLayoutConstraint *titleLabelCentreY = [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0];
    
    NSArray *titleLabelLT30 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[titleLabel]-30-|" options:0 metrics:0 views:views];
    
    NSArray *titleLabelHeight44 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[titleLabel(==44)]" options:0 metrics:0 views:views];
    
    NSArray *subTitleLabelLT30 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[subTitleLabel]-30-|" options:0 metrics:0 views:views];
    
    NSArray *subTitleLabelTop20AndHeight30 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[titleLabel]-20-[subTitleLabel(==44)]" options:0 metrics:0 views:views];
    
    [self.view addConstraint:titleLabelCentreY];
    [self.view addConstraints:titleLabelLT30];
    [self.view addConstraints:titleLabelHeight44];
    [self.view addConstraints:subTitleLabelLT30];
    [self.view addConstraints:subTitleLabelTop20AndHeight30];
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
