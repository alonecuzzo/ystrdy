//
//  YSFakeURLResponse.m
//  ystrdy
//
//  Created by Jabari on 9/7/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSFakeURLResponse.h"

@implementation YSFakeURLResponse {
    NSInteger _statusCode;
}

- (id)initWithStatusCode:(NSInteger)code
{
    self = [super init];
    if (self) {
        _statusCode = code;
    }
    return self;
}

- (NSInteger)statusCode
{
    return _statusCode;
}

@end
