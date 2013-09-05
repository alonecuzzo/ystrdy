//
//  YSLocationBuilderTests.m
//  ystrdy
//
//  Created by Jabari on 9/4/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSLocationBuilderTests.h"
#import "YSLocationBuilder.h"
#import "YSLocation.h"

@interface YSLocationBuilderTests()

@property YSLocationBuilder *locationBuilder;
@property YSLocation *location;
@property NSString *locationCurrentConditionsJSON;
@property NSString *locationYesterdayConditionsJSON;

@end

@implementation YSLocationBuilderTests

- (void)setUp
{
    [super setUp];
    
    _locationBuilder = [[YSLocationBuilder alloc] init];

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"sf-location" ofType:@"json"];
    _locationCurrentConditionsJSON = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    if (!_locationCurrentConditionsJSON) {
        NSLog(@"Conditions file couldn't be read!");
        return;
    }
    
    filePath = [[NSBundle mainBundle] pathForResource:@"sf-yesterday" ofType:@"json"];
    _locationYesterdayConditionsJSON = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    if (!_locationYesterdayConditionsJSON) {
        NSLog(@"Yesterday file couldn't be read!");
        return;
    }
    
    _location = [_locationBuilder currentWeatherDataForLocationFromJSON:_locationCurrentConditionsJSON andYesterdaysWeatherDataForLocationFromJSON:_locationCurrentConditionsJSON error:NULL];
}

- (void)tearDown
{
    [super tearDown];
    
    _locationBuilder = nil;
    _location = nil;
}

#pragma mark - tessstttzzz

- (void)testThatNilIsNotAnAcceptableForCurrentOrYesterdayJSON
{
    GHAssertThrows([_locationBuilder currentWeatherDataForLocationFromJSON:nil andYesterdaysWeatherDataForLocationFromJSON:nil error:NULL], @"Lack of data should be handled elsewhere.");
}

- (void)testThatNilIsReturnedIfStringPassedIsNotJSON
{
    GHAssertNil([_locationBuilder currentWeatherDataForLocationFromJSON:@"Not JSON" andYesterdaysWeatherDataForLocationFromJSON:@"Not JSON" error:NULL], @"Builder should return nil if it is not fed the jsonz.");
}

- (void)testThatValidJSONReturnsNotNilLocation
{
    GHAssertNotNil([_locationBuilder currentWeatherDataForLocationFromJSON:_locationCurrentConditionsJSON andYesterdaysWeatherDataForLocationFromJSON:_locationCurrentConditionsJSON error:NULL], @"Builder should return not nil object if valid jsonz.");
}

- (void)testThatErrorIsThrownWhenCurrentWeatherJSONIsNotJSON
{
    NSError *error = nil;
    [_locationBuilder currentWeatherDataForLocationFromJSON:@"Not JSON" andYesterdaysWeatherDataForLocationFromJSON:@"Not JSON" error:&error];
    GHAssertNotNil(error, @"Builder should return nil if it is not fed the current weather data jsonz.");
}

- (void)testThatErrorIsThrownWhenYesterdaysWeatherJSONIsNotJSON
{
    NSError *error = nil;
    [_locationBuilder currentWeatherDataForLocationFromJSON:@"Not JSON" andYesterdaysWeatherDataForLocationFromJSON:@"Not JSON" error:&error];
    GHAssertNotNil(error, @"Builder should return nil if it is not fed the yesterdays jsonz.");
}


@end
