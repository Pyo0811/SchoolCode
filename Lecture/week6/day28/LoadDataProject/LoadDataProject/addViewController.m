//
//  addViewController.m
//  LoadDataProject
//
//  Created by Sejin Peo on 2016. 6. 2..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import "addViewController.h"
#import "DataCentre.h"

@interface addViewController ()

@property (nonatomic, weak) IBOutlet UITextField *nameTF;
@property (nonatomic, weak) IBOutlet UITextField *phoneTF;

@end

@implementation addViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)okBtn:(id)sender
{
    [[DataCentre sharedInstance] addFriendInfo:self.nameTF.text phone:self.phoneTF.text];
    [self.navigationController popViewControllerAnimated:YES];
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
