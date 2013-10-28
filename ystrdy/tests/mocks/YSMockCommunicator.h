//
//  YSMockCommunicator.h
//  ystrdy
//
//  Created by Jabari on 9/2/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSCommunicator.h"

@interface YSMockCommunicator : YSCommunicator

@property (readonly) BOOL wasAskedToFetchWeatherDataForLocation;

- (void)searchForWeatherDataWithLocation:(YSLocation*)location;

@end
