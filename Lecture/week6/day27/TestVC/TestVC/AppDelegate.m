//
//  AppDelegate.m
//  TestVC
//
//  Created by Sejin Peo on 2016. 5. 31..
//  Copyright © 2016년 Ubinet. All rights reserved.
//

#import "AppDelegate.h"
#import "SecondViewController.h"
#import "MyViewController2.h"
#import "MyViewController3.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    self.window = [UIWindow alloc];
//    UIScreen *screen = [UIScreen mainScreen];
//    CGRect nowRect = screen.bounds;
//    self.window = [self.window initWithFrame:nowRect];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //SecondViewController *sedVC = [[SecondViewController alloc] initWithNibName:@"SecondViewController.xib" bundle:nil]; 원래규정
    SecondViewController *sedVC = [[SecondViewController alloc] init];
    UINavigationController *naviVC = [[UINavigationController alloc] initWithRootViewController:sedVC];
    
    self.window.rootViewController = naviVC;
    [self.window makeKeyAndVisible];
    // 화면에 업데이트 함 실질적으로 보여주게함
    
//    UITabBarController *tabBarController = [[UITabBarController alloc] init];
//    
//    //VC1
//    SecondViewController *sedVC = [[SecondViewController alloc] init];
//        UINavigationController *naviVC = [[UINavigationController alloc] initWithRootViewController:sedVC];
//    //VC2
//    MyViewController2 *vc2 = [[MyViewController2 alloc] init];
//    
//    //VC3
//    MyViewController3 *vc3 = [[MyViewController3 alloc] init];
//    
//    NSArray *controllers = [NSArray arrayWithObjects:naviVC,vc2,vc3, nil];
//    
//    tabBarController.viewControllers = controllers;
//    
//    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    self.window.rootViewController = tabBarController;
//    [self.window makeKeyAndVisible];
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
