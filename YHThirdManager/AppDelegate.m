//
//  AppDelegate.m
//  YHThirdManager
//
//  Created by 银河 on 2019/3/10.
//  Copyright © 2019 yinhe. All rights reserved.
//

#import "AppDelegate.h"
#import "YHQQManager.h"
#import "YHWXManager.h"
#import "YHSinaManager.h"
#import "SDK.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    [[YHWXManager sharedInstance] initWithAppID:QAQ_WECHAT_APP_ID appSecret:QAQ_WECHAT_APP_SECRET];
    
    [[YHQQManager sharedInstance] initWithAppID:QAQ_QQ_APP_ID];
    
    [[YHSinaManager sharedInstance] initWithAppID:QAQ_SINA_APP_KEY redirectURI:QAQ_SINA_Redirect_URL];
    
    return YES;
}

// 9.0之后
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    [[YHWXManager sharedInstance] handleOpenURL:url];
    [[YHQQManager sharedInstance] handleOpenURL:url];
    [[YHSinaManager sharedInstance] handleOpenURL:url];
    return YES;
}

// 9.0之前
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    [[YHWXManager sharedInstance] handleOpenURL:url];
    [[YHQQManager sharedInstance] handleOpenURL:url];
    [[YHSinaManager sharedInstance] handleOpenURL:url];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
