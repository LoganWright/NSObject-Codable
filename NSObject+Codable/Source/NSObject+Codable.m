//
//  NSObject+Codable.m
//  NSObject+Codable
//
//  Created by Logan Wright on 2/20/15.
//  Copyright (c) 2015 LowriDevs. All rights reserved.
//

#import "NSObject+Codable.h"
#import <objc/runtime.h>

@implementation NSObject (Codable)

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [self init];
    if (self) {
        NSArray *ignoredProperties = [self ignoredProperties];
        for (NSString *property in [self propertyNames]) {
            if (![ignoredProperties containsObject:property]) {
                [self setValue:[aDecoder decodeObjectForKey:property] forKey:property];
            }
        }
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    NSArray *ignoredProperties = [self ignoredProperties];
    for (NSString *property in [self propertyNames]) {
        if (![ignoredProperties containsObject:property]) {
            [aCoder encodeObject:[self valueForKey:property] forKey:property];
        }
    }
}

- (NSArray *)ignoredProperties {
    return @[];
}

- (NSArray *)propertyNames {
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    NSMutableArray *propertyNames = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        const char * name = property_getName(property);
        NSString *stringName = [NSString stringWithUTF8String:name];
        [propertyNames addObject:stringName];
    }
    free(properties);
    return propertyNames;
}

@end
