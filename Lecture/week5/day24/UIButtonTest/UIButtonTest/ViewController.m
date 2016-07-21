//
//  ViewController.m
//  UIButtonTest
//
//  Created by Sejin Peo on 2016. 5. 26..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) UIButton *btn1;
@property (nonatomic) UIButton *btn2;
@property (nonatomic) UIButton *btn3;
@property (nonatomic) UIButton *btn4;
@property (nonatomic) UILabel *buttonLabel1;
@property (nonatomic) UILabel *buttonLabel2;
@property (nonatomic, weak) UIButton *selectedBtn;


@end

@implementation ViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.btn1 =[UIButton buttonWithType:UIButtonTypeCustom];
    [self.btn1 setFrame:CGRectMake(30, 150, 100, 35)];
    self.btn1.tag = 1;
    [self.btn1 addTarget:self action:@selector(onTouchUpInsideBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.btn1 setTitle:@"One" forState:UIControlStateNormal];
    [self.btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btn1 setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    [self.btn1 setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
    [self.btn1 setBackgroundImage:[UIImage imageNamed:@"button.png"] forState:UIControlStateNormal];
    [self.view addSubview:self.btn1];
    
    self.btn2 =[UIButton buttonWithType:UIButtonTypeCustom];
    [self.btn2 setFrame:CGRectMake(140, 150, 100, 35)];
    self.btn2.tag = 2;
    [self.btn2 addTarget:self action:@selector(onTouchUpInsideBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.btn2 setTitle:@"Two" forState:UIControlStateNormal];
    [self.btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btn2 setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    [self.btn2 setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
    [self.btn2 setBackgroundImage:[UIImage imageNamed:@"button.png"] forState:UIControlStateNormal];
    [self.view addSubview:self.btn2];
    
    self.btn3 =[UIButton buttonWithType:UIButtonTypeCustom];
    [self.btn3 setFrame:CGRectMake(30, 200, 100, 35)];
    self.btn3.tag = 3;
    [self.btn3 addTarget:self action:@selector(onTouchUpInsideBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.btn3 setTitle:@"Three" forState:UIControlStateNormal];
    [self.btn3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btn3 setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    [self.btn3 setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
    [self.btn3 setBackgroundImage:[UIImage imageNamed:@"button.png"] forState:UIControlStateNormal];
    [self.view addSubview:self.btn3];
    
    self.btn4 =[UIButton buttonWithType:UIButtonTypeCustom];
    [self.btn4 setFrame:CGRectMake(140, 200, 100, 35)];
    self.btn4.tag = 4;
    [self.btn4 addTarget:self action:@selector(onTouchUpInsideBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.btn4 setTitle:@"Four" forState:UIControlStateNormal];
    [self.btn4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btn4 setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    [self.btn4 setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
    [self.btn4 setBackgroundImage:[UIImage imageNamed:@"button.png"] forState:UIControlStateNormal];
    [self.view addSubview:self.btn4];
    
    self.buttonLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(70, 250, 150, 35)];
    [self.buttonLabel1 setText:@"Selected button is : "];
    [self.buttonLabel1 setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.buttonLabel1];
    
    self.buttonLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(190, 250, 150, 35)];
    [self.buttonLabel2 setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.buttonLabel2];
    
    
}

-(void)onTouchUpInsideBtn:(UIButton *)sender
{
    NSInteger selectedBtnNum = sender.tag;

    if(sender.selected){
        sender.selected = NO;
        
    }else{
        self.selectedBtn.selected = NO;
        sender.selected = YES;
        self.selectedBtn = sender;
    }
    
    
    
    switch (selectedBtnNum) {
        case 1:
            [self.buttonLabel2 setText:@"Number 1"];
            break;
        case 2:
            [self.buttonLabel2 setText:@"Number 2"];
            break;
        case 3:
            [self.buttonLabel2 setText:@"Number 3"];
            break;
        case 4:
            [self.buttonLabel2 setText:@"Number 4"];
            break;
        default:
            
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
