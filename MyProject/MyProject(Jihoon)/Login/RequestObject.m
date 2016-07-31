//
//  RequestObject.m
//  MyProject
//
//  Created by Sejin Peo on 2016. 7. 18..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "RequestObject.h"
#import <AFNetworking.h>
#import "KeychainItemWrapper.h"
#import "UserInfo.h"

@interface RequestObject()

@property (strong, nonatomic) NSString *JWTToken;
@property (strong, nonatomic) UserInfo *userInfo;

@end

static NSString * const tokenRefreshURL  = @"https://airmap.travel-mk.com/refresh/";

@implementation RequestObject

+ (instancetype)sharedInstance{
    
    static RequestObject *requestObject = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
       
        requestObject = [[RequestObject alloc] init];
    });
    
    return requestObject;
}

- (void)requestLoginSession:(NSString *)userID password:(NSString *)userPW{
    
    NSString *URLString = @"https://sooljotta.com/api/users/login/";
    
    NSDictionary *parameters = @{@"email":userID, @"password":userPW};
    
    NSLog(@"param : %@",parameters);
    
    NSURLSessionConfiguration *configuartion =[NSURLSessionConfiguration defaultSessionConfiguration];
    NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:URLString parameters:parameters error:nil];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuartion];
    
    NSLog(@"%@",request.HTTPBody);
    
    
    
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response , id responseObject, NSError *error) {
        
        NSLog(@"%@\n이게 토큰값일까? %@", response, responseObject);
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        self.httpStatusCode = httpResponse.statusCode / 100;
        
        //성공
        if(self.httpStatusCode == 2){
            NSLog(@"success");
            // NSSUserDefaults로 토큰값 저장
            [[NSUserDefaults standardUserDefaults] setObject:responseObject forKey:@"LoginTokenValue"];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"LoginSuccess" object:nil];
            
            
        }
        
        if(self.httpStatusCode == 4){
            NSLog(@"fail");
            NSLog(@"실패했을 경우는 %ld",[self getHttpStatusCode]);
            [[NSNotificationCenter defaultCenter] postNotificationName:@"LoginFail" object:nil];
        }
    }];
    
    [dataTask resume];
}

- (NSInteger)getHttpStatusCode{
    
    return self.httpStatusCode;
}

-(void) daechung{
    KeychainItemWrapper *keyItemWrapper = [[KeychainItemWrapper alloc]initWithIdentifier:@"AppService" accessGroup:nil];
    //String To Data
    NSString *password = @"11111";
    NSData *pwdData = [password dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *token = @"dhoaslkdjflkj.asdkcajdoq1023012";
    
    //JSON To Data
    NSDictionary *dict = @{@"password":password , @"token":token};
    
    NSData *pwdData2 = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
                        
    
    
    [keyItemWrapper setObject:@"www@www.com" forKey:(__bridge id)kSecAttrAccount];
    [keyItemWrapper setObject:pwdData2 forKey:(__bridge id)kSecValueData];
    
    
    NSString *userId = [keyItemWrapper objectForKey:(__bridge id)kSecAttrAccount];
    //NSString *passwd = [keyItemWrapper objectForKey:(__bridge id)kSecValueData];
    //NSDictionary *json = [NSJSONSerialization JSONObjectWithData:pwdData2 options:0 error:0];
    
    NSString *passwd = [[NSString alloc] initWithData:pwdData2 encoding:NSASCIIStringEncoding];
    
    NSLog(@"%@",userId);
    NSLog(@"%@",passwd);
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 현재 로그인 중인 회원의 아이디값 가져오기
        KeychainItemWrapper *keychainItem = [[KeychainItemWrapper alloc] initWithIdentifier:@"AppLogin" accessGroup:nil];
        NSString *keyChainUser_id = [keychainItem objectForKey: (__bridge id)kSecAttrAccount];
        //현재 로그인 중인 회원정보 가져오기
        //RLMResults *resultArray = [UserInfo objectsWhere:@"user_id == %@", keyChainUser_id];
        //self.userInfo = resultArray[0];
        // @앞 아이디가져오기
        NSArray *idArray = [self.userInfo.user_id componentsSeparatedByString:@"@"];
        self.userID = [idArray firstObject];
        //        // filename Unique 만들기
        //        self.fileNameForUnique = [NSString stringWithFormat:@"%@_%@", self.userId, [TravelActivation defaultInstance].travelList.travel_title_unique];
        //        NSLog(@"%@", self.fileNameForUnique);
        // 토큰값 가져오기
        self.JWTToken = [@"JWT " stringByAppendingString:self.userInfo.user_token];
        NSLog(@"%@", self.JWTToken);
    }
    return self;
}

#pragma - mark <Refresh Requst>

// Token Refersh 리퀘스트
- (void)requestTokenRefresh {
    
    NSLog(@"Start token refesh");
    
    NSDictionary *tokenToRefesh = @{@"token":self.userInfo.user_token};
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [manager POST:tokenRefreshURL parameters:tokenToRefesh
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NSLog(@"Token refesh success: %@", responseObject);
          } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              NSLog(@"Token refesh error: %@", error);
          }];
    
}

@end
