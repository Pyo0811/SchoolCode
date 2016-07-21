//
//  SecondVC.m
//  SingletonTest
//
//  Created by Sejin Peo on 2016. 6. 2..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "SecondVC.h"
#import "DataCentre.h"

@interface SecondVC ()

@property (nonatomic,weak) IBOutlet UITextField *ageTF;

@end

@implementation SecondVC

-(IBAction)onTouchUpInsideOK:(id)sender{
    
    NSLog(@"------------여기는 SecondVC Action입니다. ----------------");
    [[DataCentre sharedInstance] setAge:self.ageTF.text.integerValue];
    [[DataCentre sharedInstance] printData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
