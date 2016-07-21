//
//  ViewController.m
//  TestVC
//
//  Created by Sejin Peo on 2016. 5. 31..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "ViewController.h"
#import "ThirdViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)nextBtn:(id)sender{
    
    //객체 생성
    ThirdViewController *thirdVC = [[ThirdViewController alloc]init];
    [self.navigationController pushViewController:thirdVC animated:YES];
}

@end
