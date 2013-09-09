//
//  YSFakeURLResponse.m
//  ystrdy
//
//  Created by Jabari on 9/7/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSFakeURLResponse.h"

@implementation YSFakeURLResponse

- (id)initWithStatusCode:(NSInteger)statusCode
{
    self = [super init];
    if (self) {
        statusCode = statusCode;
    }
    return self;
}

@end
