//
//  SecondViewController.m
//  TestVC
//
//  Created by Sejin Peo on 2016. 5. 31..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self createNaviBar];
    [self.navigationItem setTitle:@"Navigation"];
    [self createToolBar];
    [self.navigationController setToolbarHidden:NO];
    
}

-(void)createNaviBar{
    
    //UISegmentedControl *segmentedControl =  [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:[UIImage imageNamed:@"up.jpg"],[UIImage imageNamed:@"down.png"],nil]];
    UISegmentedControl *segmentedControl =  [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"up",@"down",nil]];
    [segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    [segmentedControl setFrame:CGRectMake(0, 0, 90, 35)];
    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    [segmentedControl setMomentary:YES];
    
    UIBarButtonItem *segmentBarItem = [[UIBarButtonItem alloc] initWithCustomView:segmentedControl];
    self.navigationItem.rightBarButtonItem = segmentBarItem;
    
}

-(void)createToolBar{
    
    UIBarButtonItem *flexibleSpaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UISegmentedControl *sortToggle = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Ascending",@"Descending", nil]];
    [sortToggle setSegmentedControlStyle:UISegmentedControlStyleBar];
    [sortToggle setSelectedSegmentIndex:0];
    [sortToggle addTarget:self action:@selector(toggleSorting:) forControlEvents:UIControlEventValueChanged];
    
    UIBarButtonItem *sortToggleButtonItem = [[UIBarButtonItem alloc] initWithCustomView:sortToggle];
    
    self.toolbarItems = [NSArray arrayWithObjects: flexibleSpaceItem,sortToggleButtonItem,flexibleSpaceItem, nil];
}

-(void)segmentAction:(UISegmentedControl *)sender{
    
}

-(void)toggleSorting:(UISegmentedControl *)sender{
    
}


- (IBAction)nextBtn:(id)sender
{
    // 다음 화면으로 이동
    //1. 객체 생성
    UIStoryboard *storyB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = [storyB instantiateViewControllerWithIdentifier:@"MainVC"];
    //2 . push
    [self.navigationController pushViewController:vc animated:YES];
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
