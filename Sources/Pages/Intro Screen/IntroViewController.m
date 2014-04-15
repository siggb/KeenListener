//
//  IntroViewController.m
//  KeenListener
//
//  Created by Ildar Sibagatov on 16.04.14.
//  Copyright (c) 2014 Sig Inc. All rights reserved.
//

#import "IntroViewController.h"

#define LOG_ON 1
static const CGFloat TimeoutBeforeStart = 1.5f;

@interface IntroViewController()

@property (nonatomic, weak) IBOutlet UIImageView *bgImageView;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *indicatorView;

@end


@implementation IntroViewController

#pragma mark - View Lifecicle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.layer.masksToBounds = YES;
    [self.indicatorView setColor:[UIColor whiteColor]];
    
#ifdef DEBUG
    // добавляем строку с указанием версии текущей сборки
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [info objectForKey:@"CFBundleShortVersionString"];
    NSString *app_version = [NSString stringWithFormat:@"%@.%@", version, GIT_SHA_VERSION];
    
    UILabel *version_label = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 0, 0)];
    [version_label setFont:DefaultLightFont(14)];
    [version_label setText:[NSString stringWithFormat:@"Version %@", app_version]];
    [version_label setTextColor:LightGrayColor];
    [version_label setBackgroundColor:[UIColor clearColor]];
    [version_label sizeToFit];
    [self.view addSubview:version_label];
#endif
    
    // запускаем логику через 1.5 секунды
    [NSTimer scheduledTimerWithTimeInterval:TimeoutBeforeStart target:self
                                   selector:@selector(startLogic) userInfo:nil repeats:NO];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    DPLog(LOG_ON, @"");
}

#pragma mark - Основная логика работы

/**
 *  Переход к основному экрану приложения
 */
- (void)startLogic
{
    [self performSegueWithIdentifier:IntroToMainScreenSegueName sender:self];
}

@end
