//
//  RootSMViewController.m
//  KeenListener
//
//  Created by Ildar Sibagatov on 16.04.14.
//  Copyright (c) 2014 Sig Inc. All rights reserved.
//

#import "RootSMViewController.h"
#import "LeftSMViewController.h"

#define LOG_ON 0

@implementation RootSMViewController

#pragma mark - View Lifecycle

- (void)awakeFromNib
{
    self.menuPreferredStatusBarStyle = UIStatusBarStyleLightContent;
    self.contentViewShadowColor = [UIColor blackColor];
    self.contentViewShadowOffset = CGSizeMake(0, 0);
    self.contentViewShadowOpacity = 0.6;
    self.contentViewShadowRadius = 12;
    self.contentViewShadowEnabled = YES;
    
    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:ContentSMViewControllerId];
    self.leftMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:LeftSMViewControllerId];
    
    self.backgroundImage = [UIImage imageNamed:@"WWDC2"];
    self.delegate = self;
}

#pragma mark - RESideMenu Delegate Methods

- (void)sideMenu:(RESideMenu *)sideMenu willShowMenuViewController:(UIViewController *)menuViewController
{
    DPLog(LOG_ON, @"willShowMenuViewController: %@", NSStringFromClass([menuViewController class]));
}

- (void)sideMenu:(RESideMenu *)sideMenu didShowMenuViewController:(UIViewController *)menuViewController
{
    DPLog(LOG_ON, @"didShowMenuViewController: %@", NSStringFromClass([menuViewController class]));
}

- (void)sideMenu:(RESideMenu *)sideMenu willHideMenuViewController:(UIViewController *)menuViewController
{
    DPLog(LOG_ON, @"willHideMenuViewController: %@", NSStringFromClass([menuViewController class]));
}

- (void)sideMenu:(RESideMenu *)sideMenu didHideMenuViewController:(UIViewController *)menuViewController
{
    DPLog(LOG_ON, @"didHideMenuViewController: %@", NSStringFromClass([menuViewController class]));
}

@end
