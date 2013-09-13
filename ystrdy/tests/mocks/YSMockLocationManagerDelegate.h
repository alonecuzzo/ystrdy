//
//  YSMockLocationManagerDelegate.h
//  ystrdy
//
//  Created by Jabari on 9/2/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YSLocationManager.h"
#import "YSLocation.h"

@interface YSMockLocationManagerDelegate : NSObject <YSLocationManagerDelegate>

@property (strong) NSError *fetchError;
@property (strong) YSLocation *receivedLocation;

- (void)fetchingLocationFailedWithError:(NSError*)error;
- (void)didReceiveLocation:(YSLocation*)location;

@end
