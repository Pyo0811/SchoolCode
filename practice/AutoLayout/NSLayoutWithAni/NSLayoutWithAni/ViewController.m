//
//  ViewController.m
//  NSLayoutWithAni
//
//  Created by Sejin Peo on 2016. 6. 6..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "ViewController.h"
@implementation ViewController
@synthesize _greenView;

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton * moveButton = [[UIButton alloc]init];
    [moveButton setTitle:@"MOVE!" forState:UIControlStateNormal];
    [moveButton setBackgroundColor:[UIColor blueColor]];
    [moveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [moveButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    moveButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:moveButton];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:moveButton
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:moveButton
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:0.0
                                                           constant:30.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:moveButton
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:moveButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self set_greenView:[[UIView alloc] init]];
    [[self _greenView] setBackgroundColor:[UIColor greenColor]];
    [self _greenView].translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:[self _greenView]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:[self _greenView]attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.3 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:[self _greenView]
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:0.3
                                                           constant:0.0]];
    NSLayoutConstraint * greenViewOffsetX = [NSLayoutConstraint constraintWithItem:[self _greenView]
                                                                         attribute:NSLayoutAttributeLeft
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.view
                                                                         attribute:NSLayoutAttributeLeft
                                                                        multiplier:1.0
                                                                          constant:0.0];
    greenViewOffsetX.identifier = GREEN_VIEW_CONSTRAINT_OFFSET_X;
    [self.view addConstraint:greenViewOffsetX];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:[self _greenView]
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    
    [moveButton addTarget:self action:@selector(moveGreenView:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)moveGreenView:(id)sender{
    
    for(NSLayoutConstraint * constraint in self.view.constraints){
        if([constraint.identifier isEqualToString:GREEN_VIEW_CONSTRAINT_OFFSET_X]){
            constraint.constant = [self _greenView].frame.size.width;
            [self.view needsUpdateConstraints];
            break;
        }
    }
    [UIView animateWithDuration:1.0 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL isDone){
        if(isDone){
            for(NSLayoutConstraint * constraint in self.view.constraints){
                if([constraint.identifier isEqualToString:GREEN_VIEW_CONSTRAINT_OFFSET_X]){
                    constraint.constant = 0;
                    [self.view needsUpdateConstraints];
                    [self.view layoutIfNeeded];
                    break;
                }
            }
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end