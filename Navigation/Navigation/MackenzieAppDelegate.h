//
//  MackenzieAppDelegate.h
//  Navigation
//
//  Created by Vinicius Miana on 2/21/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PalavrasTableViewController.h"
#import "LetrasViewController.h"

@interface MackenzieAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) UINavigationController *navigationController;
@property (strong, nonatomic) PalavrasTableViewController *palavrasTableController;
@property (strong, nonatomic) UITabBarController* tabBarController;


@end
