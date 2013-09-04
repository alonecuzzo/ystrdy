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
#import "YSMockLocationManagerDelegate.h"
#import "YSMockLocationBuilder.h"

@interface YSLocationCreationWorkflowTest()

@property YSLocationManager *manager;
@property YSCommunicator *communicator;
@property YSMockLocationManagerDelegate *delegate;
@property YSMockLocationBuilder *locationBuilder;
@property NSError *underlyingError;

@end

@implementation YSLocationCreationWorkflowTest

- (void)setUp
{
    [super setUp];
    
    _manager = [[YSLocationManager alloc] init];
    _communicator = [[YSMockCommunicator alloc] init];
    _delegate = [[YSMockLocationManagerDelegate alloc] init];
    _locationBuilder = [[YSMockLocationBuilder alloc] init];
    
    _manager.communicator = _communicator;
    _manager.locationBuilder = _locationBuilder;
    _manager.delegate = _delegate;
    
    _underlyingError = [NSError errorWithDomain:@"Test Domain" code:0 userInfo:nil];
}

- (void)tearDown
{
    [super tearDown];
    
    _manager = nil;
    _communicator = nil;
    _delegate = nil;
    _locationBuilder = nil;
    _underlyingError = nil;
}

#pragma mark - delegate tesstszzz

- (void)testThatManagerCannotHaveNonConformingDelegate
{
    GHAssertThrows(_manager.delegate = (id <YSLocationManagerDelegate>)[NSNull null], @"delegates that do not conform cannot be delegates");
}

- (void)testThatManagerCanHaveConfrormingDelegate
{
    YSMockLocationManagerDelegate *delegate = [[YSMockLocationManagerDelegate alloc] init];
    
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

- (void)testErrorReturnedToDelegateIsNotErrorReturnedToCommunicator
{
    YSMockLocationManagerDelegate *delegate = [[YSMockLocationManagerDelegate alloc] init];
    _manager.delegate = delegate;
    
    NSError *underlyingError = [NSError errorWithDomain:@"Test Domain" code:0 userInfo:nil];
    [_manager searchForWeatherDataFailedWithError:underlyingError];
    
    GHAssertFalse(underlyingError == [delegate fetchError], @"Error should have proper level of abstraction.");
}

- (void)testErrorReturnedToDelegateShouldEqualCommunicatorsUnderlyingError
{
    YSMockLocationManagerDelegate *delegate = [[YSMockLocationManagerDelegate alloc] init];
    _manager.delegate = delegate;
    
    NSError *underlyingError = [NSError errorWithDomain:@"Test Domain" code:0 userInfo:nil];
    [_manager searchForWeatherDataFailedWithError:underlyingError];
    
    GHAssertEqualObjects([[[delegate fetchError] userInfo] objectForKey:NSUnderlyingErrorKey], underlyingError, @"the underlying error should be accessible by client code");
}

#pragma mark - Location Building

- (void)testThatJSONisPassedToBuilder
{
    NSString *fakeJSON = @"Fake JSON";
    [_manager receivedWeatherDataFromJSON:fakeJSON];
    
    GHAssertEqualObjects(_locationBuilder.JSON, fakeJSON, @"Downloaded JSON should be sent to the builder");
}

- (void)testThatDelegateIsNotifiedOfErrorWhenBuilderFails
{
    _locationBuilder.locationToReturn = nil;
    _locationBuilder.errorToSet = _underlyingError;
    
    [_manager receivedWeatherDataFromJSON:@"Fake JSON"];
    
    GHAssertNotNil([[_delegate.fetchError userInfo] objectForKey:NSUnderlyingErrorKey], @"The delegate should know about the error.");
}

@end
