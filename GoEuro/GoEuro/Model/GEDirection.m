//
//  GEDirection.m
//  GoEuro
//
//  Created by Dmitry Osipa on 7/31/17.
//  Copyright © 2017 Dmitry Osipa. All rights reserved.
//

#import "GEDirection.h"

@implementation GEDirection

- (instancetype)initWithFromLocation:(NSString*)fromLocation toLocation:(NSString*)toLocation date:(NSDate*)date {
    self = [super init];
    if (self) {
        _fromLocation = fromLocation;
        _toLocation = toLocation;
        _date = date;
    }
    return self;
}

@end
