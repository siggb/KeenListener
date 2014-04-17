//
//  SettingsManager.h
//  KeenListener
//
//  Created by Ildar Sibagatov on 17.04.14.
//  Copyright (c) 2014 Sig Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingsManager : NSObject

@property (nonatomic) NSURL * serverURL;

@property (nonatomic) NSString * serverAddress;
@property (nonatomic) NSNumber * serverPort;
@property (nonatomic) NSString * serverDirectoryPath;

@property (nonatomic) BOOL * isServerLaunched;

/** Singtone Instance  */
+ (SettingsManager *)instance;

@end
