//
//  GEOffersDataSource.h
//  GoEuro
//
//  Created by Dmitry Osipa on 7/31/17.
//  Copyright © 2017 Dmitry Osipa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GEOffersDataSource : NSObject <UITableViewDataSource>

- (void)selectSection:(NSInteger)index table:(UITableView*)table;

@end
