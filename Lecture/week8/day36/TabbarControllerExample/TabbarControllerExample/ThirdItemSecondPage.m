//
//  ThirdItemSecondPage.m
//  TabbarControllerExample
//
//  Created by Sejin Peo on 2016. 6. 14..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "ThirdItemSecondPage.h"
#import "ThirdItemViewController.h"
#import "DataCentre.h"

@interface ThirdItemSecondPage ()

@property (nonatomic,strong) DataCentre *dataCentre;

@end

@implementation ThirdItemSecondPage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:NO];
    self.dataCentre = [DataCentre defaultData];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, 130, 300)];
    self.label.numberOfLines = 0;
    if(self.dataCentre.tempData == nil){
        self.label.text = @"코딩노예";
    }else{
        self.label.text = self.dataCentre.tempData;
    }
    //self.label.text = self.label.text;
    [self.view addSubview:self.label];
    
    
//    NSArray *viewControllers = self.navigationController.viewControllers;
//    ThirdItemViewController *third = viewControllers.firstObject;
//    self.label.text = third.label.text;
    
    
    
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
