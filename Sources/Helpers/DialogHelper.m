//
//  DialogHelper.m
//  KeenListener
//
//  Created by Ildar Sibagatov on 15.04.14.
//  Copyright (c) 2014 Sig Inc. All rights reserved.
//

#import "DialogHelper.h"

@implementation DialogHelper

+ (UIAlertView*)showRequestError
{
    return [self showError:@"Something went wrong"];
}

+ (UIAlertView*)showLostConnectionError
{
    return [self showError:@"Lost connection"];
}

+ (UIAlertView*)showTimeoutError
{
    return [self showError:@"Request timed out"];
}

+ (UIAlertView*)showError:(NSString*)text
{
    return [self showError:text withDelegate:nil];
}

+ (UIAlertView*)showError:(NSString*)text withDelegate:(id<UIAlertViewDelegate>)delegate
{
    UIAlertView *alert_view = [[UIAlertView alloc] initWithTitle:@"Error"
                                                         message:text
                                                        delegate:delegate
                                               cancelButtonTitle:@"Cancel"
                                               otherButtonTitles:nil];
	[alert_view show];
    return alert_view;
}

+ (UIAlertView*)showMessage:(NSString*)text
{
    return [self showMessage:text withDelegate:nil];
}

+ (UIAlertView*)showMessage:(NSString*)text withDelegate:(id<UIAlertViewDelegate>)delegate
{
    return [self showMessage:text withTitle:nil delegate:delegate];
}

+ (UIAlertView*)showMessage:(NSString*)text withTitle:(NSString*)title
{
    return [self showMessage:text withTitle:title delegate:nil];
}

+ (UIAlertView*)showMessage:(NSString*)text withTitle:(NSString*)title delegate:(id<UIAlertViewDelegate>)delegate
{
    UIAlertView *alert_view = [[UIAlertView alloc] initWithTitle:title
                                                         message:text
                                                        delegate:delegate
                                               cancelButtonTitle:@"Cancel"
                                               otherButtonTitles:nil];
	[alert_view show];
    return alert_view;
}

+ (UIAlertView*)showConfirmMessage:(NSString*)text delegate:(id<UIAlertViewDelegate>)delegate
{
    return [self showConfirmMessage:text withTitle:nil delegate:delegate];
}

+ (UIAlertView*)showConfirmMessage:(NSString *)text withTitle:(NSString *)title delegate:(id<UIAlertViewDelegate>)delegate
{
    UIAlertView *alert_view = [[UIAlertView alloc] initWithTitle:title
                                                         message:text
                                                        delegate:delegate
                                               cancelButtonTitle:@"Cancel"
                                               otherButtonTitles:@"Yes", nil];
	[alert_view show];
    return alert_view;
}

@end




