//
//  WebServerManager.m
//  KeenListener
//
//  Created by Ildar Sibagatov on 17.04.14.
//  Copyright (c) 2014 Sig Inc. All rights reserved.
//

#import "WebServerManager.h"
#import "GCDWebUploader.h"

#define LOG_ON 1

@interface WebServerManager() <GCDWebUploaderDelegate>

@property (nonatomic) GCDWebUploader *webServer;

@end



@implementation WebServerManager

- (id)init
{
    DPLog(LOG_ON, @"");
    
    self = [super init];
    if (self) {
        NSString* documents_path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        self.webServer = [[GCDWebUploader alloc] initWithUploadDirectory:documents_path];
        self.webServer.delegate = self;
        self.webServer.showHiddenFiles = YES;
    }
    return self;
}

- (void)start
{
    DPLog(LOG_ON, @"");
    
    [self.webServer start];
    
    [SettingsManagerInstance setServerURL:self.webServer.serverURL];
    [SettingsManagerInstance setServerPort:@([self.webServer port])];
    [SettingsManagerInstance setServerAddress:[self.webServer.serverURL host]];
    [SettingsManagerInstance setServerDirectoryPath:@"/var/user/applications/keenlistener/.."];
}

- (void)stop
{
    DPLog(LOG_ON, @"");
    
    if ([self.webServer isRunning])
        [self.webServer stop];
}

- (BOOL)isRunning
{
    return [self.webServer isRunning];
}

#pragma mark - GCDWebUploader Delegate Methods

- (void)webUploader:(GCDWebUploader*)uploader didUploadFileAtPath:(NSString*)path
{
    DPLog(LOG_ON, @"[UPLOAD] %@", path);
}

- (void)webUploader:(GCDWebUploader*)uploader didMoveItemFromPath:(NSString*)fromPath toPath:(NSString*)toPath
{
    DPLog(LOG_ON, @"[MOVE] %@ -> %@", fromPath, toPath);
}

- (void)webUploader:(GCDWebUploader*)uploader didDeleteItemAtPath:(NSString*)path
{
    DPLog(LOG_ON, @"[DELETE] %@", path);
}

- (void)webUploader:(GCDWebUploader*)uploader didCreateDirectoryAtPath:(NSString*)path
{
    DPLog(LOG_ON, @"[CREATE] %@", path);
}

@end
