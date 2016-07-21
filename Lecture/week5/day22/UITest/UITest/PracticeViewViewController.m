//
//  PracticeViewViewController.m
//  UITest
//
//  Created by Sejin Peo on 2016. 5. 24..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "PracticeViewViewController.h"

@interface PracticeViewViewController ()

@end

@implementation PracticeViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    const CGFloat margin = 20;
    
    UIView *firstView = [[UIView alloc]initWithFrame:CGRectMake(margin, margin, self.view.frame.size.width-margin*2, self.view.frame.size.height-margin*2)];
    [firstView setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:firstView];
    
    UIView *secondView = [[UIView alloc]initWithFrame:CGRectMake(margin,margin, self.view.frame.size.width-margin*4, self.view.frame.size.height-margin*4)];
    [secondView setBackgroundColor:[UIColor yellowColor]];
    [firstView addSubview:secondView];
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
