//
//  GEOfferContainer.h
//  GoEuro
//
//  Created by Dmitry Osipa on 7/31/17.
//  Copyright © 2017 Dmitry Osipa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GEOfferType.h"

extern NSString* const kGEUpdateCompleteNotification;

@interface GEOfferContainer : NSObject

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithType:(GEOfferType)type NS_DESIGNATED_INITIALIZER;
- (void)update;

@property (nonatomic, strong, readonly) NSArray* objects;
@property (nonatomic, assign) GEOfferType type;

@end
