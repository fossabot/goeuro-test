//
//  GEOffer.m
//  GoEuro
//
//  Created by Dmitry Osipa on 7/31/17.
//  Copyright © 2017 Dmitry Osipa. All rights reserved.
//

#import "GEOffer.h"
#import "NSObject+GESafeKVC.h"

@interface GEOffer ()

@property (nonatomic, strong, readwrite) NSString* provider_logo;
@property (nonatomic, strong, readwrite) NSString* price_in_euros;
@property (nonatomic, strong, readwrite) NSString* departure_time;
@property (nonatomic, strong, readwrite) NSString* arrival_time;
@property (nonatomic, strong, readwrite) NSString* number_of_stops;

@end

@implementation GEOffer

- (instancetype)initWithDictionary:(NSDictionary*)dict
{
    self = [self init];
    [self setIfExistsValuesForKeysWithDictionary:dict];
    return self;
}

@end
