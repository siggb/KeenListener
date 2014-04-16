//
//  RootViewController.h
//  KeenListener
//
//  Created by Ildar Sibagatov on 15.04.14.
//  Copyright (c) 2014 Sig Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController
{
    MBProgressHUD *indicator;
}

- (void)initialize;
- (void)backButtonClicked;
- (void)sidebarButtonClicked;

/// -----------------------------------------------------------------------
/// @name Indicating loading process
/// -----------------------------------------------------------------------

- (void)showLoading;
- (void)showScreenLoading;
- (void)showScreenLoadingWithText:(NSString*)text;
- (void)changeLoadingText:(NSString*)text;
- (void)hideLoading;
- (void)hideLoadingWithDelay:(NSTimeInterval)delay;

/// -----------------------------------------------------------------------
/// @name Animating a change in the orientation
/// -----------------------------------------------------------------------

- (BOOL)isPortraitOrientation;
- (BOOL)isPortraitOrientation:(UIInterfaceOrientation)toInterfaceOrientation;

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration;
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration;
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation;

/// -----------------------------------------------------------------------
/// @name Storyboard methods
/// -----------------------------------------------------------------------

- (id)viewControllerWithIdentifier:(NSString *)identifier;

@end
