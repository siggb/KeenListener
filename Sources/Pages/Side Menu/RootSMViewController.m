//
//  RootSMViewController.m
//  KeenListener
//
//  Created by Ildar Sibagatov on 16.04.14.
//  Copyright (c) 2014 Sig Inc. All rights reserved.
//

#import "RootSMViewController.h"
#import "LeftSMViewController.h"

@implementation RootSMViewController

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
    DPLogFast(@"willShowMenuViewController: %@", NSStringFromClass([menuViewController class]));
}

- (void)sideMenu:(RESideMenu *)sideMenu didShowMenuViewController:(UIViewController *)menuViewController
{
    DPLogFast(@"didShowMenuViewController: %@", NSStringFromClass([menuViewController class]));
}

- (void)sideMenu:(RESideMenu *)sideMenu willHideMenuViewController:(UIViewController *)menuViewController
{
    DPLogFast(@"willHideMenuViewController: %@", NSStringFromClass([menuViewController class]));
}

- (void)sideMenu:(RESideMenu *)sideMenu didHideMenuViewController:(UIViewController *)menuViewController
{
    DPLogFast(@"didHideMenuViewController: %@", NSStringFromClass([menuViewController class]));
}

@end
