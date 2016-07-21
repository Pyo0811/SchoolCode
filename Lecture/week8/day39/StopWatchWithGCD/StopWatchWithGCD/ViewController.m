//
//  ViewController.m
//  StopWatchWithGCD
//
//  Created by Sejin Peo on 2016. 6. 17..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UILabel *timeLB;
@property (nonatomic, weak) IBOutlet UIButton *startBtn;

//gcd
@property (nonatomic) dispatch_queue_t timer_queue;
@property (nonatomic,assign) __block NSInteger gcdSecond;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.gcdSecond = 0;
}


- (IBAction)controlBtnAction:(UIButton *)sender{
    if(sender.selected) {
        // stop
        sender.selected = NO;
        
        [self stop];
    }else{
        // play
        sender.selected = YES;
        if(self.timer_queue == nil){
            self.timer_queue = dispatch_queue_create("wing", DISPATCH_QUEUE_SERIAL);
            // dispatch c함수
            [self startTime];
        }else{
            dispatch_resume(self.timer_queue);
        }
    }
}


//GCD Method
- (void)startTime{
    
    dispatch_async(self.timer_queue, ^{
        self.gcdSecond++;
        
        dispatch_sync(dispatch_get_main_queue(),^{
            self.timeLB.text = [NSString stringWithFormat:@"%ld",self.gcdSecond];
        }); // 메인쓰레드로 보냄
        
        dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, 1*NSEC_PER_SEC);
        // 1초단위로 딜레이
        dispatch_after(delay,self.timer_queue, ^{
            [self startTime]; // 재귀함수 while문에서 무한반복을 시켰듯이
        });
    });
}

- (void)stop{
    
    dispatch_suspend(self.timer_queue);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
