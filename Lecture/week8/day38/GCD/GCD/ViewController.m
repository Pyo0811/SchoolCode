//
//  ViewController.m
//  GCD
//
//  Created by Sejin Peo on 2016. 6. 17..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) dispatch_queue_t time_queue;
@property (nonatomic,assign) __block NSInteger gcdSecond;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.\\\\
    
    //dispatch_queue_t queue = dispatch_get_main_queue()
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        NSLog(@"213123");
    });
    
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 2*NSEC_PER_SEC);
    
    dispatch_after(time, queue, ^{
        for(int i=0; i<5000; i++){
            NSLog(@"for : %d",i);
        }
    });
    
    dispatch_async(queue, ^{
        NSLog(@"2");
    });
    
    dispatch_async(queue, ^{
        NSLog(@"3");
    });

    dispatch_async(queue, ^{
        NSLog(@"4");
    });

    
    
    self.gcdSecond = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
