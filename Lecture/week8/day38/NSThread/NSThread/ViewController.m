//
//  ViewController.m
//  NSThread
//
//  Created by Sejin Peo on 2016. 6. 16..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,weak) IBOutlet UILabel *label;
@property (nonatomic,weak) IBOutlet UIButton *button;
@property (nonatomic,weak) IBOutlet UIButton *reButton;
@property (nonatomic,weak) IBOutlet UIButton *buttonInit;
@property (nonatomic,strong) NSThread *thread;

@property (nonatomic) NSInteger number;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //[NSThread detachNewThreadSelector:@selector(testThread:) toTarget:self withObject:nil];
    
}

-  (void)testThread:(NSThread *)thread{
    
    //NSInteger i = self.number;
    
    self.number = 0;
    
    while (self.thread.cancelled == NO) {
        
        self.number++;
        //self.number = i;
        NSLog(@"%ld sec",self.number);
        
        [self performSelectorOnMainThread:@selector(actionOnMainThread:) withObject:[NSNumber numberWithInteger:self.number] waitUntilDone:YES];
        [NSThread sleepForTimeInterval:1.0];
    }
}

- (void)actionOnMainThread:(NSNumber *)number{
    self.label.text = [NSString stringWithFormat:@"%@",number];
}

- (IBAction)buttonAction:(id)sender{
    
    if(self.thread == nil){
        [self.button setTitle:@"STOP" forState:UIControlStateNormal];
        self.thread = [[NSThread alloc] initWithTarget:self selector:@selector(testThread:) object:nil];
        [self.thread start];
    }else{
        NSLog(@"Time Stop!!!");
        [self.thread cancel];
    }

}

- (IBAction)reStartButton:(id)sender{
    
    NSLog(@"Re-start!!");
    if(self.thread != nil){
    if(self.thread.cancelled == YES || self.number==0){
        self.thread = [[NSThread alloc] initWithTarget:self selector:@selector(restartThread:) object:nil];
        
        [self.thread start];
    }
    }
    
}

- (void)restartThread:(NSThread *)thread{
    
    while (self.thread.cancelled == NO) {
        
        self.number++;
        //self.number = i;
        NSLog(@"%ld sec",self.number);
        
        [self performSelectorOnMainThread:@selector(actionOnMainThread:) withObject:[NSNumber numberWithInteger:self.number] waitUntilDone:YES];
        [NSThread sleepForTimeInterval:1.0];
    }
    
}

- (IBAction)initNumber:(id)sender{
    
    self.number = 0;
    self.label.text = [NSString stringWithFormat:@"%@",@0];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
