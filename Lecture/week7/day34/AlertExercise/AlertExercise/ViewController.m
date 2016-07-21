//
//  ViewController.m
//  AlertExercise
//
//  Created by Sejin Peo on 2016. 6. 10..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)clickAlertButton:(id)sender{
    //UIAlertControllerStyleAlert
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        NSLog(@"Alert OK");
    }];
    
    UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:@"파괴" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action){
        NSLog(@"Alert Destructive");
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action){
        NSLog(@"Alert Cancel");
    }];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert!" message:@"Alert Style" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:okAction];
    [alert addAction:destructiveAction];
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (IBAction)clickActionSheetButton:(id)sender{
    //UIAlertControllerStyleActionSheet = 0,
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        NSLog(@"Alert OK");
    }];
    
    UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:@"파괴" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action){
        NSLog(@"Alert Destructive");
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action){
        NSLog(@"Alert Cancel");
    }];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert!" message:@"Alert Style" preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alert addAction:okAction];
    [alert addAction:destructiveAction];
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
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
