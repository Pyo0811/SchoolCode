//
//  ViewController.m
//  PropertyAndKVO
//
//  Created by Sejin Peo on 2016. 6. 9..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (nonatomic, weak) IBOutlet UILabel *countLabel;
@property (nonatomic) NSInteger count;


@end

@implementation ViewController

- (void)setCount:(NSInteger)count{
    _count = count;
    NSLog(@"Set Count : %ld",count);
    [self.countLabel setText:[NSString stringWithFormat:@"%ld", _count]];
}

- (IBAction)clickButton:(id)sender{
    self.count++;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
