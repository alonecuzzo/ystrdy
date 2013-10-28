//
//  YSLocationManager.h
//  ystrdy
//
//  Created by Jabari on 9/2/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YSCommunicatorDelegate.h"
#import "YSLocationManagerDelegate.h"
#import "YSLocationBuilder.h"
#import "YSLocation.h"
#import "YSCommunicator.h"

extern NSString *YSManagerError;

enum {
    YSErrorLocationSearchCode
};

@interface YSLocationManager : NSObject <YSCommunicatorDelegate>

@property(weak, nonatomic) id <YSLocationManagerDelegate> delegate;

@property(strong) YSCommunicator *communicator;
@property(strong) YSLocationBuilder *locationBuilder;

- (void)fetchWeatherDataForLocation:(YSLocation*)location;
- (void)searchForWeatherDataFailedWithError:(NSError*)error;
- (void)receivedWeatherDataFromJSON:(NSString*)json;

@end
