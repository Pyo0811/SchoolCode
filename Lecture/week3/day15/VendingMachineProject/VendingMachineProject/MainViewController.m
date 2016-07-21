//
//  MainViewController.m
//  VendingMachineProject
//
//  Created by Sejin Peo on 2016. 5. 13..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "MainViewController.h"
#import "WCustomButton.h"
#import "TrayBox.h"
#import "DrinkObject.h"
#import "Casher.h"

@interface MainViewController () <WCustomButtonDelegate>

@property(nonatomic) TrayBox *trayBox;
@property(nonatomic) Casher *casher;

@property(nonatomic, weak) IBOutlet UIView *menuView; // 메뉴 영역
// IBOutlet 은 스토리보드에다 올려주겠다는 키워드

@property(nonatomic, weak) IBOutlet UIView *input500CoinArea; // 500원 추가 영역
@property(nonatomic, weak) UILabel *title500CoinLB;
@property(nonatomic, weak) UIButton *add500CoinBtn;

@property(nonatomic, weak) IBOutlet UIView *input100CoinArea; // 100원 추가 영역
@property(nonatomic, weak) UILabel *title100CoinLB;
@property(nonatomic, weak) UIButton *add100CoinBtn;

@property(nonatomic, weak) IBOutlet UIView *moneyControlArea; // 돈 컨트롤(남은돈 표시, 반환버튼)
@property(nonatomic, weak) UILabel *moneyTitleLB;
@property(nonatomic, weak) UITextField *remainMoneyShowTF;
@property(nonatomic, weak) UIButton *moneyChangeBtn;

@property(nonatomic, weak) UITextView *displayView; // 상태 표시화면

@property(nonatomic) NSMutableArray *drinkBtnList;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.drinkBtnList = [[NSMutableArray alloc] initWithCapacity:4];
    self.trayBox = [[TrayBox alloc] init];
    self.casher = [[Casher alloc] init];
    //[self createView];
    //[self updateLayOut];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self createView];
    [self updateLayOut];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// UI객체 생성
