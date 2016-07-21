//
//  ViewController.m
//  Notification
//
//  Created by Sejin Peo on 2016. 6. 16..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,weak) IBOutlet UILabel *firstViewLabel;
@property (nonatomic,weak) IBOutlet UIButton *firstViewButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                       selector:@selector(changeTextNoti:)
                                           name:@"ChangeTextNoti"
                                         object:nil];
}

- (void)changeTextNoti:(NSNotification *)noti{
    NSString *text = noti.object;
    [self.firstViewLabel setText:text];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end
