//
//  ThirdItemModalView.m
//  TabbarControllerExample
//
//  Created by Sejin Peo on 2016. 6. 14..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "ThirdItemModalView.h"
#import "ThirdItemViewController.h"

@interface ThirdItemModalView ()

@end

@implementation ThirdItemModalView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    [self.view setBackgroundColor:[UIColor yellowColor]];
    [self createButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)createButton{
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = (CGRectMake(20, 40, 100, 30));
    [backButton setTitle:@"이전 화면" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [backButton addTarget:self action:@selector(goToBackPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
}

- (void)goToBackPage{
//    UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    ThirdItemViewController *third = [main instantiateViewControllerWithIdentifier:@"ThirdItemViewController"];
//    [self.navigationController pushViewController:third animated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
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
