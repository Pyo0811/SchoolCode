//
//  ViewController.m
//  UITest
//
//  Created by Sejin Peo on 2016. 5. 24..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    const CGFloat VIEW_HALF_WIDTH = self.view.frame.size.width/2;
    
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0,0, VIEW_HALF_WIDTH, self.view.frame.size.height)];
    //UIColor *color = [[UIColor alloc] initWithRed:255/255 green:100/255 blue:150/255 alpha:1];
    // 0~1 에서까지 설정 가능
    [leftView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:leftView];
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0,0, VIEW_HALF_WIDTH, VIEW_HALF_WIDTH)];
    [topView setBackgroundColor:[UIColor blueColor]];
    [leftView addSubview:topView];
    
    
    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(VIEW_HALF_WIDTH,0, VIEW_HALF_WIDTH, self.view.frame.size.height)];
    [rightView setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:rightView];
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0,rightView.frame.size.height-VIEW_HALF_WIDTH, VIEW_HALF_WIDTH, VIEW_HALF_WIDTH)];
    [bottomView setBackgroundColor:[UIColor redColor]];
    [rightView addSubview:bottomView];
     
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
