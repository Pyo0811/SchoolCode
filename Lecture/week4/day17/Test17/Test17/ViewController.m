//
//  ViewController.m
//  Test17
//
//  Created by Sejin Peo on 2016. 5. 17..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "ViewController.h"
#import "MyTestClass.h"


@interface ViewController ()

@end

@implementation ViewController
/*
- (void)viewDidLoad {
   
    
    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
 
    MyTestClass *testObject = [[MyTestClass alloc] init];
    // viewDidLoad 메소드가 끝나느 시점에 testObject가 메모리에서 해제됨
    
    NSLog(@"Break!!");
    
    NSLog(@"viewDidLoad will finish");
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
*/

-(void)loadView{
    [super loadView];
    
    NSLog(@"First View Controller loadView");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"First View Controller viewDidLoad");
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSLog(@"First View Controller viewWillAppear");
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    NSLog(@"First View Controller viewWillLayoutSubView");
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    NSLog(@"First View Controller viewDidLayoutSubviews");
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    NSLog(@"First View Controller viewDidAppear");
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    NSLog(@"First View Controller viewWillDisappear");
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    NSLog(@"First View Controller viewDidDisappear");
}
@end
