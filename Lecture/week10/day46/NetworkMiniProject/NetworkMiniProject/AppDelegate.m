//
//  AppDelegate.m
//  NetworkMiniProject
//
//  Created by Sejin Peo on 2016. 6. 22..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSURL *infoURL = [[NSBundle mainBundle] URLForResource:@"Info" withExtension:@"plist"];
    NSDictionary *infoDic = [NSDictionary dictionaryWithContentsOfURL:infoURL];
    
    NSLog(@"%@",infoDic);
    
    NSLog(@"%@",infoDic[@"CFBundleVersionShortString"]);
    
    NSLog(@"My name is %@",projectConstantMyName);
    
    NSLog(@"언제나 보일 수 있는 로그");
    LOG_LEV_ONE(@"로그 레벨 1 : 플로우만 체크하는 로그");
    LOG_LEV_TWO(@"로그 레벨 2 : 조금 더 깊은 내용의 로그");
    
/*
#ifdef DEBUG
    
    NSLog(@"It's debug mode!!");

#else
    
    NSLog(@"It's a release mode !!");
    
#endif
*/
    
/*
    NSString *OSVersion = [[UIDevice currentDevice] systemVersion];
    NSString *device = [[UIDevice currentDevice] model];
    NSLog(@"System version : %@ device : %@",OSVersion,device);
    
    CGFloat OSVersionFloat = [OSVersion floatValue];
    
    if(OSVersionFloat >= 9.0) {
        NSLog(@"iOS 9");
    }else if(OSVersionFloat >= 8.0){
        NSLog(@"iOS 8");
    }else{
        NSLog(@"under iOS 8");
    }
    
    UIGestureRecognizer *recognizer = [[UIGestureRecognizer alloc] init];
    
    if([recognizer respondsToSelector:@selector(allowedTouchTypes)]){
        NSLog(@"can use allowedTouchTypes");
    }else{
        NSLog(@"can not use allowedTouchTypes");
    }
 */   
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
