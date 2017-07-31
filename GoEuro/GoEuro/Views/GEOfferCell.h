//
//  GEOfferCell.h
//  GoEuro
//
//  Created by Dmitry Osipa on 7/31/17.
//  Copyright © 2017 Dmitry Osipa. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GEOffer;

@interface GEOfferCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *providerLogo;
@property (weak, nonatomic) IBOutlet UILabel *departureArrivalLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfStops;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *duration;

- (void)fillWithOffer:(GEOffer*)offer;

@end
