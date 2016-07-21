//
//  ViewController.m
//  SingletonTest
//
//  Created by Sejin Peo on 2016. 6. 2..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "ViewController.h"
#import "DataCentre.h"

@interface ViewController ()

@property (nonatomic,weak) IBOutlet UITextField *nameTF;

@end

@implementation ViewController

-(IBAction)onTouchUpInsideOK:(id)sender{
    
    NSLog(@"----------여기는 ViewController Action입니다. -----------");
    [[DataCentre sharedInstance] setName:self.nameTF.text];
    [[DataCentre sharedInstance] printData];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"----------여기는 viewWillAppear입니다. -----------");
    [[DataCentre sharedInstance] printData];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
