//
//  FourthItemViewController.m
//  TabbarControllerExample
//
//  Created by Sejin Peo on 2016. 6. 14..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "FourthItemViewController.h"
#import "DataCentre.h"

@interface FourthItemViewController ()

@property (nonatomic,strong) DataCentre *dataCentre;

@end

@implementation FourthItemViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, 130, 300)];
    self.label.numberOfLines = 0;
    self.dataCentre = [DataCentre defaultData];
    if(self.dataCentre.tempData == nil){
        self.label.text = @"코딩노예";
    }else{
        self.label.text = self.dataCentre.tempData;
    }
    [self.view addSubview:self.label];
    
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
