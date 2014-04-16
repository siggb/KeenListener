//
//  FeedbackViewController.m
//  KeenListener
//
//  Created by Ildar Sibagatov on 16.04.14.
//  Copyright (c) 2014 Sig Inc. All rights reserved.
//

#import "FeedbackViewController.h"

@interface FeedbackViewController ()

@end

@implementation FeedbackViewController

- (void)initialize
{
    self.title = @"Feedback";
}

- (void)sidebarButtonClicked
{
    [self presentLeftMenuViewController:self];
}

@end
