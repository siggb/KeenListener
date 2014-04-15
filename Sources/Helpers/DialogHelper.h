//
//  DialogHelper.h
//  KeenListener
//
//  Created by Ildar Sibagatov on 15.04.14.
//  Copyright (c) 2014 Sig Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DialogHelper : NSObject

+ (UIAlertView*)showRequestError;
+ (UIAlertView*)showLostConnectionError;
+ (UIAlertView*)showTimeoutError;
+ (UIAlertView*)showError:(NSString*)text;
+ (UIAlertView*)showError:(NSString*)text withDelegate:(id)delegate;
+ (UIAlertView*)showMessage:(NSString*)text;
+ (UIAlertView*)showMessage:(NSString*)text withDelegate:(id)delegate;
+ (UIAlertView*)showMessage:(NSString*)text withTitle:(NSString*)title;
+ (UIAlertView*)showMessage:(NSString*)text withTitle:(NSString*)title delegate:(id)delegate;
+ (UIAlertView*)showConfirmMessage:(NSString*)text delegate:(id<UIAlertViewDelegate>)delegate;
+ (UIAlertView*)showConfirmMessage:(NSString *)text withTitle:(NSString *)title delegate:(id<UIAlertViewDelegate>)delegate;

@end
