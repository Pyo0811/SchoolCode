//
//  ViewController.m
//  Practice1
//
//  Created by Sejin Peo on 2016. 6. 1..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //[self autoLayoutView];
    //[self autoLayoutView2];
    //[self autoLayoutView3];
    //[self autoLayoutViewWithFormat1];
    //[self autoLayoutViewWithFormat2];
    //[self autoLayoutSampleOne];
    //[self autoLayoutSampleTwo];
    //[self autoLayoutSampleThree];
    //[self autoLayoutSampleFour];
    [self autoLay2];
    
}


-(void)autoLayoutView{
    
    UIView *secondView = [[UIView alloc] init];
    [secondView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:secondView];
    
    secondView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 가로길이 150으로 고정
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:secondView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:150];
    [secondView addConstraint:width];
    
    //세로길이 150으로 고정
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:secondView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:150];
    [secondView addConstraint:height];
    
    // secondView를 self.view 기준으로 x 값 중앙에 위치하도록 함.
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:secondView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    [self.view addConstraint:centerX];
    
    // secondView를 self.view 기준으로 y 값 중앙에 위치하도록 함.
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:secondView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    [self.view addConstraint:centerY];
    
    }

-(void)autoLayoutView2{
    UIView *secondView = [[UIView alloc] init];
    [secondView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:secondView];
    
    secondView.translatesAutoresizingMaskIntoConstraints = NO;
    
    //세로길이 50으로 고정
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:secondView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50];
    [secondView addConstraint:height];
    
    // secondView를 self.view 기준으로 y 값 중앙에 위치하도록 함
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:secondView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    [self.view addConstraint:centerY];
    
    // secondView를 self.view와 왼쪽에 거리를 30으로 지정함.
    NSLayoutConstraint *leadingSpace = [NSLayoutConstraint constraintWithItem:secondView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:30];
    [self.view addConstraint:leadingSpace];
    
    // secondView를 secondView와 오른쪽 거리를 30으로 지정함.
    NSLayoutConstraint *trailingSpace = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:secondView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:30];
    [self.view addConstraint:trailingSpace];
}

-(void)autoLayoutView3{
    
    UIView *red = [[UIView alloc] init];
    [red setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:red];
    red.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIView *blue = [[UIView alloc] init];
    [blue setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:blue];
    blue.translatesAutoresizingMaskIntoConstraints = NO;
    
    // red를 self.view 으로 top부터 거리를 20으로 지정함.
    NSLayoutConstraint *redTop = [NSLayoutConstraint constraintWithItem:red attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:20];
    [self.view addConstraint:redTop];
    
    // self.view를 red로 bottom부터 거리를 20으로 지정함
    NSLayoutConstraint *redBottom = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:red attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20];
    [self.view addConstraint:redBottom];
    
    // blue를 self.view 으로 top부터 거리를 20으로 지정함.
    NSLayoutConstraint *blueTop = [NSLayoutConstraint constraintWithItem:blue attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:20];
    [self.view addConstraint:blueTop];
    
    // self.view를 blue로 bottom부터 거리를 20으로 지정함
    NSLayoutConstraint *blueBottom = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:blue attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20];
    [self.view addConstraint:blueBottom];
    
    // red를 self.view와 왼쪽에 거리를 20으로 지정함.
    NSLayoutConstraint *redLeading = [NSLayoutConstraint constraintWithItem:red attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:20];
    [self.view addConstraint:redLeading];
    
    // blue를 red와 왼쪽에 거리를 8으로 지정함.
    NSLayoutConstraint *blueAndRedLeading = [NSLayoutConstraint constraintWithItem:blue attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:red attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:8];
    [self.view addConstraint:blueAndRedLeading];
    
    // self.view를 blue와 오른쪽에 거리를 20으로 지정함.
    NSLayoutConstraint *blueTrailing = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:blue attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:20];
    [self.view addConstraint:blueTrailing];
    
    // red와 blue의 width를 같게함
    NSLayoutConstraint *redAndBlueWidth = [NSLayoutConstraint constraintWithItem:red attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:blue attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0];
    [self.view addConstraint:redAndBlueWidth];
    
//    NSDictionary *views = NSDictionaryOfVariableBindings(red,blue);
//    NSArray *conts = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[red(==blue)]" view:views];
//    [self.view addConstraint:consts];
}

-(void)autoLayoutViewWithFormat1{
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
    
    NSArray *conts2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[blueView(==40)]-20-|" options:0 metrics:0 views:views];
    [self.view addConstraints:conts];
    [self.view addConstraints:conts2];
}

