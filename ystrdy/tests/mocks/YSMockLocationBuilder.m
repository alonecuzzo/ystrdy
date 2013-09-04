//
//  YSMockLocationBuilder.m
//  ystrdy
//
//  Created by Jabari on 9/3/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSMockLocationBuilder.h"

@implementation YSMockLocationBuilder

- (YSLocation*)weatherDataForLocationFromJSON:(NSString*)json error:(NSError**)error
{
    _JSON = json;
    
    if (_JSON) {
        _locationToReturn = [[YSLocation alloc] init];
    }
    
    if (error) {
        *error = self.errorToSet;
    }
    
    return _locationToReturn;
}

@end
