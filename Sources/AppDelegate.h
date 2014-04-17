//
//  AppDelegate.h
//  KeenListener
//
//  Created by Ildar Sibagatov on 15.04.14.
//  Copyright (c) 2014 Sig Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WebServerManager;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/** Web Server Instance */
@property (strong, nonatomic) WebServerManager *webServerInstance;

@end
