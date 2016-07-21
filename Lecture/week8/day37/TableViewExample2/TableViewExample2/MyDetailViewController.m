//
//  MyDetailViewController.m
//  TableViewExample2
//
//  Created by Sejin Peo on 2016. 6. 16..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "MyDetailViewController.h"

@interface MyDetailViewController ()


@property (nonatomic,strong) UILabel *label1;
@property (nonatomic,strong) UILabel *label2;
@property (nonatomic,strong) UIImageView *selectedImage;

@end

@implementation MyDetailViewController

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self.navigationController setNavigationBarHidden:NO];
    self.title = @"Table view detail";
    
    UILabel *imageNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 80, 100, 21)];
    imageNameLabel.text = @"image Name";
    imageNameLabel.textColor = [UIColor blueColor];
    imageNameLabel.textAlignment = NSTextAlignmentCenter;
    imageNameLabel.font = [UIFont systemFontOfSize:14.0f];
    [self.view addSubview:imageNameLabel];
    
    UILabel *imageFormLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 120, 100, 21)];
    imageFormLabel.text = @"image Format";
    imageFormLabel.textColor = [UIColor blueColor];
    imageFormLabel.textAlignment = NSTextAlignmentCenter;
    imageFormLabel.font = [UIFont systemFontOfSize:14.0f];
    [self.view addSubview:imageFormLabel];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(140, 80, 120, 21)];
    //label1.text = @"Label1";
    label1.text = self.myDetailMode[0];
    label1.textColor = [UIColor blueColor];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.font = [UIFont systemFontOfSize:14.0f];
    [self.view addSubview:label1];
    //self.label1 = label1;
    
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(140, 120, 120, 21)];
    //label2.text = @"Label2";
    label2.text = self.myDetailMode[1];
    label2.textColor = [UIColor blueColor];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.font = [UIFont systemFontOfSize:14.0f];
    [self.view addSubview:label2];
    //self.label2 = label2;
    
    UIImageView *selectedImage = [[UIImageView alloc] initWithFrame:CGRectMake(30, 150, 250, 300)];
    //selectedImage.image = [UIImage imageNamed:@"하연수2.jpg"];
    selectedImage.image = [UIImage imageNamed:self.myDetailMode[2]];
    selectedImage.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:selectedImage];
    //self.selectedImage = selectedImage;
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
