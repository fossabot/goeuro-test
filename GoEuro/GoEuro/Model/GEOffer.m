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
@property (nonatomic, strong, readwrite) NSString* duration;
@property (nonatomic, assign) BOOL nextDay;

@end

@implementation GEOffer

- (instancetype)initWithDictionary:(NSDictionary*)dict {
    self = [self init];
    [self setIfExistsValuesForKeysWithDictionary:dict];
    [self computeTime];
    return self;
}

- (void)computeTime {
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDate* departureDate = [[GEOffer formatter] dateFromString:self.departure_time];
    NSDate* arrivalDate = [[GEOffer formatter] dateFromString:self.arrival_time];
    NSDateComponents* departureComponents = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:departureDate];
    NSDateComponents* arrivalComponents = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:arrivalDate];
    if (departureComponents.hour > arrivalComponents.hour) {
        arrivalComponents.day += 1;
        self.nextDay = YES;
    }
    arrivalDate = [calendar dateFromComponents:arrivalComponents];
    NSTimeInterval duration = [arrivalDate timeIntervalSinceDate:departureDate];
    NSDate* durationDate = [NSDate dateWithTimeIntervalSinceReferenceDate:duration];
    self.duration = [[GEOffer formatter] stringFromDate:durationDate];
}

- (void)setProvider_logo:(NSString *)provider_logo {
    if (provider_logo != _provider_logo) {
        _provider_logo = [provider_logo stringByReplacingOccurrencesOfString:@"{size}" withString:@"63"];
    }
}

- (void)setPrice_in_euros:(NSString *)price_in_euros {
    if (price_in_euros != _price_in_euros) {
        _price_in_euros = [NSString stringWithFormat:@"%.02f", price_in_euros.doubleValue];
    }
}

+ (NSDateFormatter*)formatter {
    static NSDateFormatter* sFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sFormatter = [NSDateFormatter new];
        sFormatter.dateFormat = @"HH:mm";
    });
    return sFormatter;
}

@end
