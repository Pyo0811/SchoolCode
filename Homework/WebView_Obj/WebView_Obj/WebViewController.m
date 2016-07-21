//
//  WebViewController.m
//  WebView_Obj
//
//  Created by Alchemist on 2016. 5. 30..
//  Copyright © 2016년 Alchemist. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
<UIWebViewDelegate>
//WebViewDelegate사용을 위해 델리게이트 선언


//**꿀팁**
//"MARK:-무엇무엇"이란
//이렇게 주석을 달면 XCODE 중앙 상단부분에 경로 마지막단에 모아서 보여줍니다.(이문장에서만 처리적용을 피하고자 소문자 m으로 적습니다.)
//코드가 길어질 경우, 섹션별로 정리가 되어 표제어만 보고 빠르게 접근할 수 있습니다.
//물론 다른 형식도 있습니다!
//처음부터 좋은 습관을 들여서 협업하기 좋은 개발자가 되도록 합시다!


//MARK:- Properties
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *goBackButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *goForwardButton;
@property (weak, nonatomic) IBOutlet UIButton *goButton;

//MARK:- ActionButtons
- (IBAction)goButton:(id)sender;
- (IBAction)backToolBarButton:(id)sender;
- (IBAction)forwardToolBarButton:(id)sender;
- (IBAction)refreshToolBarButton:(id)sender;

@end


@implementation WebViewController

//MARK:- ViewController LifeCycle
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
        //기본 홈페이지를 보여주는 코드입니다.
        NSString *homeUrlString = [NSString stringWithFormat:@"http://www.daum.net"];
        NSURL *urlHome = [NSURL URLWithString:homeUrlString];
        NSURLRequest *urlRequestHome = [NSURLRequest requestWithURL:urlHome];
        [self.webView loadRequest:urlRequestHome];
   }

- (void)viewDidLoad {
    [super viewDidLoad];
    //스토리보드상의 웹뷰의 위임자(델리게이션)를 WebViewController(self)자기 자신으로 지정합니다.
    //소스에서 self지정을 할 떄는 보통 이곳, viewDidLoad에서 주로 합니다. 스토리보드로 하는 방법도 있습니다.(찾아보세요~)
    //델리게이트 사용시 이 부분을 까먹고 적지 않기 '매우' 쉽습니다. 델리게이트 구현이 잘 안되면 이 부분을 한번더 체크해 보는 꿀팁!!
    //참고로 viewLifeCycle중 'viewDidLoad'는 앱 실행시 최초 한번 불리는 반면, 'viewWill/DidAppaer'류의 메소드는 화면전환시마다 불립니다.
    //이 차이를 활용해 디테일한 설정을 달리 줄 수 있습니다. (지금 이해안되셔도 괜찮습니다. 곧 되실거에요^^)
    self.webView.delegate = self;
}

//MARK:- go버튼 터치시 불릴 메소드
- (IBAction)goButton:(id)sender {
    
    
    NSString *urlString = self.urlTextField.text;
    NSString *okUrl;
   
    //특정사이트나 어휘가 들어간 url검색을 막을 수 있습니다.
    if ([urlString containsString:@"naver"]) {
        NSLog(@"접속할 수 없습니다!");
        
        //alert메시지를 띄우는 코드입니다.
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"알림" message:@"네이버에는 접속할 수 없습니다" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleDestructive handler:nil];
        [alertController addAction:okAction];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
        //여기까지요~~
        
        //허용된 url일 경우, 만약 user가 "http://"를 적지 않은 경우 포함시켜 줍시다.
    } else {
    
        if (![urlString hasPrefix:@"http://"]) {
            okUrl = [@"http://" stringByAppendingString:urlString];
            
            //잘 넣어준 경우는 그냥 쓰면 되겠죠?
        } else {
            okUrl = urlString;
        }
        
        //위의 기본 홈페이지를 보여주는 코드 구성과 동일합니다.
        //위의 코드들은 user가 textField에 입력한 url 텍스트만을 가지고 놀아본 겁니다.
        NSURL *url = [NSURL URLWithString:okUrl];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:urlRequest];
    }
}

//MARK:- 뒤로가기 버튼 터치시 불릴 메소드
- (IBAction)backToolBarButton:(id)sender {
    
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    }
}

//MARK:- 앞으로가기 버튼 터치시 불릴 메소드
- (IBAction)forwardToolBarButton:(id)sender {
    
    if ([self.webView canGoForward]) {
     [self.webView goForward];
    }
}

//MARK:- 새로고침 버튼 터치시 불릴 메소드
- (IBAction)refreshToolBarButton:(id)sender {
    [self.webView reload];
}

//MARK:- webViewDelegate 메소드 구현
//페이지 이동이 끝날 떄마다 불리는 델리게이트 메소드입니다.
//우리는 페이지 이동 가능여부에 따라 뒤로가기/앞으로가기 버튼을 활성화/비활성화 하기위해 델리게이트 메소드를 사용합니다.
-(void)webViewDidFinishLoad:(UIWebView *)webView {
    if (![webView canGoBack]) {
        [self.goBackButton setEnabled:NO];
    } else {
        [self.goBackButton setEnabled:YES];
    }
    
    if (![webView canGoForward]) {
        [self.goForwardButton setEnabled:NO];
    } else {
        [self.goForwardButton setEnabled:YES];
    }
}

@end
