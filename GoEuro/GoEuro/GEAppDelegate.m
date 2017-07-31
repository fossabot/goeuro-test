//
//  GEAppDelegate.m
//  GoEuro
//
//  Created by Dmitry Osipa on 7/30/17.
//  Copyright © 2017 Dmitry Osipa. All rights reserved.
//

#import "GEAppDelegate.h"
#import "GEDirection.h"
#import <GoEuro-Swift.h>

@interface GEAppDelegate ()

@end

@implementation GEAppDelegate

- (void)configureAppearance {
    self.window.tintColor = [UIColor whiteColor];
    [[UILabel appearance] setTextColor:[UIColor whiteColor]];
    [[UILabel appearanceWhenContainedIn:[UITableView class], nil] setTextColor:[UIColor grayColor]];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [self configureAppearance];
    GEDirection* direction = [[GEDirection alloc] initWithFromLocation:@"Berlin" toLocation:@"Munich" date:[NSDate date]];
    GEDirectionViewController* directionViewController = (GEDirectionViewController*)self.window.rootViewController;
    directionViewController.direction = direction;
    return YES;
}

@end
