//
//  SecondViewController.m
//  Notification
//
//  Created by Sejin Peo on 2016. 6. 16..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (nonatomic,weak) IBOutlet UITextField *textField;
@property (nonatomic,weak) IBOutlet UIButton *okButton;
@property (nonatomic,weak) IBOutlet UILabel *changingLabel;

@property (nonatomic,strong) NSThread *thread;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.thread = [[NSThread alloc] initWithTarget:self selector:@selector(testThread:) object:nil];
    [self.thread start];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(upKeyboard:) name:UIKeyboardDidShowNotification object:nil];
    
    
}

- (void)testThread:(NSThread *)thread{
    
    NSInteger i =0;
    
    while(self.thread.isCancelled == NO){
        
        i++;
        
        // 메인스레드를 사용함
        [self performSelectorOnMainThread:@selector(changeDisplay:) withObject:[NSNumber numberWithInteger:i] waitUntilDone:YES];
        // waitUntildone 기다릴거냐 말거냐
        
        //NSLog(@"%ld",i++);
        
    }
}

- (void)changeDisplay:(NSNumber *)number{
    [self.changingLabel setText:[NSString stringWithFormat:@"%@",number]];
}

- (void)dealloc{
    NSLog(@"dealloc");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)upKeyboard:(NSNotification *)noti{
    NSLog(@"show keyboard");
}

- (IBAction)eventOkButton:(id)sender{
    
    [self.thread cancel];
    //self.thread = nil;
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ChangeTextNoti" object:self.textField.text];
    [self.navigationController popViewControllerAnimated:YES];
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
