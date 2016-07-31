//
//  LoginPageViewController.m
//  Login
//
//  Created by Sejin Peo on 2016. 6. 14..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "LoginPageViewController.h"
#import "RequestObject.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>


 #define IS_IPHONE4 ([[UIScreen mainScreen] bounds].size.width == 480 || [[UIScreen mainScreen] bounds].size.height == 480)
 #define IS_IPHONE5 ([[UIScreen mainScreen] bounds].size.width == 568 || [[UIScreen mainScreen] bounds].size.height == 568)
 #define IS_IPHONE6 ([[UIScreen mainScreen] bounds].size.width == 667 || [[UIScreen mainScreen] bounds].size.height == 667)

@interface LoginPageViewController () <UITextFieldDelegate,FBSDKLoginButtonDelegate>

@property (nonatomic,weak) UIView *loginView;
@property (nonatomic,weak) UITextField *idText;
@property (nonatomic,weak) UITextField *pwText;
@property (nonatomic, strong) NSLayoutConstraint *bottomConstraint;
@property (nonatomic) UIInterfaceOrientation interfaceOrientation;
@property (nonatomic,weak) FBSDKLoginButton *loginWithFBButton;

@end

@implementation LoginPageViewController

// set remove navigation bar always
- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createMainView];
    [self addInsideLoginView];
    self.interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    // notification from RequestObject login success -> successLogin excute
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(successLogin) name:@"LoginSuccess" object:nil];
    
    // notification from RequestObject login fail -> failLogin excute
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(failLogin) name:@"LoginFail" object:nil];
    
    if ([FBSDKAccessToken currentAccessToken] == nil) {
        // User is logged in, do work such as go to next view controller.
        NSLog(@"user has not loged in");
    }else{
        NSLog(@"user has loged in");
    }
    
    //[[RequestObject sharedInstance] daechung];
/*
#ifdef DEBUG
    NSLog(@"DEBUG MODE");
    self.idText.text = @"sooljotta2@sooljotta.com";
    self.pwText.text = @"sooljotta2";
    
#endif
*/
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// These will be on main View
- (void)createMainView{
    
    // background image on main view
    UIImageView *backGroundImage = [[UIImageView alloc] init];
    [backGroundImage setImage:[UIImage imageNamed:@"wallpaper1.jpeg"]];
    [backGroundImage setContentMode:UIViewContentModeScaleToFill];
    [self.view addSubview:backGroundImage];
    
    // title label on main view
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"Join to Pokemon world!";
    titleLabel.font = [UIFont systemFontOfSize:25.0f];
    titleLabel.textColor = [UIColor blueColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
    
    // stack view on main view
    UIView *loginView = [[UIView alloc] init];
    [loginView setBackgroundColor:[UIColor colorWithRed:107.0f/255.0f green:102.0f/255.0f blue:255.0f/255.0f alpha:0.4f]];
    loginView.layer.cornerRadius = 5.0f;
    [self.view addSubview:loginView];
    self.loginView = loginView;
    
    
    // Main view Autolayout part (using with visual format language)
    {
        backGroundImage.translatesAutoresizingMaskIntoConstraints = NO;
        titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        loginView.translatesAutoresizingMaskIntoConstraints = NO;
        
        
        NSDictionary *views = NSDictionaryOfVariableBindings(backGroundImage,titleLabel,loginView);
        
        // backGroundImage Width Constraint(0)
        NSArray *bgImgWidthConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[backGroundImage]|" options:0 metrics:0 views:views];
        
        // backGroundImage Height Constraint(0)
        NSArray *bgImgHeightConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[backGroundImage]|" options:0 metrics:0 views:views];
        
        // titleLabel Top 80 from superView
        NSArray *titleLabelTop80 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(<=100)-[titleLabel]-40-[loginView(==200)]" options:0 metrics:0 views:views];
        
        // titleLabel Leading 30 and Trailing 30
        NSArray *titleLabelLT30 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[titleLabel]-30-|" options:0 metrics:0 views:views];
        
        
        // stackView1 Leading 30 and Trailing 30
        NSArray *stackView1LT30 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=30,<=50)-[loginView]-(>=30,<=50)-|" options:0 metrics:0 views:views];
        
        [self.view addConstraints:bgImgWidthConstraint];
        [self.view addConstraints:bgImgHeightConstraint];
        [self.view addConstraints:titleLabelTop80];
        [self.view addConstraints:titleLabelLT30];
        //[self.view addConstraints:stackView1Top40];
        [self.view addConstraints:stackView1LT30];
    }
    
    
    // View moving up when keyboard appears by each devices (Iphone4,Iphone5,Iphone6)
    {
        // when your devices is Iphone4 or Iphone4s
        if(IS_IPHONE4){
            
        self.bottomConstraint = [NSLayoutConstraint constraintWithItem:loginView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.bottomLayoutGuide attribute:NSLayoutAttributeTop multiplier:1 constant:-150];
        [self.view addConstraint:self.bottomConstraint];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
            
        // when your devices is Iphone5 or Iphone5s
        }else if(IS_IPHONE5){
            
            self.bottomConstraint = [NSLayoutConstraint constraintWithItem:loginView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.bottomLayoutGuide attribute:NSLayoutAttributeTop multiplier:1 constant:-200];
            [self.view addConstraint:self.bottomConstraint];
            
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
          
        }
        
        // when your devices is Iphone6 or Iphone6s
        else if(IS_IPHONE6){
            
            self.bottomConstraint = [NSLayoutConstraint constraintWithItem:loginView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.bottomLayoutGuide attribute:NSLayoutAttributeTop multiplier:1 constant:-250];
            [self.view addConstraint:self.bottomConstraint];
            
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        }
    }
}

