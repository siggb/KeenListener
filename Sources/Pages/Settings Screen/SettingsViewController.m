//
//  SettingsViewController.m
//  KeenListener
//
//  Created by Ildar Sibagatov on 16.04.14.
//  Copyright (c) 2014 Sig Inc. All rights reserved.
//

#import "SettingsViewController.h"
#import "GCDWebUploader.h"

#define LOG_ON 1

@interface SettingsViewController () <GCDWebUploaderDelegate>

@property (nonatomic) GCDWebUploader *webServer;

@property (nonatomic, weak) IBOutlet UIButton *startButton, *stopButton;

@end



@implementation SettingsViewController

- (void)initialize
{
    self.title = @"Settings";
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    [self.startButton setEnabled:YES];    
//    [self.stopButton setEnabled:NO];
}

#pragma mark - User Interaction Methods

- (IBAction)startButtonClicked:(id)sender
{
    DPLog(LOG_ON, @"");
    
    [self showScreenLoadingWithText:@"Server launched"];
    
    if (self.webServer == nil) {
        NSString* documents_path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        self.webServer = [[GCDWebUploader alloc] initWithUploadDirectory:documents_path];
        self.webServer.delegate = self;
        self.webServer.showHiddenFiles = YES;
    }
    
    [self.webServer start];
    
    [self.startButton setEnabled:NO];
    [self.stopButton setEnabled:YES];
    
    [SettingsManagerInstance setServerURL:self.webServer.serverURL];
    
    [self hideLoadingWithDelay:1.f];
}

- (IBAction)stopButtonClicked:(id)sender
{
    DPLog(LOG_ON, @"");
    
    [self.webServer stop];
    
    [self.startButton setEnabled:YES];
    [self.stopButton setEnabled:NO];
    
    [self showScreenLoadingWithText:@"Server stoped"];
    [self hideLoadingWithDelay:1.f];
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
