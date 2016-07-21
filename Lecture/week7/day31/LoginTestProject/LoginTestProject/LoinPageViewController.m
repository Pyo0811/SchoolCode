//
//  ViewController.m
//  LoginTestProject
//
//  Created by youngmin joo on 2016. 5. 16..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import "LoinPageViewController.h"
#import "SignupPageViewController.h"
#import "MainViewController.h"

#import "DataCenter.h"

@interface LoinPageViewController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UIScrollView *mainSC;
@property (nonatomic, weak) IBOutlet UIView *contentsView;
@property (nonatomic, weak) IBOutlet UITextField *idTextField;
@property (nonatomic) IBOutlet UITextField *pwTextField;

@property (nonatomic, weak) UIView *myView;

@end

@implementation LoinPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//로그인 가능 여부 확인
- (BOOL)isCheckLoginWithID:(NSString *)userID userPW:(NSString *)userPW
{
    if (userID.length > 0 && userPW.length > 0) {
        if([[DataCenter sharedManager] haveUserID:userID userPW:userPW]){//로그인 가능
            return YES;
        }else{//존재 하지 않는 ID이거나 PW가 잘못 됬음
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"LOGIN FAIL" message:@"로그인 실패 했습니다. 계정 정보를 확인해주세요" preferredStyle: UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];
            
            return NO;
        }
    }
    
    return NO;
    
}



/****************************************
         segue congtrol
 ****************************************/
//세그로 이동전 이동을 허용할 것인가 확인
/*
 로그인 화면으로 이동시 : 로그인 여부 확인
 회원가입 화면으로 이동시 : 바로 이동
 */
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([identifier isEqualToString:@"LOGIN_TO_MAIN"]) {
        
        //로그인 가능 여부 확인
        if ([self isCheckLoginWithID:self.idTextField.text userPW:self.pwTextField.text]) {
            return YES;
        }else
        {
            return NO;
        }
    }else
    {
        return YES;
    }
    
}

//이동이 정해진 후
/*
 메인 화면으로 이동시  메인 객체에 id전달~
 */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"LOGIN_TO_MAIN"])
    {
        MainViewController *mainVC = [segue destinationViewController];
        //함수 호출을 통한 데이터 전달
        [mainVC setUserID:self.idTextField.text];
        [[DataCenter sharedManager] setUseAutoLogin:YES];
    }
}


/****************************************
              UITextFieldDelegate
 ****************************************/

#pragma mark -
#pragma mark UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    //scrollView up animation
    [self.mainSC setContentOffset:CGPointMake(0, 30) animated:YES];
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"END Editting");
    [self.mainSC setContentOffset:CGPointMake(0, 0) animated:YES];
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    LOGIN_TEXTFIELD_TYPE type = textField.tag;
    switch (type) {
        case LOGIN_TEXTFIELD_TYPE_ID:
            //ID텍스트 필드에서 return key클릭시 호출 구문
            [self.pwTextField becomeFirstResponder];
            break;
        case LOGIN_TEXTFIELD_TYPE_PW:
            //PW텍스트 필드에서 return key클릭시 호출 구문
            [textField resignFirstResponder];
            break;
        default:
            break;
    }
    return YES;
}

@end



