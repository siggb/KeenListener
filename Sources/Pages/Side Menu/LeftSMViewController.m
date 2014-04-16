//
//  LeftSMViewController.m
//  KeenListener
//
//  Created by Ildar Sibagatov on 16.04.14.
//  Copyright (c) 2014 Sig Inc. All rights reserved.
//

#import "LeftSMViewController.h"
#import "UIViewController+RESideMenu.h"

#define NumberOfScreens 4
#define HeightForCell   44

typedef NS_ENUM(NSUInteger, kAppScreen) {
    kAppScreenSettings,
    kAppScreenPresentation,
    kAppScreenFeedback,
    kAppScreenAbout,
};

@interface LeftSMViewController() <UITableViewDataSource, UITableViewDelegate, RESideMenuDelegate>

@property (nonatomic) NSArray *titles;
@property (nonatomic) UITableView *tableViewItem;

@end


@implementation LeftSMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.titles = @[@"Settings", @"Presentation", @"Feedback", @"About"];
    
    self.tableViewItem = ({
        UITableView *table_view = [[UITableView alloc] initWithFrame:
                                   CGRectMake(0,
                                              (self.view.frame.size.height - HeightForCell * NumberOfScreens) / 2.0f,
                                              self.view.frame.size.width,
                                              HeightForCell * NumberOfScreens) style:UITableViewStylePlain];
        table_view.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
        table_view.delegate = self;
        table_view.dataSource = self;
        table_view.opaque = NO;
        table_view.backgroundColor = [UIColor clearColor];
        table_view.backgroundView = nil;
        table_view.separatorStyle = UITableViewCellSeparatorStyleNone;
        table_view.bounces = NO;
        table_view.scrollsToTop = NO;
        table_view;
    });
    
    [self.view addSubview:self.tableViewItem];
}

#pragma mark - UITableView Delegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return NumberOfScreens;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return HeightForCell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"LeftSMVC_CellId";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.font = DefaultLightFont(19);
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.highlightedTextColor = BlueColor;
        cell.selectedBackgroundView = [UIView new];
    }
    
    cell.textLabel.text = self.titles[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *vc_id;
    switch ((kAppScreen)indexPath.row) {
        case kAppScreenSettings:
            vc_id = SettingsViewControllerId;
            break;
            
        case kAppScreenPresentation:
            vc_id = PresentationViewControllerId;
            break;
            
        case kAppScreenFeedback:
            vc_id = FeedbackViewControllerId;
            break;
            
        default:
            vc_id = AboutViewControllerId;
            break;
    }
    
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:
                                  [self.storyboard instantiateViewControllerWithIdentifier:vc_id]];
    [self.sideMenuViewController setContentViewController:nc animated:YES];
    [self.sideMenuViewController hideMenuViewController];
}

@end
