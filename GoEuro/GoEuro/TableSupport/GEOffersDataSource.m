//
//  GEOffersDataSource.m
//  GoEuro
//
//  Created by Dmitry Osipa on 7/31/17.
//  Copyright © 2017 Dmitry Osipa. All rights reserved.
//

#import "GEOffersDataSource.h"
#import "GEOfferContainer.h"
#import "GEOfferCell.h"

static NSString* const kGECellIdentifier = @"OfferCell";

@interface GEOffersDataSource ()

@property (nonatomic, strong) GEOfferContainer* busContainer;
@property (nonatomic, strong) GEOfferContainer* trainContainer;
@property (nonatomic, strong) GEOfferContainer* planeContainer;
@property (nonatomic, weak) GEOfferContainer* current;
@property (nonatomic, weak) UITableView* tableView;

@end

@implementation GEOffersDataSource

- (instancetype)init
{
    self = [super init];
    if (self) {
        _busContainer = [[GEOfferContainer alloc] initWithType:GEOfferTypeBus];
        _planeContainer = [[GEOfferContainer alloc] initWithType:GEOfferTypePlane];
        _trainContainer = [[GEOfferContainer alloc] initWithType:GEOfferTypeTrain];
        _current = _busContainer;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(containerUpdate:) name:kGEUpdateCompleteNotification object:nil];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kGEUpdateCompleteNotification object:nil];
}

- (void)containerUpdate:(NSNotification*)note {
    if (note.object == _current) {
        [_tableView reloadData];
        _tableView = nil;
    }
}

- (void)selectSection:(NSInteger)index table:(UITableView*)table{
    switch (index) {
        case 0:
            self.current = _busContainer;
            break;
        case 1:
            self.current = _planeContainer;
            break;

        default:
            self.current = _trainContainer;
            break;
    }
    _tableView = table;
}

- (void)setCurrent:(GEOfferContainer *)current {
    if (_current != current) {
        _current = current;
        [_current update];
    }
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    GEOfferCell* cell = [tableView dequeueReusableCellWithIdentifier:kGECellIdentifier];
    GEOffer* offer = _current.objects[indexPath.row];
    [cell fillWithOffer:offer];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _current.objects.count;
}

@end
