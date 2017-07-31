//
//  GEDirection.h
//  GoEuro
//
//  Created by Dmitry Osipa on 7/31/17.
//  Copyright © 2017 Dmitry Osipa. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GEDirection : NSObject

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithFromLocation:(NSString*)fromLocation toLocation:(NSString*)toLocation date:(NSDate*)date NS_DESIGNATED_INITIALIZER;

@property (nonatomic, copy, readonly) NSString* fromLocation;
@property (nonatomic, copy, readonly) NSString* toLocation;
@property (nonatomic, copy, readonly) NSDate* date;

@end

NS_ASSUME_NONNULL_END
