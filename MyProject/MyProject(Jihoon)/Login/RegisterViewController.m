//
//  SignUpPageViewController.m
//  Login
//
//  Created by Jihoon Peo on 2016. 6. 14..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "RegisterViewController.h"
#import <AVFoundation/AVAudioPlayer.h>

#define IS_IPHONE4 ([[UIScreen mainScreen] bounds].size.width == 480 || [[UIScreen mainScreen] bounds].size.height == 480)
#define IS_IPHONE5 ([[UIScreen mainScreen] bounds].size.width == 568 || [[UIScreen mainScreen] bounds].size.height == 568)
#define IS_IPHONE6 ([[UIScreen mainScreen] bounds].size.width == 667 || [[UIScreen mainScreen] bounds].size.height == 667)

@interface RegisterViewController () <UITextFieldDelegate>

@property (nonatomic, weak) UIView *registerView;
@property (nonatomic, weak) UITextField *idText;
@property (nonatomic, weak) UITextField *pwText;
@property (nonatomic, weak) UITextField *rePwText;
@property (nonatomic, strong) NSLayoutConstraint *bottomConstraint;
@property (nonatomic, strong) AVAudioPlayer *player;

@end

@implementation RegisterViewController

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createMainView];
    [self addInsideRegisterView];
    [self backGroundBGM];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backGroundBGM{
    // 파일 저장
    NSString *string = [NSString stringWithFormat:@"%@/Pokemon_Elite_of_4.mp3", [[NSBundle mainBundle] resourcePath]];
    NSURL *url = [NSURL fileURLWithPath:string];
    
    // 인스턴스 생성
     self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    
}

- (void)playBackGroundBGM{
    if([self.player isPlaying]== NO){
        [self.player play];
        NSLog(@"music is playing");
    }else{
        [self.player stop];
        NSLog(@"music is stopped");
    }
    
}

