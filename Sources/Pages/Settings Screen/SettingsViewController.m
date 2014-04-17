//
//  SettingsViewController.m
//  KeenListener
//
//  Created by Ildar Sibagatov on 16.04.14.
//  Copyright (c) 2014 Sig Inc. All rights reserved.
//

#import "SettingsViewController.h"

#define LOG_ON 1
#define kServerStatusIdle       @"IDLE"
#define kServerStatusRuning     @"RUNNING"

@interface SettingsViewController ()

@property (nonatomic, weak) IBOutlet UIButton *startButton, *stopButton;
@property (nonatomic, weak) IBOutlet UITextField *addressField, *portField, *directoryField;
@property (nonatomic, weak) IBOutlet UILabel *serverStatusLabel;

@end



@implementation SettingsViewController

- (void)initialize
{
    self.title = @"Settings";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.addressField setUserInteractionEnabled:NO];
    [self.portField setUserInteractionEnabled:NO];
    [self.directoryField setUserInteractionEnabled:NO];
    
    [self.addressField setText:@""];
    [self.portField setText:@""];
    [self.directoryField setText:@""];
    
    [self.serverStatusLabel setText:kServerStatusIdle];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self updateServerAppearence];
}

#pragma mark - Private Class Methods

- (void)updateServerAppearence
{
    if ([WebServerInstance isRunning]) {
        [self.startButton setEnabled:NO];
        [self.stopButton setEnabled:YES];
        
        [self.addressField setText:[SettingsManagerInstance serverAddress]];
        [self.portField setText:[[SettingsManagerInstance serverPort] stringValue]];
        [self.directoryField setText:[SettingsManagerInstance serverDirectoryPath]];
        
        [self.serverStatusLabel setText:kServerStatusRuning];
    }
    else {
        [self.startButton setEnabled:YES];
        [self.stopButton setEnabled:NO];
        
        [self.addressField setText:@""];
        [self.portField setText:@""];
        [self.directoryField setText:@""];
        
        [self.serverStatusLabel setText:kServerStatusIdle];
    }
}

#pragma mark - User Interaction Methods

- (IBAction)startButtonClicked:(id)sender
{
    DPLog(LOG_ON, @"");
    
    [self showScreenLoadingWithText:@"Server launched"];
    
    [WebServerInstance start];
    
    [self updateServerAppearence];
    
    [self hideLoadingWithDelay:1.f];
}

- (IBAction)stopButtonClicked:(id)sender
{
    DPLog(LOG_ON, @"");
    
    [WebServerInstance stop];
    
    [self updateServerAppearence];
    
    [self showScreenLoadingWithText:@"Server stoped"];
    [self hideLoadingWithDelay:1.f];
}

@end
