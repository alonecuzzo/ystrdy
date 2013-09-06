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
@property NSString *locationJSON;

@end

@implementation YSLocationBuilderTests

- (void)setUp
{
    [super setUp];
    
    _locationBuilder = [[YSLocationBuilder alloc] init];

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ny-location-data" ofType:@"json"];
    _locationJSON = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    if (!_locationJSON) {
        NSLog(@"Conditions file couldn't be read!");
        return;
    }
    
    _location = [_locationBuilder currentWeatherDataForLocationFromJSON:_locationJSON error:NULL];
}

- (void)tearDown
{
    [super tearDown];
    
    _locationBuilder = nil;
    _location = nil;
}

#pragma mark - tessstttzzz

- (void)testThatNilIsNotAnAcceptableForlocationJSON
{
    GHAssertThrows([_locationBuilder currentWeatherDataForLocationFromJSON:nil error:NULL], @"Lack of data should be handled elsewhere.");
}

- (void)testThatNilIsReturnedIfStringPassedIsNotJSON
{
    GHAssertNil([_locationBuilder currentWeatherDataForLocationFromJSON:@"Not JSON" error:NULL], @"Builder should return nil if it is not fed the jsonz.");
}

- (void)testThatValidJSONReturnsNotNilLocation
{
    GHAssertNotNil([_locationBuilder currentWeatherDataForLocationFromJSON:_locationJSON error:NULL], @"Builder should return not nil object if valid jsonz.");
}

- (void)testThatErrorIsThrownWhenLocationJSONIsNotJSON
{
    NSError *error = nil;
    [_locationBuilder currentWeatherDataForLocationFromJSON:@"Not JSON" error:&error];
    GHAssertNotNil(error, @"Builder should return nil if it is not fed the current weather data jsonz.");
}

- (void)testThatJSONWithoutForecastDataReturnsMissingDataError
{
    NSError *error = nil;
    NSString *noForecastJSON = @"{ \"broz\" : 5 }";
    [_locationBuilder currentWeatherDataForLocationFromJSON:noForecastJSON error:&error];
    GHAssertEquals([error code], YSLocationBuilderMissingForecastDataError, @"Builder should throw yslocationbuildermissingforecastdataerror if forecast data is missing.");
}

- (void)testThatJSONWithoutYesterdayDataReturnsMissingDataError
{
    NSError *error = nil;
    NSString *noYesterdayJSON = @"{ \"forecast\" : 3 }";
    [_locationBuilder currentWeatherDataForLocationFromJSON:noYesterdayJSON error:&error];
    GHAssertEquals([error code], YSLocationBuilderMissingYesterdayDataError, @"Builder should throw YSLocationBuilderMissingYesterdayDataError if yesterday data is missing.");
}

- (void)testThatJSONWithoutCurrentObservationDataReturnsMissingDataError
{
    NSError *error = nil;
    NSString *noCurrentObservationJSON = @"{ \"forecast\" : 4, \"history\" : 8}";
    [_locationBuilder currentWeatherDataForLocationFromJSON:noCurrentObservationJSON error:&error];
    GHAssertEquals([error code], YSLocationBuilderMissingConditionsDataError, @"Builder should throw  YSLocationBuilderMissingConditionsDataError error if current conditions data is missing.");
}


@end
