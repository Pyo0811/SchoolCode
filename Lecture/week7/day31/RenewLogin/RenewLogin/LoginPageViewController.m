//
//  LoginPageViewController.m
//  Login
//
//  Created by Sejin Peo on 2016. 6. 7..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "LoginPageViewController.h"
#import "SignUpPageViewController.h"
#import "MainViewController.m"

#import "DataCentre.h"


@interface LoginPageViewController()<UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UIView *mainSC;
// 강사님은 이거 스크롤뷰로 하셨는데 저는 연결이 안되네요..
@property (nonatomic, weak) IBOutlet UIView *contentsView;
@property (nonatomic, weak) IBOutlet UITextField *idTextField;
@property (nonatomic) IBOutlet UITextField *pwTextField;

@property (nonatomic, weak) UIView *myView;

@end

@implementation LoginPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



// 로그인 가능 여부 확인
- (BOOL)isCheckLoginWithID:(NSString *)userID userPW:(NSString *)userPW
{
    if(userID.length > 0 && userPW.length > 0){
        if([[DataCentre sharedManager] haveUserID:userID userPW:userPW]){
            // 로그인 가능
            return YES;
        }else{
            // 존재 하지 않는 ID이거나 PW가 잘못 됬음
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"LOGIN FAIL" message:@"로그인 실패 했습니다. 계정 정보를 확인해주세요" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];
            
            return NO;
        }
    }
    
    return NO;
}




/*****************************************
            segue congtorl
 ****************************************/
//세그로 이동전 이동을 허용할 것인가 확인
/*
 로그인 화면으로 이동시 : 로그인 여부 확인
 회원가입 화면으로 이동시 : 바로 이동
 */

// 어디서 상속받는건지..
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    if([identifier isEqualToString:@"LOGIN_TO_MAIN"]){
        
        // 로그인 가능 여부 확인
        if ([self isCheckLoginWithID:self.idTextField.text userPW:self.pwTextField.text]){
            return YES;
        }else{
            return NO;
        }
    }else{
        return YES;
    }
}

//이동이 정해진 후
/*
 메인 화면으로 이동시 메인 객체에 id전달~
 */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"LOGIN_TO_MAIN"]){
        //destinationViewController 는 어떤건가요?
        MainViewController *mainVC = [segue destinationViewController];
        
        [mainVC setUserID:self.idTextField.text];
        [[DataCentre sharedManager] setUseAutoLogin:YES];
        
    }
}

/************************************
        UITextFieldDelgate
 ***********************************/

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    //scrollView up animation 스크롤 뷰가 아니라 에러남..
    //[self.mainSC setContentOffset:CGPointMake(0, 30) animated:YES];
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"END Editting");
    //[self.mainSC setContentOffset:CGPointMake(0, 30) animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    LOGIN_TEXTFIELD_TYPE type = textField.tag;
    switch(type){
        case LOGIN_TEXTFIELD_TYPE_ID :
            // ID텍스트 필드에서 return key클릭시 호출 구문
            [self.idTextField becomeFirstResponder];
            break;
        case LOGIN_TEXTFIELD_TYPE_PW :
            // PW텍스트 필드에서 return key클릭시 호출 구문
            [self.pwTextField becomeFirstResponder];
            break;
        default :
            break;
    }
    return YES;
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
