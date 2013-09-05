//
//  YSMockLocationBuilder.m
//  ystrdy
//
//  Created by Jabari on 9/3/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSMockLocationBuilder.h"

@implementation YSMockLocationBuilder

- (YSLocation*)currentWeatherDataForLocationFromJSON:(NSString*)currentJSON andYesterdaysWeatherDataForLocationFromJSON:(NSString*)yesterdayJSON error:(NSError**)error
{
    _currentConditionsJSON = currentJSON;
    _yesterdaysConditionsJSON = yesterdayJSON;
    
    if (error) {
        *error = self.errorToSet;
    }
    
    if (!_locationToReturn) {
        return nil;
    }
    
    return _locationToReturn;
}

@end
