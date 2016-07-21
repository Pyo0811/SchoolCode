//
//  ImageDetailViewController.m
//  NetworkMiniProject
//
//  Created by Sejin Peo on 2016. 6. 22..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "ImageDetailViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ImageDetailViewController ()
@property (weak,nonatomic) UIImageView *imageView;

@end

@implementation ImageDetailViewController

- (void)viewWillAppear:(BOOL)animated{
    
    NSURL *imageURL = [NSURL URLWithString:self.imageURLString];
    
    [self.imageView sd_setImageWithURL:imageURL placeholderImage:nil options:SDWebImageProgressiveDownload | SDWebImageCacheMemoryOnly];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.contentMode = UIViewContentModeScaleToFill;
    //imageView.image = self.myImage;//[UIImage imageNamed:self.myDetail[0]];
    [self.view addSubview:imageView];
    self.imageView = imageView;
    
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0]];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(imageView);
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[imageView(==300)]" options:0 metrics:0 views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[imageView]|" options:0 metrics:0 views:views]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)naviBarOnOff:(id)sender{
    if([self.navigationController isNavigationBarHidden] == NO){
        [self.navigationController setNavigationBarHidden:YES];
    }else{
        [self.navigationController setNavigationBarHidden:NO];
    }
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
