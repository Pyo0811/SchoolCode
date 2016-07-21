//
//  ImageView.m
//  UITest
//
//  Created by Sejin Peo on 2016. 5. 24..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "ImageView.h"

@interface ImageView ()

@end

@implementation ImageView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    const CGFloat VIEW_MARGIN = 20;
    
    CGFloat offsetY = VIEW_MARGIN;
    
    UIView *mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:mainView];
    
    UIImageView *imgView1 = [[UIImageView alloc] initWithFrame:CGRectMake(VIEW_MARGIN, offsetY, self.view.frame.size.width-VIEW_MARGIN*2, 300)];
    
    [imgView1 setImage:[UIImage imageNamed:@"하연수1.jpg"]];
    [imgView1 setContentMode:UIViewContentModeScaleToFill];
    [mainView addSubview:imgView1];
    offsetY += imgView1.frame.size.height;
    
    UIImageView *imgView2 = [[UIImageView alloc] initWithFrame:CGRectMake(VIEW_MARGIN, offsetY, 300, 300)];
    
    [imgView2 setImage:[UIImage imageNamed:@"하연수2"]];
    [imgView2 setContentMode:UIViewContentModeScaleToFill];
    [mainView addSubview:imgView2];
    offsetY += imgView2.frame.size.height;
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