// These will be on LoginView
- (void)addInsideLoginView{
    
    // create ID label
    UILabel *idLabel = [[UILabel alloc] init];
    idLabel.text = @"ID   : ";
    idLabel.textColor = [UIColor whiteColor];
    idLabel.font = [UIFont systemFontOfSize:20.0f];
    [self.loginView addSubview:idLabel];
    
    // create ID textfield
    UITextField *idText = [[UITextField alloc] init];
    idText.borderStyle = UITextBorderStyleRoundedRect;
    idText.delegate = self;
    [self.loginView addSubview:idText];
    self.idText = idText;
    
    // create Password label
    UILabel *pwLabel = [[UILabel alloc] init];
    pwLabel.text = @"PW : ";
    pwLabel.textColor = [UIColor whiteColor];
    pwLabel.font = [UIFont systemFontOfSize:20.0f];
    [self.loginView addSubview:pwLabel];
    
    // create Password textfield
    UITextField *pwText = [[UITextField alloc] init];
    pwText.borderStyle = UITextBorderStyleRoundedRect;
    pwText.secureTextEntry = YES;
    pwText.delegate = self;
    [self.loginView addSubview:pwText];
    self.pwText = pwText;
    
    // create login button
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginButton setTitle:@"LOG IN" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(goToMainPage:) forControlEvents:UIControlEventTouchUpInside];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    [loginButton setBackgroundImage:[UIImage imageNamed:@"buttonImage1.png"] forState:UIControlStateNormal];
    loginButton.userInteractionEnabled = YES;
    [self.loginView addSubview:loginButton];
    //self.signUpButton = loginButton;
    
    // create sign up button
    UIButton *signUpButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [signUpButton setTitle:@"SIGN UP" forState:UIControlStateNormal];
    [signUpButton addTarget:self action:@selector(goToRegisterPage:) forControlEvents:UIControlEventTouchUpInside];
    [signUpButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [signUpButton setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    [signUpButton setBackgroundImage:[UIImage imageNamed:@"buttonImage1.png"] forState:UIControlStateNormal];
    signUpButton.userInteractionEnabled = YES;
    [self.loginView addSubview:signUpButton];
    //self.registeButton = registeButton;
    
    // create Login with Facebook button
    FBSDKLoginButton *loginWithFBButton = [[FBSDKLoginButton alloc] init];
    loginWithFBButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    loginWithFBButton.delegate = self;
    loginWithFBButton.center = self.loginView.center;
    [loginWithFBButton addTarget:self action:@selector(loginWithFB:) forControlEvents:UIControlEventTouchUpInside];
    [loginWithFBButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    loginWithFBButton.userInteractionEnabled = YES;
    [self.loginView addSubview:loginWithFBButton];
    self.loginWithFBButton = loginWithFBButton;
    
    // Stack View(LoginView) Autolayout part (using with visual format language)
    {
        NSDictionary *views = NSDictionaryOfVariableBindings(idLabel,idText,pwLabel,pwText,loginButton,signUpButton,loginWithFBButton);
        
        
        idLabel.translatesAutoresizingMaskIntoConstraints = NO;
        idText.translatesAutoresizingMaskIntoConstraints = NO;
        pwLabel.translatesAutoresizingMaskIntoConstraints = NO;
        pwText.translatesAutoresizingMaskIntoConstraints = NO;
        loginButton.translatesAutoresizingMaskIntoConstraints = NO;
        signUpButton.translatesAutoresizingMaskIntoConstraints = NO;
        loginWithFBButton.translatesAutoresizingMaskIntoConstraints = NO;
        
        // NSLayoutFormatAlignAllTop option is to prevent duplicate of verticalizing ID textfield
        NSArray *horizontalID = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[idLabel]-[idText(>=80)]-20-|" options:NSLayoutFormatAlignAllTop metrics:0 views:views];
        
        NSArray *verticalLabel = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[idLabel(==40)]-7-[pwLabel(==idLabel)]" options:0 metrics:0 views:views];
        
        // NSLayoutFormatAlignAllTop option is to prevent duplicate of verticalizing PW textfield
        NSArray *horizontalPW = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[pwLabel]-[pwText(>=80)]-20-|" options:NSLayoutFormatAlignAllTop metrics:0 views:views];
        
        // NSLayoutFormatAlignAllBottom | NSLayoutFormatAlignAllTop options are to prevent duplicate of signUpButton
        NSArray *horizontalFBButton = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[loginWithFBButton]-20-|" options:0 metrics:0 views:views];
        NSArray *horizontalButton = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[loginButton]-10-[signUpButton(==loginButton)]-20-|" options:NSLayoutFormatAlignAllBottom | NSLayoutFormatAlignAllTop metrics:0 views:views];
        NSArray *verticalButton = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[signUpButton(==40)]-5-[loginWithFBButton(==signUpButton)]-10-|" options:0 metrics:0 views:views];
        
        [self.loginView addConstraints:horizontalID];
        [self.loginView addConstraints:verticalLabel];
        [self.loginView addConstraints:horizontalPW];
        [self.loginView addConstraints:horizontalFBButton];
        [self.loginView addConstraints:horizontalButton];
        [self.loginView addConstraints:verticalButton];
    }
}

// when you click return on keyboard, it will be disappeared
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

// when you touch the any where, keyboard will be disappeared with using Tab gesture
- (IBAction)keyboardRemove:(id)sender{
    [self.idText endEditing:YES];
    [self.pwText endEditing:YES];
}

#pragma Button Action (loginButton,signUpButton,loginWithFBButton)

- (void)goToMainPage:(id)sender{
    
    NSString *userID = self.idText.text;
    NSString *userPW = self.pwText.text;
    
    if(self.idText.text.length == 0 ){
        // if you don't fill in id
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"로그인 실패" message:@"아이디를 입력해주세요" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];
    }else if(self.pwText.text.length == 0){
        // if you don't fill in password
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"로그인 실패" message:@"비밀번호를 입력해주세요" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];
        
    }else{
        
        [[RequestObject sharedInstance] requestLoginSession:userID password:userPW];
       
    }
}

