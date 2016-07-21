//
//  SignupPageViewController.m
//  LoginTestProject
//
//  Created by youngmin joo on 2016. 5. 17..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import "SignupPageViewController.h"
#import "MainViewController.h"
#import "DataCenter.h"

@interface SignupPageViewController () <UITextFieldDelegate>
@property (nonatomic, weak) IBOutlet UIScrollView *mainSC;
@property (nonatomic, weak) IBOutlet UIView *contentsView;
@property (nonatomic, weak) IBOutlet UITextField *idTextField;
@property (nonatomic, weak) IBOutlet UITextField *pwTextField;
@property (nonatomic, weak) IBOutlet UITextField *repwTextField;

@end

@implementation SignupPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//회원가입
/*
 회원가입 성공시  YES
 실패시 실패 원인 알럿
 */
- (BOOL)requestSignUpWithID:(NSString *)userID pw:(NSString *)userPW reEnter:(NSString *)rePW
{
    //작성 확인
    if (userID.length > 0 && userPW.length > 0 && rePW.length > 0) {
        //페스워드 매칭
        if ([userPW isEqualToString:rePW]) {
            //가입
            if ([[DataCenter sharedManager] joinUserID:userID userPW:userPW]) {
                //회원 가입 완료
                
                return YES;
            }else
            {//회원 가입 실패 (이미 존재하는 회원)
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@" EXSIST USER" message:@"이미 등록된 회원 ID입니다." preferredStyle: UIAlertControllerStyleAlert];
                UIAlertAction *ok = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleCancel handler:nil];
                [alert addAction:ok];
                [self presentViewController:alert animated:YES completion:nil];
                return NO;
            };
            
            
        }else
        {
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"MISS MATCH" message:@"비밀번호 확인이 틀렸습니다." preferredStyle: UIAlertControllerStyleAlert];
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
/*
 회원가입 요청 확인 후 가입 확인시 메인화면으로 이동
 */

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([identifier isEqualToString:@"SIGN_TO_MAIN"]) {
        
        if ([self requestSignUpWithID:self.idTextField.text pw:self.pwTextField.text reEnter:self.repwTextField.text]) {
            return YES;
        }else
        {
            return NO;
        }
    }else
    {
        return NO;
    }
    
}

//이동이 정해진 후
/*
 메인 화면으로 이동시  메인 객체에 id전달~
 */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"SIGN_TO_MAIN"])
    {
        MainViewController *mainVC = [segue destinationViewController];
        //함수 호출을 통한 데이터 전달
        [mainVC setUserID:self.idTextField.text];
        [[DataCenter sharedManager] setUseAutoLogin:YES];
    }
}

- (IBAction)popViewController:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"END Editting");
    [self.mainSC setContentOffset:CGPointMake(0, 0) animated:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    SIGNUP_TEXTFIELD_TYPE type = textField.tag;
    switch (type) {
        case SIGNUP_TEXTFIELD_TYPE_ID:
            //ID텍스트 필드에서 return key클릭시 호출 구문
            [self.pwTextField becomeFirstResponder];
            break;
        case SIGNUP_TEXTFIELD_TYPE_PW:
            //PW텍스트 필드에서 return key클릭시 호출 구문
            [self.repwTextField becomeFirstResponder];
            break;
        case SIGNUP_TEXTFIELD_TYPE_REPW:
            //PW텍스트 필드에서 return key클릭시 호출 구문
            [textField resignFirstResponder];
            break;
        default:
            break;
    }
    
    return YES;
}

@end
