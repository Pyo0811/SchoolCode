//
//  KVOViewController.m
//  PropertyAndKVO
//
//  Created by Sejin Peo on 2016. 6. 9..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "KVOViewController.h"

@interface KVOViewController ()

@property (nonatomic) NSInteger count;
@property (nonatomic, weak) IBOutlet UILabel *countLabel;

@end

@implementation KVOViewController

- (IBAction)clickButton:(id)sender{
    self.count++;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 나 자신의 count 프로퍼티가 변경되는걸 알고싶다.
    [self addObserver:self
           forKeyPath:@"count"
              options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context{
    // 시스템이 이 메소드를 호출해서 알려줌
    
    NSLog(@"%@",change);
    
    NSNumber *kindValue = [change objectForKey:NSKeyValueChangeKindKey];
    NSNumber *newValue = [change objectForKey:NSKeyValueChangeNewKey];
    
    self.countLabel.text = [NSString stringWithFormat:@"%@", newValue];
    NSLog(@"kind : %@, NEW : %@",kindValue, newValue);
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
