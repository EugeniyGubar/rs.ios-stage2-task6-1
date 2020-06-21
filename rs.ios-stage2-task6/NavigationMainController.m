//
// Created by Eugene Maysyuk on 6/22/20.
// Copyright (c) 2020 Eugene Maysyuk. All rights reserved.
//

#import "NavigationMainController.h"
#import "TabBarController.h"
#import "ViewInfoController.h"
#import "ViewGalleryController.h"
#import "ViewAboutController.h"


@implementation NavigationMainController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setBackground];

    [self startButton];
}

- (void)setBackground {
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)startButton {
    UIButton *startButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    startButton.frame = CGRectMake(50.0, 500.0, 300.0, 50.0);
    startButton.backgroundColor = [UIColor yellowColor];
    [startButton setTitle:@"START" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    startButton.titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];
    //startButton.clipsToBounds = YES;
    startButton.layer.cornerRadius = 55.0 / 2.0f;
    [startButton addTarget:self action:@selector(startTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startButton];
}

- (void)startTapped {
    UIViewController *tab1 = [ViewInfoController new];
    tab1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Info" image:[UIImage imageNamed:@"Star"] tag:0];

    UIViewController *tab2 = [ViewGalleryController new];
    tab2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Gallery" image:[UIImage imageNamed:@"Star"] tag:0];

    UIViewController *tab3 = [ViewAboutController new];
    tab3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"About" image:[UIImage imageNamed:@"Star"] tag:0];

    TabBarController *tabBarController = [TabBarController new];
    tabBarController.viewControllers = @[tab1, tab2, tab3];

    [self.navigationController pushViewController:tabBarController animated:NO];
}


@end
