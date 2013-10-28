//
//  YSMockCommunicator.m
//  ystrdy
//
//  Created by Jabari on 9/2/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSMockCommunicator.h"

@implementation YSMockCommunicator

- (void)searchForWeatherDataWithLocation:(YSLocation*)location
{
    _wasAskedToFetchWeatherDataForLocation = YES;
}

@end
