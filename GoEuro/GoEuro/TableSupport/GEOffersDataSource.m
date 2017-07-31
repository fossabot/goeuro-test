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
#import "GEOffer.h"

static NSString* const kGECellIdentifier = @"OfferCell";

@interface GEOffersDataSource ()

@property (nonatomic, strong) GEOfferContainer* busContainer;
@property (nonatomic, strong) GEOfferContainer* trainContainer;
@property (nonatomic, strong) GEOfferContainer* planeContainer;
@property (nonatomic, weak) GEOfferContainer* current;
@property (nonatomic, weak) UITableView* tableView;
@property (nonatomic, strong) NSSortDescriptor* sortDescriptor;
@property (nonatomic, strong) NSArray* sortedArray;

@end

@implementation GEOffersDataSource

- (instancetype)init {
    self = [super init];
    if (self) {
        _busContainer = [[GEOfferContainer alloc] initWithType:GEOfferTypeBus];
        _planeContainer = [[GEOfferContainer alloc] initWithType:GEOfferTypePlane];
        _trainContainer = [[GEOfferContainer alloc] initWithType:GEOfferTypeTrain];
        _sortedArray = @[];
        _sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"duration" ascending:YES selector:@selector(localizedStandardCompare:)];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(containerUpdate:) name:kGEUpdateCompleteNotification object:nil];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kGEUpdateCompleteNotification object:nil];
}

- (void)containerUpdate:(NSNotification*)note {
    if (note.object == _current) {
        [self refresh];
    }
}

- (void)refresh {
    _sortedArray = [_current.objects sortedArrayUsingDescriptors:@[self.sortDescriptor]];
    //[_tableView reloadData];
    [_tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)selectOfferType:(GEOfferType)type table:(UITableView*)table;{
    switch (type) {
        case GEOfferTypeBus:
            self.current = _busContainer;
            break;
        case GEOfferTypePlane:
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
    GEOffer* offer = _sortedArray[indexPath.row];
    [cell fillWithOffer:offer];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _sortedArray.count;
}

- (void)sortWithDescriptor:(NSSortDescriptor*)descriptor {
    self.sortDescriptor = descriptor;
    [self refresh];
}

- (void)sortByDuration {
    NSSortDescriptor* descriptor = [[NSSortDescriptor alloc] initWithKey:@"duration" ascending:YES selector:@selector(localizedStandardCompare:)];
    [self sortWithDescriptor:descriptor];
}

- (void)sortByArrival {
    NSSortDescriptor* descriptor = [[NSSortDescriptor alloc] initWithKey:@"arrival_time" ascending:YES selector:@selector(localizedStandardCompare:)];
    [self sortWithDescriptor:descriptor];
}

- (void)sortByDeparture {
    NSSortDescriptor* descriptor = [[NSSortDescriptor alloc] initWithKey:@"departure_time" ascending:YES selector:@selector(localizedStandardCompare:)];
    [self sortWithDescriptor:descriptor];
}


@end