// These will be on main View
- (void)createMainView{
    
    // background image on main view
    UIImageView *backGroundImage = [[UIImageView alloc] init];
    [backGroundImage setImage:[UIImage imageNamed:@"wallpaper2.jpeg"]];
    [backGroundImage setContentMode:UIViewContentModeScaleToFill];
    [self.view addSubview:backGroundImage];
    
    // BGM player
    UIButton *playBGMButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [playBGMButton setTitle:@"Play music" forState:UIControlStateNormal];
    [playBGMButton setFrame:CGRectMake(120, 40, 150, 44)];
    [playBGMButton addTarget:self action:@selector(playBackGroundBGM) forControlEvents:UIControlEventTouchUpInside];
    [playBGMButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [playBGMButton setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    [self.view addSubview:playBGMButton];
    
    // title label on main view
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"wanna be a trainer?";
    titleLabel.font = [UIFont systemFontOfSize:25.0f];
    titleLabel.textColor = [UIColor redColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
    
    // stack view on main view
    UIView *registerView = [[UIView alloc] init];
    [registerView setBackgroundColor:[UIColor colorWithRed:204.0f/255.0f green:114.0f/255.0f blue:61.0f/255.0f alpha:0.4f]];
    registerView.layer.cornerRadius = 5.0f;
    [self.view addSubview:registerView];
    self.registerView = registerView;
    
    // Main view Autolayout part (using with visual format language)
    {
        backGroundImage.translatesAutoresizingMaskIntoConstraints = NO;
        titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        registerView.translatesAutoresizingMaskIntoConstraints = NO;
        
        
        NSDictionary *views = NSDictionaryOfVariableBindings(backGroundImage,titleLabel,registerView);
        
        // backGroundImage Width Constraint(0)
        NSArray *bgImgWidthConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[backGroundImage]|" options:0 metrics:0 views:views];
        
        // backGroundImage Height Constraint(0)
        NSArray *bgImgHeightConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[backGroundImage]|" options:0 metrics:0 views:views];
        
        // titleLabel Top 80 from superView
        NSArray *titleLabelTop80 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(<=100)-[titleLabel]-40-[registerView(==200)]" options:0 metrics:0 views:views];
        
        // titleLabel Leading 30 and Trailing 30
        NSArray *titleLabelLT30 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[titleLabel]-30-|" options:0 metrics:0 views:views];
        
        
        // stackView1 Leading 30 and Trailing 30
        NSArray *stackView1LT20 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=20,<=40)-[registerView]-(>=20,<=40)-|" options:0 metrics:0 views:views];
        
        [self.view addConstraints:bgImgWidthConstraint];
        [self.view addConstraints:bgImgHeightConstraint];
        [self.view addConstraints:titleLabelTop80];
        [self.view addConstraints:titleLabelLT30];
        [self.view addConstraints:stackView1LT20];
        
    }
    
    // View moving up when keyboard appears by each devices (Iphone4,Iphone5,Iphone6)
    {
        // when your devices is Iphone4 or Iphone4s
        if(IS_IPHONE4){
            
            self.bottomConstraint = [NSLayoutConstraint constraintWithItem:registerView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.bottomLayoutGuide attribute:NSLayoutAttributeTop multiplier:1 constant:-150];
            [self.view addConstraint:self.bottomConstraint];
            
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
            
        // when your devices is Iphone5 or Iphone5s
        }else if(IS_IPHONE5){
            
            self.bottomConstraint = [NSLayoutConstraint constraintWithItem:registerView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.bottomLayoutGuide attribute:NSLayoutAttributeTop multiplier:1 constant:-200];
            [self.view addConstraint:self.bottomConstraint];
            
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
            
        }
        
        // when your devices is Iphone6 or Iphone6s
        else if(IS_IPHONE6){
            
            
            self.bottomConstraint = [NSLayoutConstraint constraintWithItem:registerView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.bottomLayoutGuide attribute:NSLayoutAttributeTop multiplier:1 constant:-250];
            [self.view addConstraint:self.bottomConstraint];
            
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        }
        
    }
}

// These will be on registerView
- (void)addInsideRegisterView{
    
    UILabel *idLabel = [[UILabel alloc] init];
    idLabel.text = @"ID   : ";
    idLabel.textColor = [UIColor whiteColor];
    idLabel.font = [UIFont systemFontOfSize:20.0f];
    [self.registerView addSubview:idLabel];
    
    UITextField *idText = [[UITextField alloc] init];
    idText.borderStyle = UITextBorderStyleRoundedRect;
    idText.delegate = self;
    [self.registerView addSubview:idText];
    self.idText = idText;
    
    
    UILabel *pwLabel = [[UILabel alloc] init];
    pwLabel.text = @"PW : ";
    pwLabel.textColor = [UIColor whiteColor];
    pwLabel.font = [UIFont systemFontOfSize:20.0f];
    [self.registerView addSubview:pwLabel];
    
    UITextField *pwText = [[UITextField alloc] init];
    pwText.borderStyle = UITextBorderStyleRoundedRect;
    pwText.secureTextEntry = YES;
    pwText.delegate = self;
    [self.registerView addSubview:pwText];
    self.pwText = pwText;
    
    UILabel *rePwLabel = [[UILabel alloc] init];
    rePwLabel.text = @"RE :  ";
    rePwLabel.textColor = [UIColor whiteColor];
    rePwLabel.font = [UIFont systemFontOfSize:20.0f];
    [self.registerView addSubview:rePwLabel];
    
    UITextField *rePwText = [[UITextField alloc] init];
    rePwText.borderStyle = UITextBorderStyleRoundedRect;
    rePwText.secureTextEntry = YES;
    rePwText.delegate = self;
    [self.registerView addSubview:rePwText];
    self.rePwText = rePwText;
    
    UIButton *okButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //[signUpButton setFrame:CGRectMake(40, 100, 70, 30)];
    // addTarget
    [okButton setTitle:@"SIGN IN" forState:UIControlStateNormal];
    [okButton addTarget:self action:@selector(goToMainPage:) forControlEvents:UIControlEventTouchUpInside];
    [okButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [okButton setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    [okButton setBackgroundImage:[UIImage imageNamed:@"buttonImage2.png"] forState:UIControlStateNormal];
    okButton.userInteractionEnabled = YES;
    [self.registerView addSubview:okButton];
    //self.signUpButton = signUpButton;
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButton setTitle:@"BACK" forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(goToLoginPage:) forControlEvents:UIControlEventTouchUpInside];
    [cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    [cancelButton setBackgroundImage:[UIImage imageNamed:@"buttonImage2.png"] forState:UIControlStateNormal];
    cancelButton.userInteractionEnabled = YES;
    [self.registerView addSubview:cancelButton];
    //self.registeButton = registeButton;
    
    {
        NSDictionary *views = NSDictionaryOfVariableBindings(idLabel,idText,pwLabel,pwText,rePwText,rePwLabel,okButton,cancelButton);
        
        idLabel.translatesAutoresizingMaskIntoConstraints = NO;
        idText.translatesAutoresizingMaskIntoConstraints = NO;
        pwLabel.translatesAutoresizingMaskIntoConstraints = NO;
        pwText.translatesAutoresizingMaskIntoConstraints = NO;
        rePwText.translatesAutoresizingMaskIntoConstraints = NO;
        rePwLabel.translatesAutoresizingMaskIntoConstraints = NO;
        okButton.translatesAutoresizingMaskIntoConstraints = NO;
        cancelButton.translatesAutoresizingMaskIntoConstraints = NO;
        
        NSArray *horizontalID = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[idLabel]-[idText(>=80)]-20-|" options:NSLayoutFormatAlignAllTop metrics:0 views:views];
        NSArray *horizontalPW = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[pwLabel]-[pwText(>=80)]-20-|" options:NSLayoutFormatAlignAllTop metrics:0 views:views];
        NSArray *horizontalRePW = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[rePwLabel]-[rePwText(>=80)]-20-|" options:NSLayoutFormatAlignAllTop metrics:0 views:views];
        NSArray *verticalLabel = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[idLabel(==40)]-7-[pwLabel(==idLabel)]-7-[rePwLabel(==pwLabel)]" options:0 metrics:0 views:views];
        
        NSArray *horizontalButton = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-60-[okButton]-10-[cancelButton(==okButton)]-50-|" options:NSLayoutFormatAlignAllBottom | NSLayoutFormatAlignAllTop metrics:0 views:views];
        NSArray *verticalButton = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[okButton(==40)]-|" options:0 metrics:0 views:views];
        
        [self.registerView addConstraints:horizontalID];
        [self.registerView addConstraints:horizontalPW];
        [self.registerView addConstraints:horizontalRePW];
        [self.registerView addConstraints:verticalLabel];
        [self.registerView addConstraints:horizontalButton];
        [self.registerView addConstraints:verticalButton];
        
    }
}

- (IBAction)keyboardRemove:(id)sender{
    
    [self.idText endEditing:YES];
    [self.pwText endEditing:YES];
    [self.rePwText endEditing:YES];
}

- (void)goToMainPage:(id)sender{
    
    NSString *pwValue = self.pwText.text;
    NSString *rePwValue = self.rePwText.text;

    if(self.idText.text.length == 0 ){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"회원가입 실패" message:@"아이디를 입력해주세요" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];
    }else if(self.pwText.text.length == 0){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"회원가입 실패" message:@"비밀번호를 입력해주세요" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];
    }else if(self.rePwText.text.length == 0){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"회원가입 실패" message:@"비밀번호 확인을 입력해주세요" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];
    }else if(pwValue.length < 4 || pwValue.length > 32){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"회원가입 실패" message:@"비밀번호는 4자에서 32자리까지 입력해주세요." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];
    }else if([pwValue isEqualToString:rePwValue] == NO){
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"회원가입 실패" message:@"두 비밀번호가 일치하지 않습니다." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        [self performSegueWithIdentifier:@"REGISTER_TO_MAIN" sender:sender];
    }
    
    
}

- (void)goToLoginPage:(id)sender{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - Notification Handlers

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


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
