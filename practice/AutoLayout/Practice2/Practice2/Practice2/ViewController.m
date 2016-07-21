//
//  ViewController.m
//  Practice2
//
//  Created by Sejin Peo on 2016. 6. 15..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UIView *redView;
@property (nonatomic,strong) UIView *blueView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createView2];
    //[self updateConstraints];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    
}

- (void)createView{
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    self.redView = redView;
    
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    self.blueView = blueView;
    
    
    {   // setAutoLayout
        
        redView.translatesAutoresizingMaskIntoConstraints = NO;
        blueView.translatesAutoresizingMaskIntoConstraints = NO;
        
        NSDictionary *views = NSDictionaryOfVariableBindings(redView,blueView);
        
        NSArray *consts1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[redView]-20-|" options:0 metrics:0 views:views];
        NSArray *consts2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[blueView]-20-|" options:0 metrics:0 views:views];
        NSArray *consts3 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[redView]-[blueView(==redView)]-20-|" options:0 metrics:0 views:views];
        
        [self.view addConstraints:consts1];
        [self.view addConstraints:consts2];
        [self.view addConstraints:consts3];
    }
}

-(void)createView2{
    // 1.添加控件
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
    
    // 2.VFL生成约束,注意使用下面的宏,必须保证键值对的名称一样
    NSDictionary *mertrics = @{@"margin" : @20}; // 参数\数值
    NSDictionary *views = NSDictionaryOfVariableBindings(blueView, redView);
    NSArray *conts = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[blueView]-margin-[redView(==blueView)]-margin-|" options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom metrics:mertrics views:views];
    
    //@{@"blueHeight" : @40, @"margin" : @20}
    NSDictionary *metrics2 = @{@"blueHeight":@40, @"margin":@20};
    NSArray *conts2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[blueView(==blueHeight)]-margin-|" options:0 metrics:metrics2 views:views];
    [self.view addConstraints:conts];
    [self.view addConstraints:conts2];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
