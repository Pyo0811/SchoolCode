//
//  DataCentre.h
//  LoadDataProject
//
//  Created by Sejin Peo on 2016. 6. 2..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCentre : NSObject

-(NSArray *) friendList;

+(instancetype)sharedInstance;

- (void)addFriendInfo:(NSString *)name phone:(NSString *)phone;

@end
