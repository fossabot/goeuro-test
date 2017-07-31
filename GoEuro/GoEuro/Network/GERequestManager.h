//
//  GERequestManager.h
//  GoEuro
//
//  Created by Dmitry Osipa on 7/31/17.
//  Copyright © 2017 Dmitry Osipa. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^GERequestCompletionBlock)(NSURLSessionDataTask* _Nullable task, id _Nullable responseObject, NSError* _Nullable error);

@interface GERequestManager : NSObject

+ (instancetype)sharedManager;
- (NSURLSessionDataTask* _Nonnull)requestBusOffersWithCompletion:(GERequestCompletionBlock)completion;
- (NSURLSessionDataTask* _Nonnull)requestTrainOffersWithCompletion:(GERequestCompletionBlock)completion;
- (NSURLSessionDataTask* _Nonnull)requestPlaneOffersWithCompletion:(GERequestCompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END
