//
//  ScrollViewController.m
//  UIButtonTest
//
//  Created by Sejin Peo on 2016. 5. 27..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIScrollView *scrolView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    //컨텐츠 사이즈 조정
    [scrolView setContentSize:CGSizeMake(scrolView.frame.size.width*3, 460 )];
    //델리게이트 설정
    scrolView.delegate = self;
    scrolView.pagingEnabled = NO;
    [self.view addSubview:scrolView];
    
    // 추가뷰 1
    UIView *newView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    [newView1 setBackgroundColor:[UIColor blueColor]];
    [scrolView addSubview:newView1];
    // 추가뷰 2
    UIView *newView2 = [[UIView alloc] initWithFrame:CGRectMake(320, 0, 320, 460)];
    [newView2 setBackgroundColor:[UIColor greenColor]];
    [scrolView addSubview:newView2];
    // 추가뷰 3
    UIView *newView3 = [[UIView alloc] initWithFrame:CGRectMake(640, 0, 320, 460)];
    [newView3 setBackgroundColor:[UIColor redColor]];
    [scrolView addSubview:newView3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