-(void)autoLay1{

    UIView *black = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 100, 30)];
    black.backgroundColor = [UIColor blackColor];
    [self.view addSubview:black];
    
    UIView *greenView = [[UIView alloc] init];
    greenView.backgroundColor = [UIColor greenColor];
    greenView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:greenView];
    
//    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:blackView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:200];
//    [blackView addConstraint:height];
    
//    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:blackView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
//    [self.view addConstraint:centerY];
    
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:greenView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    [self.view addConstraint:centerX];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(greenView,black);
    NSArray *consts = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[greenView]-20-|" options:0 metrics:0 views:views];
    
    NSArray *consts2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[greenView(==200)]" options:0 metrics:0 views:views];
    
    NSArray *consts3 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[black]-20-|" options:0 metrics:0 views:views];
    
    NSArray *consts4 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[black]-(>=100)-|" options:0 metrics:0 views:views];

    
    [self.view addConstraints:consts];
    [self.view addConstraints:consts2];
    [self.view addConstraints:consts3];
    [self.view addConstraints:consts4];
    
}

-(void)autoLay2{
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"나는 레이블";
    label.backgroundColor = [UIColor greenColor];
    [self.view addSubview:label];
    
    UITextField *text = [[UITextField alloc] init];
    text.placeholder = @"나는 텍스트필드";
    text.textAlignment = NSTextAlignmentCenter;
    text.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:text];
    
    label.translatesAutoresizingMaskIntoConstraints = NO;
    text.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSDictionary *views = NSDictionaryOfVariableBindings(label,text);
    NSArray *consts = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[label(==32)]" options:0 metrics:0 views:views];
    NSArray *consts2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[text(==32)]" options:0 metrics:0 views:views];
    //"|-20-[l(==t)]-10-[t]-|"
    NSArray *consts3 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label(==text)]-10-[text]-|" options:0 metrics:0 views:views];
    [self.view addConstraints:consts];
    [self.view addConstraints:consts2];
    [self.view addConstraints:consts3];
    
    
}

