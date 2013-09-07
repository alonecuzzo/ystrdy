//
//  YSCommunicator.m
//  ystrdy
//
//  Created by Jabari on 9/2/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSCommunicator.h"

NSString *const kWundergroundAPIKey = @"9caa09c5d1399971";
static NSString *APIURLBase = @"http://api.wunderground.com/api/";
static NSString *APIURLConditions = @"forecast/yesterday/conditions/";
static NSString *APIURLQueryPrefix = @"q/";

@interface YSCommunicator()

@end

@implementation YSCommunicator

- (void)searchForWeatherDataWithLocation:(YSLocation*)location
{
    NSString *fetchingURLString = [NSString stringWithFormat:@"%@%@/%@%@%@,%@.json", APIURLBase, kWundergroundAPIKey, APIURLConditions, APIURLQueryPrefix, location.latitude, location.longitude];
    fetchingURL = [[NSURL alloc] initWithString:fetchingURLString];
}

@end
