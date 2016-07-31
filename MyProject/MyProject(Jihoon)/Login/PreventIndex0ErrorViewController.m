//
//  PreventIndex0ErrorViewController.m
//  MyProject
//
//  Created by Sejin Peo on 2016. 7. 31..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "PreventIndex0ErrorViewController.h"
#import "DataCentre.h"
#import "MainTableViewController.h"

@interface PreventIndex0ErrorViewController ()

@property(nonatomic,strong) DataCentre *dataCentre;

@end

@implementation PreventIndex0ErrorViewController

- (void)viewWillAppear:(BOOL)animated{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"사진 제목" message:@"사진 제목을 입력하세요" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UITextField *field = alert.textFields.firstObject;
        NSString *inputText = field.text;
        
        if([inputText length] != 0 ){
            [self.dataCentre.titles addObject:inputText];
            //[self.tableView reloadData];
        }
    }];
    
    [alert addAction:okAction];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"사진제목";
    }];
    
    [self presentViewController:alert animated:YES completion:nil];
   
    MainTableViewController *mainTableViewController = [[MainTableViewController alloc] init];
    [self presentViewController:mainTableViewController animated:NO completion:nil];
    // 아 씨발 안해먹어 썅
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dataCentre = [DataCentre defaultData];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
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
