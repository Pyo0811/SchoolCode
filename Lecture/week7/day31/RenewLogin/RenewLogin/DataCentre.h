//
//  DataCentre.h
//  Login
//
//  Created by Sejin Peo on 2016. 6. 7..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *AUTO_LOGIN_KEY = @"auto_login";
static NSString *USER_ID_KEY = @"user_id";
static NSString *USER_LIST = @"user_list";

@interface DataCentre : NSObject

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
