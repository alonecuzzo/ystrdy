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


@end
