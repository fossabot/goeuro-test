//
//  GEOfferCell.m
//  GoEuro
//
//  Created by Dmitry Osipa on 7/31/17.
//  Copyright © 2017 Dmitry Osipa. All rights reserved.
//

#import "GEOfferCell.h"
#import "GEOffer.h"

@implementation GEOfferCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)fillWithOffer:(GEOffer*)offer {
    self.departureArrivalLabel.text = [NSString stringWithFormat:@"%@ - %@", offer.departure_time, offer.arrival_time];
    self.price.text =  [NSString stringWithFormat:@"€ %@", offer.price_in_euros];
}

@end
