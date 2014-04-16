//
//  SettingsManager.m
//  KeenListener
//
//  Created by Ildar Sibagatov on 17.04.14.
//  Copyright (c) 2014 Sig Inc. All rights reserved.
//

#import "SettingsManager.h"
#import "DPLog.h"

#define LOG_ON 1
#define kSettingsManagerServerAddressKey    @"kSettingsManagerServerAddressKey"
#define kSettingsManagerServerPortKey       @"kSettingsManagerServerPortKey"
#define kSettingsManagerServerDirectoryKey  @"kSettingsManagerServerDirectoryKey"


@implementation SettingsManager

#pragma mark - Initialization

+ (SettingsManager *)instance
{
    static SettingsManager *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [SettingsManager new];
    });
    
    return _instance;
}

- (id)init
{
    DPLog(LOG_ON, @"");
    
    self = [super init];
    if (self) {
        // init singltone properties
        self.serverAddress = [[NSUserDefaults standardUserDefaults] objectForKey:kSettingsManagerServerAddressKey];
        self.serverPort = [[NSUserDefaults standardUserDefaults] objectForKey:kSettingsManagerServerPortKey];
        self.serverDirectoryPath = [[NSUserDefaults standardUserDefaults] objectForKey:kSettingsManagerServerDirectoryKey];
        
        // [[NSUserDefaults standardUserDefaults] setObject:self.serverAddress forKey:kSettingsManagerServerAddressKey];
    }
    return self;
}

@end
