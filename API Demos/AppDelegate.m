//
//  AppDelegate.m
//  API DEMO
//
//  Created by Arrak Rukkharat on 11/17/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "AppDelegate.h"
#import "MBAPI.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Setup source credentials
    SourceCredentials *src = [SourceCredentials sharedInstance];
    src.SourceName = @"SourceName"; // Your API source names goes here
    src.Password = @"password"; // The source password goes here
    src.SiteID = @"-99"; // The site/studio ID
    
    // Only do this once unless you want to change the credentials
    UserCredentials *user = [UserCredentials sharedInstance];
    user.Username = @"Username"; // Consumer/Staff/Owner credentials
    user.Password = @"password"; // The password
    user.SiteID = @"-99";
    
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.viewController = [[MainViewController alloc] init];
    
    self.navBar = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    self.navBar.navigationBar.translucent = NO;
    self.navBar.navigationBar.tintColor = [UIColor whiteColor];
    
    // Custom appearence
    [[UINavigationBar appearance] setBarTintColor:[UIColor orangeColor]];
    
    [[UITextField appearance] setKeyboardAppearance:UIKeyboardAppearanceDefault];
    self.window.rootViewController = self.navBar;
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
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
