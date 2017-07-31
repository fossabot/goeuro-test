//
//  GERequestManager.m
//  GoEuro
//
//  Created by Dmitry Osipa on 7/31/17.
//  Copyright © 2017 Dmitry Osipa. All rights reserved.
//

#import "GERequestManager.h"
#import <AFNetworking/AFNetworking.h>

static NSString* const kGEAPIURLString = @"https://api.myjson.com/bins";
static NSString* const kGEBusApiPath = @"37yzm";
static NSString* const kGETrainApiPath = @"3zmcy";
static NSString* const kGEPlaneApiPath = @"w60i";

@interface GERequestManager ()

@property (nonatomic, strong) AFHTTPSessionManager* sessionManager;

@end

@implementation GERequestManager

+ (instancetype)sharedManager {
    static GERequestManager* sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [self new];
    });
    return sharedManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSURL* url = [NSURL URLWithString:kGEAPIURLString];
        NSURLSessionConfiguration* config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.requestCachePolicy = NSURLRequestReturnCacheDataElseLoad;
        _sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:url sessionConfiguration:config];
    }
    return self;
}

- (NSURLSessionDataTask* _Nonnull)requestOffersForPath:(NSString*)path withCompletion:(GERequestCompletionBlock)completion {
    NSURLSessionDataTask* dataTask = [self.sessionManager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completion(task, responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completion(task, nil, error);
    }];
    return dataTask;
}

- (NSURLSessionDataTask* _Nonnull)requestBusOffersWithCompletion:(GERequestCompletionBlock)completion {
    return [self requestOffersForPath:kGEBusApiPath withCompletion:completion];
}

- (NSURLSessionDataTask* _Nonnull)requestTrainOffersWithCompletion:(GERequestCompletionBlock)completion {
    return [self requestOffersForPath:kGETrainApiPath withCompletion:completion];
}

- (NSURLSessionDataTask* _Nonnull)requestPlaneOffersWithCompletion:(GERequestCompletionBlock)completion {
    return [self requestOffersForPath:kGEPlaneApiPath withCompletion:completion];
}

@end
