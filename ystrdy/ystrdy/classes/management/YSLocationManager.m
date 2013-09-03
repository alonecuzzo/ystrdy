//
//  YSLocationManager.m
//  ystrdy
//
//  Created by Jabari on 9/2/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSLocationManager.h"

@implementation YSLocationManager

- (void)setDelegate:(id<YSLocationManagerDelegate>)delegate
{
    if (delegate && ![delegate conformsToProtocol:@protocol(YSLocationManagerDelegate)]) {
        [[NSException exceptionWithName:NSInvalidArgumentException reason:@"Delegate object does not conform to it's protocol." userInfo:nil] raise];
    }
    _delegate = delegate;
}

- (void)fetchWeatherDataForLocation:(YSLocation*)location
{
    [_communicator searchForWeatherDataWithLocation:location];
}

@end