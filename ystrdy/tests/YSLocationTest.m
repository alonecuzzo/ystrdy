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
    _location.latitude = 37.50999832f;
    
    GHAssertEquals(_location.latitude, (CGFloat)37.50999832f, @"location should have latitude");
}

- (void)testThatLocationHasLongitude
{
    _location.longitude = -122.50000000f;
    
    GHAssertEquals(_location.longitude, (CGFloat)-122.50000000f, @"location should have longitude");
}

- (void)testLocationCanHaveAName
{
    _location.city = @"Santiago";
    
    GHAssertTrue([_location.city isEqualToString:@"Santiago"], @"location name should equal expected value, Santiago");
}

- (void)testLocationCanHaveATodayTemperatureFarenheit
{
    _location.todaysTemperatureF = 14;

    GHAssertEquals(_location.todaysTemperatureF, 14, @"location should have today's temperature in farenheit");
}

- (void)testLocationCanHaveATodayTemperatureCelcius
{
    _location.todaysTemperatureC = 14;
    
    GHAssertEquals(_location.todaysTemperatureC, 14, @"location should have today's temperature in celcius");
}

- (void)testLocationCanHaveAYesterdayTemperatureFarenheit
{
    _location.yesterdaysTemperatureF = 13;
    
    GHAssertEquals(_location.yesterdaysTemperatureF, 13, @"location should have today's temperature in farenheit");
}

- (void)testLocationCanHaveAYesterdayTemperatureCelcius
{
    _location.yesterdaysTemperatureC = 13;
    
    GHAssertEquals(_location.yesterdaysTemperatureC, 13, @"location should have today's temperature in celcius");
}

- (void)testLocationCanHaveIsRainingStatus
{
    _location.isRaining = YES;
    
    GHAssertTrue(_location.isRaining, @"it should be raining in this location today");
}

@end
