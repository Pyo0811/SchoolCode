//
//  MainViewController.m
//  Login
//
//  Created by Sejin Peo on 2016. 6. 7..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "MainViewController.h"
#import "DataCentre.h"
#import "AppDelegate.h"
#import "LoginPageViewController.h"

@interface MainViewController()

@property (nonatomic, weak) IBOutlet UILabel *userIDLb;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    // 이해가 안되네요ㅣ..
    [self.userIDLb setText:[[DataCentre sharedManager] userID]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUserID:(NSString *)userID{
    
    [[DataCentre sharedManager] setUserID:userID];
}

- (IBAction)logout:(id)sender{
    
    [[DataCentre sharedManager] setUseAutoLogin:NO];
    
    LoginPageViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginPageViewController"];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
    
    // 이것도 조금 이해 안되는부분이네요
    AppDelegate *aDelegate = [[UIApplication sharedApplication] delegate];
    aDelegate.window.rootViewController = navi;
}

@end
