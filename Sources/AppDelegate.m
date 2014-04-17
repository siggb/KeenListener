//
//  AppDelegate.m
//  KeenListener
//
//  Created by Ildar Sibagatov on 15.04.14.
//  Copyright (c) 2014 Sig Inc. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (id)init
{
	if ((self = [super init]))
    {
        // initialising main server instance
        self.webServerInstance = [WebServerManager new];
    }
    return self;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    [self configureNavigationBarAppearance];
    
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

#pragma mark - Application Appearance

- (void)configureNavigationBarAppearance
{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    NSString *img_name = @"NavbarImage";
    
    // iOS 7 navbar has 64px height (instead of 44px)
    if (CurrentIOSVersion >= 7.f) {
        img_name = [img_name stringByAppendingString:@"Big"];
    }
    
    UIImage *navbar_image = [[UIImage imageNamed:img_name] resizableImageWithCapInsets:UIEdgeInsetsZero
                                                                          resizingMode:UIImageResizingModeStretch];
    [[UINavigationBar appearance] setBackgroundImage:navbar_image forBarMetrics:UIBarMetricsDefault];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:DefaultRegularFont(21),
                                                           NSForegroundColorAttributeName:BlueColor}];
    
    [[UINavigationBar appearance] setShadowImage:[UIImage imageNamed:@"NavbarShadowLine"]];
    [[UINavigationBar appearance] setTitleVerticalPositionAdjustment:0.f
                                                       forBarMetrics:UIBarMetricsDefault];
}

@end
