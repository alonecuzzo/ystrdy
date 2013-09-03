//
//  YSMockLocationBuilder.m
//  ystrdy
//
//  Created by Jabari on 9/3/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSMockLocationBuilder.h"

@implementation YSMockLocationBuilder

- (YSLocation*)weatherDataForLocationFromJSON:(NSString*)json
{
    YSLocation *locationToReturn = [[YSLocation alloc] init];
    _JSON = json;
    return locationToReturn;
}
@end