// excuted from notification when login is succeded
-(void) successLogin{
    
    [self performSegueWithIdentifier:@"LOGIN_TO_MAIN" sender:nil];
    
}

// excuted from notification when login is failed
-(void) failLogin{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"로그인 실패" message:@"아이디와 비밀번호를 다시 확인해주세요" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}


// Facebook login button action
- (void)loginWithFB:(id)sender{
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    
    [login logInWithReadPermissions: @[@"public_profile"]
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             NSLog(@"Logged in");
             [self performSegueWithIdentifier:@"LOGIN_TO_MAIN" sender:nil];
         }
     }];
}


// go to page sign up
- (void)goToRegisterPage:(id)sender{
    [self performSegueWithIdentifier:@"LOGIN_TO_REGISTER" sender:sender];
}


#pragma mark - Notification Handlers <UITextFieldDelegate>

- (void)keyboardWillShow:(NSNotification *)sender {

    CGRect frame = [sender.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGRect newFrame = [self.view convertRect:frame fromView:[[UIApplication sharedApplication] delegate].window];
    self.bottomConstraint.constant = newFrame.origin.y - CGRectGetHeight(self.view.frame);
    [self.view layoutIfNeeded];
    
    
}


- (void)keyboardWillHide:(NSNotification *)sender {
    
    
    if(IS_IPHONE4){
    self.bottomConstraint.constant = -150;
    }else if(IS_IPHONE5){
        self.bottomConstraint.constant = -200;
    }else if(IS_IPHONE6){
        self.bottomConstraint.constant = -250;
    }
    [self.view layoutIfNeeded];

}


#pragma mark - Notification Handlers <FBSDKLoginButtonDelegate>

- (void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error{
    
    if(error == nil){
        NSLog(@"Login success!!");
        [self performSegueWithIdentifier:@"LOGIN_TO_MAIN" sender:nil];
    }else{
        NSLog(@"Error has occured !!! %@",error.localizedDescription);
    }
    
}

- (void) loginButtonDidLogOut:(FBSDKLoginButton *)loginButton{
    
    NSLog(@"Facebook log out!!");
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
