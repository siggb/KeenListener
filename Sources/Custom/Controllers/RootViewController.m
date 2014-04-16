//
//  RootViewController.h
//  KeenListener
//
//  Created by Ildar Sibagatov on 15.04.14.
//  Copyright (c) 2014 Sig Inc. All rights reserved.
//

#import "RootViewController.h"

#define LOG_ON 1

@implementation RootViewController

#pragma mark - Initialization

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    
    return self;
}

/**
 *  Метод для инициализации полей дочерних контроллеров
 */
- (void)initialize
{
    // override me
}

#pragma mark - Supported Interface Orientations

- (BOOL)shouldAutorotate
{
    return YES;
}

/*
 * Поворот экрана для ios 6
 */
- (NSUInteger)supportedInterfaceOrientations
{
    return (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown);
}

#pragma mark - View Lifecicle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:GrayColor];
    
    // настройка навбара
    [self configureNavbar];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // позиционирование элементов под нужную ориентацию устройства
    [self willRotateToInterfaceOrientation:[self interfaceOrientation] duration:1.f];
}

- (void)didReceiveMemoryWarning
{
    DPLog(LOG_ON, @"");
    
    [super didReceiveMemoryWarning];
}

#pragma mark - Методы настройки навбара

/**
 *  Обобщенный метод для создания кнопок
 */
- (void)configureNavbar
{
    // устанавливаем (по необходимости) кнопку возврата назад
    if ([self.navigationController.viewControllers count] != 1) {
        [self initBackButton];
    }
    else {
        [self initSidebarButton];
    }
}

/**
 *  Инициализация кнопки Back
 */
- (void)initBackButton
{
    UIButton *back_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    back_btn.frame = CGRectMake(0, 0, 24, 24);
    [back_btn setContentMode:UIViewContentModeCenter];
    [back_btn setImage:[UIImage imageNamed:@"BackButton"] forState:UIControlStateNormal];
    [back_btn setImage:[UIImage imageNamed:@"BackButtonSel"] forState:UIControlStateHighlighted];
    [back_btn addTarget:self action:@selector(backButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *left_btn = [[UIBarButtonItem alloc] initWithCustomView:back_btn];
    self.navigationItem.leftBarButtonItem = left_btn;
}

/**
 *  Обработка нажатия по кнопке возврата к предыдущему экрану
 */
- (void)backButtonClicked
{
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 *  Инициализация кнопки Sidebar
 */
- (void)initSidebarButton
{
    UIButton *sidebar_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    sidebar_btn.frame = CGRectMake(0, 0, 18, 14);
    [sidebar_btn setContentMode:UIViewContentModeCenter];
    [sidebar_btn setImage:[UIImage imageNamed:@"SidebarBtn"] forState:UIControlStateNormal];
    [sidebar_btn setImage:[UIImage imageNamed:@"SidebarBtnSel"] forState:UIControlStateHighlighted];
    [sidebar_btn addTarget:self action:@selector(sidebarButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *left_btn = [[UIBarButtonItem alloc] initWithCustomView:sidebar_btn];
    self.navigationItem.leftBarButtonItem = left_btn;
}

/**
 *  Обработка нажатия по кнопке бокового экрана
 */
- (void)sidebarButtonClicked
{
    [self presentLeftMenuViewController:self];
}

#pragma mark - Индикация загрузки данных

- (void)showLoading
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (void)showScreenLoading
{
    if ([[UIApplication sharedApplication] isNetworkActivityIndicatorVisible]) {
        // если индикация загрузки уже отображается,
        // то не показываем её экранную версию
        return;
    }
    
    [self showScreenLoadingWithText:nil];
}

- (void)showScreenLoadingWithText:(NSString*)text
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    if (indicator == nil) {
        indicator = [[MBProgressHUD alloc] initWithView:self.view];
        indicator.dimBackground = YES;
        [self.view addSubview:indicator];
        [self.view bringSubviewToFront:indicator];
        
    }
    if (text)
        indicator.labelText = text;
    [indicator show:YES];
}

- (void)changeLoadingText:(NSString*)text
{
    if ((indicator == nil) || (text == nil))
        return;
    
    indicator.labelText = text;
}

- (void)hideLoading
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
    if (indicator)
        [indicator hide:YES];
    indicator = nil;
}

- (void)hideLoadingWithDelay:(NSTimeInterval)delay
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
    if (indicator)
        [indicator hide:YES afterDelay:delay];
    indicator = nil;
}

#pragma mark - Animating a change in the orientation

- (BOOL)isPortraitOrientation
{    
    return [self isPortraitOrientation:[self interfaceOrientation]];
}

- (BOOL)isPortraitOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{    
    return ((toInterfaceOrientation == UIInterfaceOrientationPortrait)
            || (toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown));
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    // define me
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    // define me
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    // define me
}

#pragma mark - Storyboard methods

- (id)viewControllerWithIdentifier:(NSString *)identifier
{
    DPLog(LOG_ON, @"");
    
    UIStoryboard *pages_storyboard = [UIStoryboard storyboardWithName:APP_STORYBOARD_NAME bundle:nil];
    return [pages_storyboard instantiateViewControllerWithIdentifier:identifier];
}

@end