- (void)autoLayoutViewWithFormat2{
    
    UIView *superview = self.view;
    UIView *secondView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    secondView.translatesAutoresizingMaskIntoConstraints = NO;
    [secondView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:secondView];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(secondView, superview);
    
    [superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[superview]-(<=0)-[secondView(200)]" options:NSLayoutFormatAlignAllCenterY metrics:nil views:views]];
    [superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[superview]-(<=0)-[secondView(200)]"  options:NSLayoutFormatAlignAllCenterX metrics:nil views:views]];
}

-(void)autoLayoutSampleOne{
    // autolayout visual format language – 3 Views , Equal Width Constraints
    
    
    UIView *redView = [[UIView alloc] init];
    [redView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:redView];
    
    UIView *greenView = [[UIView alloc] init];
    [greenView setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:greenView];
    
    UIView *blueView = [[UIView alloc] init];
    [blueView setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:blueView];
    
    [redView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [greenView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [blueView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSDictionary *views = NSDictionaryOfVariableBindings(redView, greenView,blueView);
    
    NSArray *horizontalConstraints =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[redView]-10-[greenView]-10-[blueView]-50-|" options:0 metrics:nil views:views];
    NSArray *equalWidthConstraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"[redView(==greenView)]" options:0 metrics:nil views:views];
    NSArray *equalWidthConstraints2 = [NSLayoutConstraint constraintsWithVisualFormat:@"[greenView(==blueView)]" options:0 metrics:nil views:views];
    NSArray *verticalConstraints1 =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[redView]-20-|" options:0 metrics:nil views:views];
    NSArray *verticalConstraints2 =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[greenView]-20-|" options:0 metrics:nil views:views];
    NSArray *verticalConstraints3 =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[blueView]-20-|" options:0 metrics:nil views:views];
    
    [self.view addConstraints:horizontalConstraints];
    [self.view addConstraints:equalWidthConstraints1];
    [self.view addConstraints:equalWidthConstraints2];
    [self.view addConstraints:verticalConstraints1];
    [self.view addConstraints:verticalConstraints2];
    [self.view addConstraints:verticalConstraints3];
    NSLog(@"%@",[self.view constraints]);
    
    
//    [self.window.contentView addConstraints:horizontalConstraints];
//    [self.window.contentView addConstraints:equalWidthConstraints1];
//    [self.window.contentView addConstraints:equalWidthConstraints2];
//    [self.window.contentView addConstraints:verticalConstraints1];
//    [self.window.contentView addConstraints:verticalConstraints2];
//    [self.window.contentView addConstraints:verticalConstraints3];
//    NSLog(@"%@",[self.window.contentView constraints]);
}

-(void)autoLayoutSampleTwo{
    
    // autolayout visual format language – Red , Green and Blue in 1:2:4 Ratio
    
    UIView *redView = [[UIView alloc]init];
    [redView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:redView];
    
    UIView *greenView = [[UIView alloc] init];
    [greenView setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:greenView];
    
    UIView *blueView = [[UIView alloc]init];
    [blueView setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:blueView];
    
    [redView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [greenView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [blueView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(redView, greenView,blueView);
    
    NSArray *horizontalConstraints =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[redView]-20-[greenView]-20-[blueView]-20-|"  options:0 metrics:nil views:views];
    NSLayoutConstraint * widthConstraints1 = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:greenView attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0];
    NSLayoutConstraint * widthConstraints2 = [NSLayoutConstraint constraintWithItem:greenView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0];
    NSArray *verticalConstraints1 =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[redView]-20-|"  options:0 metrics:nil views:views];
    NSArray *verticalConstraints2 =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[greenView]-20-|" options:0 metrics:nil views:views];
    NSArray *verticalConstraints3 =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[blueView]-20-|" options:0 metrics:nil views:views];
    
    [self.view addConstraints:horizontalConstraints];
    [self.view addConstraint:widthConstraints1];
    [self.view addConstraint:widthConstraints2];
    [self.view addConstraints:verticalConstraints1];
    [self.view addConstraints:verticalConstraints2];
    [self.view addConstraints:verticalConstraints3];
    
    NSLog(@"RedView,GreenView,BlueView 의 제약조건 %@",[self.view constraints]);
}

-(void)autoLayoutSampleThree{
    
    // autolayout visual format language – Fixed Size Constraint for Red, Green and Blue of Equal Width 빨간색(뷰) 가로길이 고정
    
    UIView *redView = [[UIView alloc]init];
    [redView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:redView];
    
    UIView *greenView = [[UIView alloc] init];
    [greenView setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:greenView];
    
    UIView *blueView = [[UIView alloc] init];
    [blueView setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:blueView];
    
    [redView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [greenView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [blueView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(redView, greenView,blueView);
    
    NSArray *horizontalConstraints =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[redView(200)]-20-[greenView]-20-[blueView]-20-|" options:0 metrics:nil views:views];
    NSArray *equalWidthConstraints2 = [NSLayoutConstraint constraintsWithVisualFormat:@"[greenView(==blueView)]" options:0 metrics:nil views:views];
    NSArray *verticalConstraints1 =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[redView]-20-|" options:0 metrics:nil views:views];
    NSArray *verticalConstraints2 =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[greenView]-20-|" options:0 metrics:nil views:views];
    //NSArray *verticalConstraints3 =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[blueView]-20-|" options:0 metrics:nil views:views];
    
   
    [self.view addConstraints:horizontalConstraints];
    [self.view addConstraints:equalWidthConstraints2];
    [self.view addConstraints:verticalConstraints1];
    [self.view addConstraints:verticalConstraints2];
    //[self.view addConstraints:verticalConstraints3];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[blueView]-20-|" options:0 metrics:nil views:views]];
    
    NSLog(@"%@",[self.view constraints]);
}

-(void)autoLayoutSampleFour{
    
    // autolayout visual format language – Green Resizes as the window Resizes, Red and Blue remain of constant width 빨간색뷰,파랑색뷰 가로길이 고정
    
    UIView *redView = [[UIView alloc] init];
    [redView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:redView];
    
    UIView *greenView = [[UIView alloc] init];
    [greenView setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:greenView];
    
    UIView *blueView = [[UIView alloc] init];
    [blueView setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:blueView];
    
    [redView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [greenView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [blueView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(redView, greenView,blueView);
    
    NSArray *horizontalConstraints =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[redView(200)]-20-[greenView]-20-[blueView(200)]-20-|" options:0 metrics:nil views:views];
    NSArray *verticalConstraints1 =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[redView]-20-|"  options:0 metrics:nil views:views];
    NSArray *verticalConstraints2 =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[greenView]-20-|" options:0 metrics:nil views:views];
    NSArray *verticalConstraints3 =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[blueView]-20-|" options:0 metrics:nil views:views];
    
    
    [self.view addConstraints:horizontalConstraints];
    [self.view addConstraints:verticalConstraints1];
    [self.view addConstraints:verticalConstraints2];
    [self.view addConstraints:verticalConstraints3];
    NSLog(@"%@",[self.view constraints]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
