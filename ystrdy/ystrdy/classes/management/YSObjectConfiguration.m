//
//  YSObjectConfiguration.m
//  ystrdy
//
//  Created by Jabari on 9/12/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSObjectConfiguration.h"
#import "YSCommunicator.h"
#import "YSLocationBuilder.h"

@implementation YSObjectConfiguration

- (YSLocationManager*)locationManager
{
    YSLocationManager *manager = [[YSLocationManager alloc] init];
    manager.communicator = [[YSCommunicator alloc] init];
    manager.communicator.delegate = manager;
    manager.locationBuilder = [[YSLocationBuilder alloc] init];
    return manager;
}

@end