-(void)createView{
    /*
    UIView *menuView = [[UIView alloc] init]; // 하나의 뷰를 얹어준다.
    [menuView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:menuView]; // 뷰 컨트롤러에 메뉴 뷰를 올려준다.
    self.menuView = menuView;
     */
    
    //self.menuView.backgroundColor = [UIColor yellowColor];
    {
        for(int i=0; i<maximumDrinkCount; i++){
           DrinkObject *drinkData = [self.trayBox.drinkKinds objectAtIndex:i];
            
            WCustomButton *drinkBtn = [[WCustomButton alloc] init];
            //[drinkBtn setBackgroundColor:[UIColor purpleColor]];
            drinkBtn.tag = i;
            //drinkBtn.delegate = self;
            [drinkBtn setTitle:drinkData.name];
            [drinkBtn setImageWithName:[NSString stringWithFormat:@"drink%d",i+1]];
             [self.menuView addSubview:drinkBtn];
             
             [self.drinkBtnList addObject:drinkBtn];
        }
    }
    /*
    UIView *input500CoinArea = [[UIView alloc] init];
    [input500CoinArea setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:input500CoinArea];
    self.input500CoinArea = input500CoinArea;
     */
    {
        UILabel *title500CoinLB = [[UILabel alloc] init];
        title500CoinLB.text = @"50円";
        title500CoinLB.textColor = [UIColor blackColor];
        title500CoinLB.textAlignment = NSTextAlignmentRight;
        [self.input500CoinArea addSubview:title500CoinLB];
        self.title500CoinLB = title500CoinLB;
        
        UIButton *add500CoinBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
        add500CoinBtn.tag = 50;
        [add500CoinBtn addTarget:self
                          action:@selector(onTouchupInsideAddCoin:)
                    forControlEvents:UIControlEventTouchUpInside];
        [self.input500CoinArea addSubview:add500CoinBtn];
        self.add500CoinBtn = add500CoinBtn;
        
    }
    /*
    UIView *input100CoinArea = [[UIView alloc] init];
    [input100CoinArea setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:input100CoinArea];
    self.input100CoinArea = input100CoinArea;
     */
    {
        UILabel *title100CoinLB = [[UILabel alloc] init];
        title100CoinLB.text = @"10円";
        title100CoinLB.textColor = [UIColor blackColor];
        title100CoinLB.textAlignment = NSTextAlignmentRight;
        [self.input100CoinArea addSubview:title100CoinLB];
        self.title100CoinLB = title100CoinLB;
        
        UIButton *add100CoinBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
        add100CoinBtn.tag = 10;
        [add100CoinBtn addTarget:self
                          action:@selector(onTouchupInsideAddCoin:)
                forControlEvents:UIControlEventTouchUpInside];
        [self.input100CoinArea addSubview:add100CoinBtn];
        self.add100CoinBtn = add100CoinBtn;
    }
    
    /*UIView *moneyControlArea = [[UIView alloc] init];
    [moneyControlArea setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:moneyControlArea];
    self.moneyControlArea = moneyControlArea;*/
    {
        UILabel *moneyTitleLB = [[UILabel alloc] init];
        moneyTitleLB.text = @"Money";
        moneyTitleLB.textColor = [UIColor blackColor];
        moneyTitleLB.font = [UIFont systemFontOfSize:15];
        [self.moneyControlArea addSubview:moneyTitleLB];
        self.moneyTitleLB = moneyTitleLB;
        
        UITextField *remainMoneyShowTF = [[UITextField alloc] init];
        remainMoneyShowTF.userInteractionEnabled = NO;
        remainMoneyShowTF.borderStyle = UITextBorderStyleLine;
        remainMoneyShowTF.textAlignment = NSTextAlignmentCenter;
        [self.moneyControlArea addSubview:remainMoneyShowTF];
        self.remainMoneyShowTF = remainMoneyShowTF;
        
        //잔돈 반환 버튼
        UIButton *moneyChangeBtn = [[UIButton alloc] init];
        [moneyChangeBtn setTitle:@"返還(Return)" forState:UIControlStateNormal];
        [moneyChangeBtn addTarget:self
                           action:@selector(onTouchupInsideMoneyChangeBtn:) forControlEvents:UIControlEventTouchUpInside];
        [moneyChangeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [moneyChangeBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [self.moneyControlArea addSubview:moneyChangeBtn];
         self.moneyChangeBtn = moneyChangeBtn;
    }
    
    UITextView *displayView = [[UITextView alloc] init];
    [displayView setBackgroundColor:[UIColor grayColor]];
    [displayView setTextColor:[UIColor whiteColor]];
    displayView.editable = NO;
    [self.view addSubview:displayView];
    self.displayView = displayView;
}


// UI 레이아웃 수정
-(void)updateLayOut
{
    const CGFloat SIDE_MARGIN = 30.f;
    NSInteger offsetY = 20;
    
    [self.menuView setFrame:CGRectMake(SIDE_MARGIN, offsetY, self.view.frame.size.width-SIDE_MARGIN*2, 370)];
    offsetY += self.menuView.frame.size.height +10;
    {
        CGSize drinkBtnSize = CGSizeMake(140, 175);
        for(int i=0; i<self.drinkBtnList.count; i++){
            NSInteger row = i/2;
            NSInteger col = i%2;
            WCustomButton *drinkBtn = self.drinkBtnList[i];
            [drinkBtn setFrame:CGRectMake(10+ (col*drinkBtnSize.width)+(col*15), row*(drinkBtnSize.height +20), drinkBtnSize.width, drinkBtnSize.height)];
            [drinkBtn updateLayout];
        }
    }
    
    [self.input500CoinArea setFrame:CGRectMake(SIDE_MARGIN, offsetY, self.view.frame.size.width-SIDE_MARGIN*2, 30)];
    offsetY += self.input500CoinArea.frame.size.height+1;
    {
        [self.title500CoinLB setFrame:CGRectMake(0, 0, 265, self.input500CoinArea.frame.size.height)];
        [self.add500CoinBtn setFrame:CGRectMake(270, 0, 30, 30 )];
    }
    
    [self.input100CoinArea setFrame:CGRectMake(SIDE_MARGIN, offsetY, self.view.frame.size.width-SIDE_MARGIN*2, 30)];
    offsetY += self.input100CoinArea.frame.size.height +10;
    {
        [self.title100CoinLB setFrame:CGRectMake(0, 0, 265, self.input100CoinArea.frame.size.height)];
        [self.add100CoinBtn setFrame:CGRectMake(270, 0, 30, 30)];
    }
    
    [self.moneyControlArea setFrame:CGRectMake(SIDE_MARGIN, offsetY, self.view.frame.size.width-SIDE_MARGIN*2, 30)];
    offsetY += self.moneyControlArea.frame.size.height +10;
    {
        [self.moneyTitleLB setFrame:CGRectMake(0, 0, 61, 30)];
        [self.remainMoneyShowTF setFrame:(CGRectMake(63, 0, 200, 30))];
        [self.moneyChangeBtn setFrame:CGRectMake(270, 0, 35, 30)];
    }
    
    [self.displayView setFrame:CGRectMake(SIDE_MARGIN, offsetY, self.view.frame.size.width-SIDE_MARGIN*2, 145)];
    offsetY += self.displayView.frame.size.height;
}

/************************
 Action
 ***********************/
-(void)didSelectWCustomButton:(WCustomButton *)customBtn
{
    DrinkObject *drinkObj = [self.trayBox.drinkKinds objectAtIndex:customBtn.tag];
    
    if([self.casher buyDrink:drinkObj])
    {
        NSString *successMsg =[NSString stringWithFormat:@"%@ 1個が出ました。 \n",drinkObj.name];
        //NSString *successMsg =[NSString stringWithFormat:@"%@ 1개가 나왔습니다. \n",drinkObj.name];
        [self.displayView setText:[self.displayView.text stringByAppendingString:successMsg]];
        [self.remainMoneyShowTF setText:[NSString stringWithFormat:@"%zd",(long)self.casher.inputMoney]];
    }
    else
    {
        [self.displayView setText:[self.displayView.text stringByAppendingString:@"残高が乏しいです。 \n"]];
        //[self.displayView setText:[self.displayView.text stringByAppendingString:@"잔액이 부족합니다. \n"]];
    }
}
-(IBAction)onTouchupInsideAddCoin:(UIButton *)sender
{
    NSInteger tag = sender.tag;
    if(tag==10){
        [self.casher addDCoin100];
        
    }else if( tag==50){
        [self.casher addCoin500];
    }else{
        NSLog(@"tag값이 잘못 되었습니다.");
    }
    
    [self.remainMoneyShowTF setText:[NSString stringWithFormat:@"%zd",self.casher.inputMoney]];
}
-(IBAction)onTouchupInsideMoneyChangeBtn:(UIButton *)sender
{
    
    NSDictionary *coinDic = [self.casher changeMoney];
    NSNumber *coin500Count = coinDic[@"50"];
    NSNumber *coin100Count = coinDic[@"10"];
    NSInteger changeMoney = (50*coin500Count.integerValue) + (10*coin100Count.integerValue);
    
    //남은돈 표시
    [self.remainMoneyShowTF setText:[NSString stringWithFormat:@"%zd",(long)self.casher.inputMoney]];
    //로그 표시
    //NSString *changeMsg = [NSString stringWithFormat:@"거스름돈은 %ld엔입니다. (50엔 동전 %@개, 10엔 동전 %@개)\n",changeMoney,coin500Count,coin100Count];
    NSString *changeMsg = [NSString stringWithFormat:@"お釣りは %ld円です. (50円のコイン %@個, 10円のコイン %@個)\n",changeMoney,coin500Count,coin100Count];

    [self.displayView setText:[self.displayView.text stringByAppendingString:changeMsg]];
}

@end
