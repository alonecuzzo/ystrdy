//
//  YSLocationTest.m
//  ystrdy
//
//  Created by Jabari on 8/30/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSLocationTest.h"
#import "YSLocation.h"

@interface YSLocationTest()

@property(strong, nonatomic) YSLocation *location;

@end

@implementation YSLocationTest

- (void)setUp
{
    [super setUp];
    
    _location = [[YSLocation alloc] init];
}

- (void)tearDown
{
    [super tearDown];
    
    _location = nil;
}

#pragma mark - tessssts

- (void)testThatLocationExists
{
    GHAssertNotNil(_location, @"location should be able to be created");
}

- (void)testThatLocationHasLatitude
{
    _location.latitude = @37.50999832;
    
    GHAssertEqualObjects(_location.latitude, [NSNumber numberWithDouble:37.50999832], @"location should have latitude");
}

- (void)testThatLocationHasLongitude
{
    _location.longitude = @-122.50000000f;
    
    GHAssertEqualObjects(_location.longitude, [NSNumber numberWithDouble:-122.50000000], @"location should have longitude");
}

- (void)testLocationCanHaveAName
{
    _location.city = @"Santiago";
    
    GHAssertTrue([_location.city isEqualToString:@"Santiago"], @"location name should equal expected value, Santiago");
}

- (void)testLocationCanHaveATodayTemperatureFarenheit
{
    _location.todaysTemperatureF = 14;

    GHAssertEquals(_location.todaysTemperatureF, (float)14, @"location should have today's temperature in farenheit");
}

- (void)testLocationCanHaveATodayTemperatureCelcius
{
    _location.todaysTemperatureC = 14;
    
    GHAssertEquals(_location.todaysTemperatureC, (float)14, @"location should have today's temperature in celcius");
}

- (void)testLocationCanHaveAYesterdayTemperatureFarenheit
{
    _location.yesterdaysTemperatureF = 13;
    
    GHAssertEquals(_location.yesterdaysTemperatureF, (float)13, @"location should have today's temperature in farenheit");
}

- (void)testLocationCanHaveAYesterdayTemperatureCelcius
{
    _location.yesterdaysTemperatureC = 13;
    
    GHAssertEquals(_location.yesterdaysTemperatureC, (float)13, @"location should have today's temperature in celcius");
}

- (void)testLocationCanHaveIsRainingStatus
{
    _location.isRaining = YES;
    
    GHAssertTrue(_location.isRaining, @"it should be raining in this location today");
}

@end
