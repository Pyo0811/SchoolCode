//
//  ViewController.m
//  AniTest
//
//  Created by Sejin Peo on 2016. 5. 27..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) UIView *subView;
@property (nonatomic, weak) UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/2, self.view.frame.size.height)];
    [view setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:view];
    self.subView = view;
        
    UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [startBtn setFrame:CGRectMake(70, 350, 100, 40)];
    [startBtn addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    [startBtn setTitle:@"start" forState:UIControlStateNormal];
    [startBtn setTintColor:[UIColor whiteColor]];
    [self.view addSubview:startBtn];
    self.btn = startBtn;
}

-(void)action:(UIButton *)sender
{
    
    __weak ViewController *wself = self;
    
    [UIView animateWithDuration:0.6
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [wself.subView setCenter:CGPointMake(self.subView.center.x + self.view.frame.size.width/2, self.subView.center.y)];
                     } completion:^(BOOL finished){
                         [UIView animateWithDuration:1 delay:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
                             [wself.subView setCenter:CGPointMake(self.subView.center.x - self.view.frame.size.width/2, self.subView.center.y)];
                         } completion:nil];
                     }];
    
    
//    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
//        [self.subView setFrame:CGRectMake(self.view.frame.size.width/2, 0, self.view.frame.size.width/2, self.view.frame.size.height)];
//        
//    }completion:^(BOOL finished){
//    
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
