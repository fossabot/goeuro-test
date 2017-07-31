//
//  GEOfferContainer.m
//  GoEuro
//
//  Created by Dmitry Osipa on 7/31/17.
//  Copyright © 2017 Dmitry Osipa. All rights reserved.
//

#import "GEOfferContainer.h"
#import "GERequestManager.h"
#import "GEOffer.h"

NSString* const kGEUpdateCompleteNotification = @"kGEUpdateCompleteNotification";

@interface GEOfferContainer ()

@property (nonatomic, strong, readwrite) NSArray* objects;
@property (nonatomic, weak) NSURLSessionTask* updateTask;

@end

@implementation GEOfferContainer

- (instancetype)initWithType:(GEOfferType)type {
    self = [super init];
    if (self) {
        _type = type;
    }
    return self;
}

- (void)update {
    if (_updateTask != nil) {
        return;
    }
    GERequestCompletionBlock block = ^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error == nil) {
            [self fillObjectsWithArray:responseObject];
            [[NSNotificationCenter defaultCenter] postNotificationName:kGEUpdateCompleteNotification object:self];
        }
    };
    switch (self.type) {
        case GEOfferTypeBus:
            _updateTask = [GERequestManager.sharedManager requestBusOffersWithCompletion:block];
            break;
        case GEOfferTypePlane:
            _updateTask = [GERequestManager.sharedManager requestPlaneOffersWithCompletion:block];
            break;
        case GEOfferTypeTrain:
            _updateTask = [GERequestManager.sharedManager requestTrainOffersWithCompletion:block];
            break;
        default:
            break;
    }
}

- (void)fillObjectsWithArray:(NSArray*)array {
    NSMutableArray* tmpArray = [NSMutableArray new];
    for (NSDictionary* dict in array) {
        GEOffer* offer = [[GEOffer alloc] initWithDictionary:dict];
        [tmpArray addObject:offer];
    }
    _objects = [tmpArray copy];
}

@end
