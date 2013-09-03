//
//  YSLocation.m
//  ystrdy
//
//  Created by Jabari on 8/30/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSLocation.h"

@implementation YSLocation


- (id)initWithLatitude:(CGFloat)latitude andLongitude:(CGFloat)longitude
{
    self = [super init];
    if (self) {
        _latitude = latitude;
        _longitude = longitude;
    }
    
    return self;
}

@end
