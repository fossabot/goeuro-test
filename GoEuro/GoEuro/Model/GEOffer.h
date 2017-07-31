//
//  GEOffer.h
//  GoEuro
//
//  Created by Dmitry Osipa on 7/31/17.
//  Copyright © 2017 Dmitry Osipa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GEOffer : NSObject

- (instancetype)initWithDictionary:(NSDictionary*)dict;

@property (nonatomic, strong, readonly) NSString* provider_logo;
@property (nonatomic, strong, readonly) NSString* price_in_euros;
@property (nonatomic, strong, readonly) NSString* departure_time;
@property (nonatomic, strong, readonly) NSString* arrival_time;
@property (nonatomic, strong, readonly) NSString* number_of_stops;

@end
