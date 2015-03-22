//
//  MackenzieAppDelegate.m
//  Navigation
//
//  Created by Vinicius Miana on 2/21/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "MackenzieAppDelegate.h"

@implementation MackenzieAppDelegate

@synthesize palavrasTableController;
@synthesize tabBarController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    // init view 
    LetrasViewController *viewController = [[LetrasViewController alloc]
                                           initWithNibName:nil
                                           bundle:nil];
    // init table
    palavrasTableController = [[PalavrasTableViewController alloc] init];
    
    // init Navigation
    self.navigationController = [[UINavigationController alloc]
                                 initWithRootViewController:viewController];
    
    // init TabBarController
    tabBarController = [[UITabBarController alloc] init];
    
    // set Array TabBarController
    tabBarController.ViewControllers = @[self.navigationController, palavrasTableController];
    
    // set Titles on TabBarController Items
    [[tabBarController.tabBar.items objectAtIndex:0]setTitle:@"Letra"];
    [[tabBarController.tabBar.items objectAtIndex:1]setTitle:@"Dicionário"];
    
    
    // set Images on TabBarController Images
    [[tabBarController.tabBar.items objectAtIndex:0] setImage:[UIImage imageNamed:@"abc"]];
    [[tabBarController.tabBar.items objectAtIndex:1] setImage:[UIImage imageNamed:@"dicionario"]];
    
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = tabBarController;

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
