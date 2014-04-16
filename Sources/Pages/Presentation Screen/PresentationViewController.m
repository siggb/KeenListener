//
//  PresentationViewController.m
//  KeenListener
//
//  Created by Ildar Sibagatov on 16.04.14.
//  Copyright (c) 2014 Sig Inc. All rights reserved.
//

#import "PresentationViewController.h"

@interface PresentationViewController ()

@property (nonatomic, weak) IBOutlet UIWebView *webView;

@end

@implementation PresentationViewController

- (void)initialize
{
    self.title = @"Presentation";
}

#pragma mark - View Lifecycle

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[SettingsManagerInstance serverURL]]];
}

@end
