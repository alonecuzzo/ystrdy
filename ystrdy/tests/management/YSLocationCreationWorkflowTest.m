//
//  YSLocationCreationWorkflowTest.m
//  ystrdy
//
//  Created by Jabari on 9/2/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSLocationCreationWorkflowTest.h"
#import "YSLocationManager.h"
#import "YSCommunicator.h"
#import "YSLocationBuilder.h"
#import "YSLocation.h"
#import "YSMockCommunicator.h"

@interface YSLocationCreationWorkflowTest()

@property YSLocationManager *manager;
@property YSCommunicator *communicator;
@property OCMockObject *delegate;
@property OCMockObject *locationBuilder;

@end

@implementation YSLocationCreationWorkflowTest

- (void)setUp
{
    [super setUp];
    
    _manager = [[YSLocationManager alloc] init];
    _communicator = [OCMockObject mockForClass:[YSCommunicator class]];
    _delegate = [OCMockObject mockForProtocol:@protocol(YSLocationManagerDelegate)];
    _locationBuilder = [OCMockObject mockForClass:[YSLocationBuilder class]];
    
    _manager.communicator = _communicator;
    
}

- (void)tearDown
{
    [super tearDown];
    
    _manager = nil;
    _communicator = nil;
    _delegate = nil;
    _locationBuilder = nil;
}

#pragma mark - delegate tesstszzz

- (void)testThatManagerCannotHaveNonConformingDelegate
{
    GHAssertThrows(_manager.delegate = (id <YSLocationManagerDelegate>)[NSNull null], @"delegates that do not conform cannot be delegates");
}

- (void)testThatManagerCanHaveConfrormingDelegate
{
    id <YSLocationManagerDelegate> delegate = [OCMockObject mockForProtocol:@protocol(YSLocationManagerDelegate)];
    
    GHAssertNoThrow(_manager.delegate = delegate, @"manager can have a conforming delegate");
}

- (void)testThatManagerCanHaveNilDelegate
{
    GHAssertNoThrow(_manager.delegate = nil, @"manager can have a nil delegate");
}

#pragma mark - server testsszzz

- (void)testAskingForLocationMeansRequestingData
{
    YSMockCommunicator *communicator = [[YSMockCommunicator alloc] init];
    _manager.communicator = communicator;
    
    YSLocation *location = [[YSLocation alloc] initWithLatitude:0.000f andLongitude:23.32f];
    [_manager fetchWeatherDataForLocation:location];
    
    GHAssertTrue(communicator.wasAskedToFetchWeatherDataForLocation, @"The communicator should fetch data.");
}

@end
