//
//  YSMockLocationManager.m
//  ystrdy
//
//  Created by Jabari on 9/7/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSMockLocationManager.h"

@implementation YSMockLocationManager {
    NSInteger _weatherFailureErrorCode;
    NSString *_locationJSON;
}

- (void)searchingForWeatherDataFailedWithError:(NSError *)error
{
    _weatherFailureErrorCode = [error code];
}

- (NSInteger)weatherFailureErrorCode
{
    return _weatherFailureErrorCode;
}

- (void)receivedWeatherDataFromJSON:(NSString *)json
{
    _locationJSON = json;
}

- (NSString*)locationJSON
{
    return _locationJSON;
}

@end
