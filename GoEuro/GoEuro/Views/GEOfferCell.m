//
//  GEOfferCell.m
//  GoEuro
//
//  Created by Dmitry Osipa on 7/31/17.
//  Copyright © 2017 Dmitry Osipa. All rights reserved.
//

#import "GEOfferCell.h"
#import "GEOffer.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@implementation GEOfferCell

- (void)prepareForReuse {
    [super prepareForReuse];
    [self.providerLogo cancelImageDownloadTask];
}

- (void)fillWithOffer:(GEOffer*)offer {
    NSString* format = (offer.nextDay ? @"%@ - %@ (+1)" : @"%@ - %@");
    self.departureArrivalLabel.text = [NSString stringWithFormat:format, offer.departure_time, offer.arrival_time];
    self.price.text =  [NSString stringWithFormat:@"€%@", offer.price_in_euros];
    self.duration.text = offer.duration;
    if (offer.number_of_stops.integerValue > 0) {
        self.numberOfStops.text = [NSString stringWithFormat:@"%@ stops", offer.number_of_stops];
    } else {
        self.numberOfStops.text = @"Direct";
    }
    [self.providerLogo setImageWithURL:[NSURL URLWithString:offer.provider_logo]];
}

@end
