//
//  SafeKVC.h
//  GoEuro
//
//  Created by Dmitry Osipa on 07/31/17.
//  Copyright (c) 2017 Dmitry Osipa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface  NSObject (GESafeKVC)

- (void)setIfExistsValuesForKeysWithDictionary:(NSDictionary*)dictionary;

@end
