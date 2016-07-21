//
//  DataCentre.m
//  LoadDataProject
//
//  Created by Sejin Peo on 2016. 6. 2..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import "DataCentre.h"

@implementation DataCentre

+(instancetype)sharedInstance
{
    static DataCentre *dataCentre = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCentre = [[DataCentre alloc] init];
    });
    
    
    return dataCentre;
}

-(NSArray *) friendList
{

    // 1. 파일 불러오기 (Document folder)
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = [paths objectAtIndex:0];
    NSString *docuPath = [basePath stringByAppendingPathComponent:@"friendList.plist"];
    
//    // 2. Document folder에 파일 있는지 확인
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    if(![fileManager fileExistsAtPath:docuPath]){
//        
//        // 3. 파일이 없을 경우 bundle에 있는 파일 Document에 복사
//        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"friendList" ofType:@"plist"];
//        [fileManager copyItemAtPath:bundlePath toPath:docuPath error:nil];
//    }
//    
    NSArray *friendList = [NSArray arrayWithContentsOfFile:docuPath];
    return friendList;
    
    /*
     불러오기
     */
}

- (void)addFriendInfo:(NSString *)name phone:(NSString *)phone
{
    // 1. 파일 불러오기 (Document folder) 객체로 만듬
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = [paths objectAtIndex:0];
    NSString *docuPath = [basePath stringByAppendingPathComponent:@"friendList.plist"];
    
    // 2. Document folder에 파일 있는지 확인
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:docuPath]){
        
        // 3. 파일이 없을 경우 bundle에 있는 파일 Document에 복사
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"friendList" ofType:@"plist"];
        [fileManager copyItemAtPath:bundlePath toPath:docuPath error:nil];
    }
    
    // 4. 파일Path를 통해 객체로 변환, 데이터 불러오기
    NSMutableArray *friendList = [NSMutableArray arrayWithContentsOfFile:docuPath];
    NSDictionary *newFriend =  @{@"name":name, @"phone":phone};
    
    // 5. writtToFile메소드를 통해 파일 저장
    [friendList addObject:newFriend];
    [friendList writeToFile:docuPath atomically:NO];
    
    /*
     저장하기
     */
}

@end
