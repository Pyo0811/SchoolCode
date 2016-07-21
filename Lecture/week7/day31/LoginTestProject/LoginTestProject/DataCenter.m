//
//  DataCenter.m
//  LoginTestProject
//
//  Created by youngmin joo on 2016. 5. 17..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import "DataCenter.h"



@implementation DataCenter



+ (id)sharedManager {
    static DataCenter *sharedMyManager = nil;
    
    static dispatch_once_t onceToken;
    
    NSLog(@"default :// dispatch_once_t %ld",onceToken);
    
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
    
}
/*
    {
        userID:NSString
        userPW:NSString
    }
*/
#pragma mark - plist DATA CONTROL
- (void)saveUserData:(NSDictionary *)data
{
    //directory paths가져오기
    //NSUserDomainMask = 1,       // user's home directory --- place to install user's personal items (~)
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //Documants directory base
    NSString *basePath = [paths objectAtIndex:0];
    //file path
    NSString *contentsPath = [basePath stringByAppendingPathComponent:@"UserList.plist"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:contentsPath])
    {//파일이 존재 하지 않는다면 새로 bundle에 있는 파일 복사
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"UserList" ofType:@"plist"];
        [fileManager copyItemAtPath:bundlePath toPath:contentsPath error:nil];
    }
    
    NSMutableDictionary *dataDic = [NSMutableDictionary dictionaryWithContentsOfFile:contentsPath];
    
    NSMutableArray *list = [NSMutableArray arrayWithArray:[dataDic objectForKey:USER_LIST]];
    [list addObject:data];
    
    [dataDic setObject:list forKey:USER_LIST];
    [dataDic writeToFile:contentsPath atomically:YES];
}

- (NSArray *)loadUserData
{
    //directory paths가져오기
    //NSUserDomainMask = 1,       // user's home directory --- place to install user's personal items (~)
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //Documants directory base
    NSString *basePath = [paths objectAtIndex:0];
    //file path
    NSString *contentsPath = [basePath stringByAppendingPathComponent:@"UserList.plist"];
    
    NSDictionary *dataDic = [NSDictionary dictionaryWithContentsOfFile:contentsPath];
    NSArray *list = [NSArray arrayWithArray:[dataDic objectForKey:USER_LIST]];
    return  list;
}

#pragma mark - SIGNUP
- (BOOL)joinUserID:(NSString *)userID userPW:(NSString *)userPW
{//유저 저장
    NSArray *user_list = [self loadUserData];
    //이미 있는 유저인지 확인
    BOOL isHave = NO;
    for(NSDictionary *userDic in user_list)
    {
        NSString *selectID = [userDic objectForKey:@"userID"];
        if ([selectID isEqualToString:userID])
        {
            isHave =  YES;
        }else
        {
            isHave =  NO;
        }
    }
    
    if (!isHave) {
        NSDictionary *dic = @{@"userID":userID,@"userPW":userPW};
        [self saveUserData:dic];
        return YES;
    }else
    {
        return NO;
    }
}


- (BOOL)haveUserID:(NSString *)userID userPW:(NSString *)userPW
{
    NSArray *user_list = [self loadUserData];
    
    
    for(NSDictionary *userDic in user_list)
    {
        NSString *selectID = [userDic objectForKey:@"userID"];
        NSString *selectPW = [userDic objectForKey:@"userPW"];
        
        if ([selectID isEqualToString:userID] && [selectPW isEqualToString:userPW])
        {
            return YES;
        }
        
    }
    
    return NO;
}



#pragma mark - AUTOLOGIN
/*
 //AUTO LOGIN
 */
- (void)setUseAutoLogin:(BOOL)flag
{
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:flag] forKey:AUTO_LOGIN_KEY];
}

- (BOOL)useAutoLogin
{
    
    NSNumber *autoLoginValue = [[NSUserDefaults standardUserDefaults] objectForKey:AUTO_LOGIN_KEY];
    if (autoLoginValue == nil) {
        return NO;
    }
    
    return [autoLoginValue boolValue];
}


#pragma mark - set UserID

- (void)setUserID:(NSString *)userID
{
    [[NSUserDefaults standardUserDefaults] setObject:userID forKey:USER_ID_KEY];
}

- (NSString *)userID
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:USER_ID_KEY];
}

@end
