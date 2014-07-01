//
//  AppDelegate.m
//  week2-2-demo
//
//  Created by jmilam on 6/26/14.
//  Copyright (c) 2014 Jen Milam. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
/*#import "FeedViewController.h"
#import "RequestsViewController.h"
#import "MessagesViewController.h"
#import "NotificationsViewController.h"
#import "MenuViewController.h"
*/

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.

    LoginViewController *loginViewController = [[LoginViewController alloc] init];
    UINavigationController *loginNavigationController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    loginNavigationController.tabBarItem.title = @"Feed";
    loginNavigationController.tabBarItem.image = [UIImage imageNamed:@"feed-selected"];

    
/*    // Create the view controllers, each within a navigation controller
    FeedViewController *feedViewController = [[FeedViewController alloc] init];
    UINavigationController *feedNavigationController = [[UINavigationController alloc] initWithRootViewController:feedViewController];
    feedNavigationController.tabBarItem.title = @"Feed";
    feedNavigationController.tabBarItem.image = [UIImage imageNamed:@"feed-selected"];
    
    RequestsViewController *requestsViewController = [[RequestsViewController alloc] init];
    UINavigationController *requestsNavigationController = [[UINavigationController alloc] initWithRootViewController:requestsViewController];
    requestsNavigationController.tabBarItem.title = @"Requests";
    requestsNavigationController.tabBarItem.image = [UIImage imageNamed:@"requests-unselected"];
    
    MessagesViewController *messagesViewController = [[MessagesViewController alloc] init];
    UINavigationController *messagesNavigationController = [[UINavigationController alloc] initWithRootViewController:messagesViewController];
    messagesNavigationController.tabBarItem.title = @"Messages";
    messagesNavigationController.tabBarItem.image = [UIImage imageNamed:@"messages-unselected"];
    
    NotificationsViewController *notificationsViewController = [[NotificationsViewController alloc] init];
    UINavigationController *notificationsNavigationController = [[UINavigationController alloc] initWithRootViewController:notificationsViewController];
    notificationsNavigationController.tabBarItem.title = @"Notifications";
    notificationsNavigationController.tabBarItem.image = [UIImage imageNamed:@"notify-unselected"];
    
    MenuViewController *menuViewController = [[MenuViewController alloc] init];
    UINavigationController *menuNavigationController = [[UINavigationController alloc] initWithRootViewController:menuViewController];
    menuNavigationController.tabBarItem.title = @"Menu";
    menuNavigationController.tabBarItem.image = [UIImage imageNamed:@"menu-unselected"];
    
    // Configure the tab bar controller with the two navigation controllers
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[feedNavigationController, requestsNavigationController, messagesNavigationController, notificationsNavigationController, menuNavigationController];

    //self.window.rootViewController = tabBarController;
 */
    self.window.rootViewController = loginViewController;

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
