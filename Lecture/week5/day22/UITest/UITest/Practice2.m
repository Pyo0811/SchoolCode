//
//  Practice2.m
//  UITest
//
//  Created by Sejin Peo on 2016. 5. 24..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "Practice2.h"

@interface Practice2 ()

@end

@implementation Practice2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    const CGFloat VIEW_MARGIN = 20;
    CGSize labelSize = CGSizeMake(self.view.frame.size.width - VIEW_MARGIN*2, 30);
    
    CGFloat offsetY = VIEW_MARGIN;
    
    UIView *mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/2)];
    [mainView setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:mainView];
    
    UILabel *firstLabel = [[UILabel alloc] initWithFrame:CGRectMake(VIEW_MARGIN, offsetY, labelSize.width, labelSize.height)];
    [firstLabel setText:@"예제 화면 입니다."];
    [firstLabel setTextAlignment:NSTextAlignmentLeft];
    [mainView addSubview:firstLabel];
    
    offsetY += firstLabel.frame.size.height;
    
    UILabel *secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(VIEW_MARGIN, offsetY, labelSize.width, labelSize.height)];
    [secondLabel setText:@"예쁜 레이블 입니다."];
    [secondLabel setTextColor:[UIColor redColor]];
    [secondLabel setTextAlignment:NSTextAlignmentRight];
    [mainView addSubview:secondLabel];
    
    offsetY += secondLabel.frame.size.height;
    
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(VIEW_MARGIN, offsetY, 300, 150)];
    [subView setBackgroundColor:[UIColor blackColor]];
    [mainView addSubview:subView];
    offsetY += subView.frame.size.height;
    UILabel *innerLB = [[UILabel alloc] initWithFrame:CGRectMake(0, subView.frame.size.height-labelSize.height, subView.frame.size.width, labelSize.height)];
    innerLB.text = @"이너텍스트";
    [innerLB setTextColor:[UIColor whiteColor]];
    innerLB.textAlignment = NSTextAlignmentRight;
    [subView addSubview:innerLB];
    
    UILabel *thirdLabel = [[UILabel alloc] initWithFrame:CGRectMake(VIEW_MARGIN, offsetY, labelSize.width, labelSize.height)];
    [thirdLabel setText:@"중앙에 있는 레이블 입니다."];
    [thirdLabel setTextAlignment:NSTextAlignmentCenter];
    [mainView addSubview:thirdLabel];
    
    offsetY += thirdLabel.frame.size.height;
    
    UILabel *fourthLabel = [[UILabel alloc] initWithFrame:CGRectMake(VIEW_MARGIN, offsetY, labelSize.width, labelSize.height)];
    [fourthLabel setText:@"폰트는 20 입니다."];
    [fourthLabel setTextAlignment:NSTextAlignmentCenter];
    [mainView addSubview:fourthLabel];
    
    offsetY += fourthLabel.frame.size.height;
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
