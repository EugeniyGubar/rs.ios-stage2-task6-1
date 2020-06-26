//
// Created by Eugene Maysyuk on 6/22/20.
// Copyright (c) 2020 Eugene Maysyuk. All rights reserved.
//

#import "NavigationMainController.h"
#import "TabBarController.h"
#import "ViewInfoController.h"
#import "ViewGalleryController.h"
#import "ViewAboutController.h"
#import "UIColor_RSColors.h"


@implementation NavigationMainController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setBackground];

    [self startButton];
}

- (void)setBackground {
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [UINavigationBar appearance].barTintColor = [UIColor rsschoolYellowColor];
}

- (void)startButton {
    UIButton *startButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    startButton.frame = CGRectMake(50.0, 500.0, 300.0, 50.0);
    startButton.layer.cornerRadius = 55.0 / 2.0f;
    startButton.backgroundColor = [UIColor rsschoolYellowColor];
    startButton.titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];
    [startButton setTitle:@"START" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor rsschoolBlackColor] forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(startTapped) forControlEvents:UIControlEventTouchUpInside];
    startButton.translatesAutoresizingMaskIntoConstraints = NO;

    [self.view addSubview:startButton];

    [NSLayoutConstraint activateConstraints:@[
        [startButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [startButton.topAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:140],
        [startButton.heightAnchor constraintEqualToConstant:55],
        [startButton.widthAnchor constraintEqualToConstant:300],
    ]];

}

- (void)startTapped {
    UIViewController *tab1 = [ViewInfoController new];
    tab1.tabBarItem = [[UITabBarItem alloc] init];
    tab1.tabBarItem.image = [[UIImage imageNamed:@"info_unselected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tab1.tabBarItem.selectedImage = [[UIImage imageNamed:@"info_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tab1.tabBarItem.imageInsets = UIEdgeInsetsMake(15, 0, -15, 0);
    tab1.tabBarItem.tag = 0;

    UIViewController *tab2 = [ViewGalleryController new];
    tab2.tabBarItem = [[UITabBarItem alloc] init];
    tab2.tabBarItem.image = [[UIImage imageNamed:@"gallery_unselected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tab2.tabBarItem.selectedImage = [[UIImage imageNamed:@"gallery_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tab2.tabBarItem.imageInsets = UIEdgeInsetsMake(15, 0, -15, 0);
    tab2.tabBarItem.tag = 1;

    UIViewController *tab3 = [ViewAboutController new];
    tab3.tabBarItem = [[UITabBarItem alloc] init];
    tab3.tabBarItem.image = [[UIImage imageNamed:@"home_unselected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tab3.tabBarItem.selectedImage = [[UIImage imageNamed:@"home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tab3.tabBarItem.imageInsets = UIEdgeInsetsMake(15, 0, -15, 0);
    tab3.tabBarItem.tag = 3;

    TabBarController *tabBarController = [TabBarController new];
    tabBarController.viewControllers = @[tab1, tab2, tab3];
    tabBarController.selectedViewController = tab2;

    [self.navigationController pushViewController:tabBarController animated:NO];
}


@end
