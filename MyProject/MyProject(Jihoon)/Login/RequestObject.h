//
//  RequestObject.h
//  MyProject
//
//  Created by Sejin Peo on 2016. 7. 18..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RequestObject : NSObject

@property(nonatomic,strong) NSString *userID;
@property(nonatomic,strong) NSString *userPW;
@property(nonatomic,assign) NSInteger httpStatusCode;

+ (instancetype)sharedInstance;
- (void)requestLoginSession:(NSString *)userID password:(NSString *)userPW;
- (NSInteger)getHttpStatusCode;
-(void) daechung;
// token refesh
- (void)requestTokenRefresh;


@end
