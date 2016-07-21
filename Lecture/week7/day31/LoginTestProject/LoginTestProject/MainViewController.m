//
//  MainViewController.m
//  LoginTestProject
//
//  Created by youngmin joo on 2016. 5. 17..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import "MainViewController.h"
#import "DataCenter.h"
#import "AppDelegate.h"
#import "LoinPageViewController.h"

@interface MainViewController ()

@property (nonatomic, weak) IBOutlet UILabel *userIDLb;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    [self.userIDLb setText:[[DataCenter sharedManager] userID]];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setUserID:(NSString *)userID
{
    [[DataCenter sharedManager] setUserID:userID];
}

- (IBAction)logout:(id)sender
{
    
    [[DataCenter sharedManager] setUseAutoLogin:NO];
    
    LoinPageViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"LoinPageViewController"];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
    
    AppDelegate *aDelegate =  [[UIApplication sharedApplication] delegate];
    aDelegate.window.rootViewController = navi;
}

@end
