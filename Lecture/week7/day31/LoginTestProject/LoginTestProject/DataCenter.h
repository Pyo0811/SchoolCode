//
//  DataCenter.h
//  LoginTestProject
//
//  Created by youngmin joo on 2016. 5. 17..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *AUTO_LOGIN_KEY = @"auto_login";
static NSString *USER_ID_KEY = @"user_id";
static NSString *USER_LIST = @"user_list";

@interface DataCenter : NSObject

+ (id)sharedManager;

- (BOOL)joinUserID:(NSString *)userID userPW:(NSString *)userPW;
- (BOOL)haveUserID:(NSString *)userID userPW:(NSString *)userPW;

@property (nonatomic, getter=isUseAutoLogin) BOOL useAutoLogin;

//- (void)setAutoLogin:(BOOL)flag;
//- (BOOL)isAutoLogin;

@property (nonatomic, setter=setUserID:) NSString *userID;
//- (void)setUserID:(NSString *)userID;
//- (NSString *)userID;

@end
