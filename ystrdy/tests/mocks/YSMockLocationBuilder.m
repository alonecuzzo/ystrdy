//
//  YSMockLocationBuilder.m
//  ystrdy
//
//  Created by Jabari on 9/3/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSMockLocationBuilder.h"

@implementation YSMockLocationBuilder

- (YSLocation*)currentWeatherDataForLocationFromJSON:(NSString*)json error:(NSError**)error
{
    _JSON = json;
    
    if (error) {
        *error = self.errorToSet;
    }
    
    if (!_locationToReturn) {
        return nil;
    }
    
    return _locationToReturn;
}

@end
