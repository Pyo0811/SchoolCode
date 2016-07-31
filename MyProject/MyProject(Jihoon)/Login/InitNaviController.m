//
//  InitNaviController.m
//  MyProject
//
//  Created by Sejin Peo on 2016. 7. 19..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "InitNaviController.h"
#import "LoginPageViewController.h"
#import "MainCollectionViewController.h"

@interface InitNaviController ()

@end

@implementation InitNaviController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"dfgdfgdxfdfgdg");
    //네트워크로 토큰값 보내는 코드
    
    /*
    UISegmentedControl *segue = [[UISegmentedControl alloc]init];
    [segue ident];
    [segue.identifier isEqualToString:@"MySegueMain"]];
    
    [self prepareForSegue:@"toMainByToken" sender:self];
     */
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)branchingPage{
    id tokenValue = [[NSUserDefaults standardUserDefaults] objectForKey:@"LoginTokenValue"];
    
    
    NSLog(@"id tokenValue = %@",tokenValue);
    
    if(tokenValue != nil){
        UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        MainCollectionViewController *goToMainPage = [main instantiateViewControllerWithIdentifier:@"FirstSegue"];
        [self.navigationController pushViewController:goToMainPage animated:YES];
    }else if(tokenValue == nil){
        UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LoginPageViewController *goToLoginPage = [main instantiateViewControllerWithIdentifier:@"LogInPage"];
        [self.navigationController pushViewController:goToLoginPage animated:YES];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    

    // NSUserDefault에 저장했던 토큰값을 불러오기
    
    if(tokenValue!=nil){
     
     // 토큰값이 맞으면 바로 메인페이지로
     [self performSegueWithIdentifier:@"toMainByToken" sender:sender];
 }else{
     
     // 토큰값이 다르면 로그인 페이지로
     UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     LoginPageViewController *goToLogInPage = [main instantiateViewControllerWithIdentifier:@"LogInPage"];
     [self.navigationController pushViewController:goToLogInPage animated:YES];
 }
 
 
 // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
