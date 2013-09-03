//
//  YSLocationManager.h
//  ystrdy
//
//  Created by Jabari on 9/2/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YSCommunicator.h"
#import "YSLocationBuilder.h"
#import "YSLocation.h"

extern NSString *YSManagerError;

enum {
    YSErrorLocationSearchCode
};

@protocol YSLocationManagerDelegate <NSObject>

- (void)fetchingLocationsFailedWithError:(NSError*)error;
- (void)didReceiveLocations:(NSArray*)locations;

@end

@interface YSLocationManager : NSObject

@property(weak, nonatomic) id <YSLocationManagerDelegate> delegate;

@property(strong) YSCommunicator *communicator;
@property(strong) YSLocationBuilder *locationBuilder;


- (void)fetchWeatherDataForLocation:(YSLocation*)location;
- (void)searchForWeatherDataFailedWithError:(NSError*)error;

@end
