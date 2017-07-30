//
//  SafeKVC.m
//  GoEuro
//
//  Created by Dmitry Osipa on 07/31/17.
//  Copyright (c) 2017 Dmitry Osipa. All rights reserved.
//

#import "NSObject+GESafeKVC.h"

@implementation NSObject (GESafeKVC)

- (void)setIfExistsValuesForKeysWithDictionary:(NSDictionary*)dictionary
{
    NSArray* keys = dictionary.allKeys;
    for (NSString* key in keys)
    {
        SEL selector = NSSelectorFromString(key);
        if ([self respondsToSelector:selector])
        {
            id value = dictionary[key];
            [self setValue:value forKey:key];
        }
    }
}

@end
