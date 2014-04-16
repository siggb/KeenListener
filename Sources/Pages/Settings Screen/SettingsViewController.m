//
//  SettingsViewController.m
//  KeenListener
//
//  Created by Ildar Sibagatov on 16.04.14.
//  Copyright (c) 2014 Sig Inc. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)initialize
{
    self.title = @"Settings";
}

- (void)sidebarButtonClicked
{
    [self presentLeftMenuViewController:self];
}

@end
