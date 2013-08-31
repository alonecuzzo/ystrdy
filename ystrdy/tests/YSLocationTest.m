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
}

#pragma mark - tessssts

- (void)testLocationCanHaveAName
{
    _location.name = @"Santiago";
    
    GHAssertTrue([_location.name isEqualToString:@"Santiago"], @"location name should equal expected value, Santiago");
}

- (void)testLocationCanHaveATodayTemperature
{
    _location.todaysTemperature = 14;

    GHAssertEquals(_location.todaysTemperature, 14, @"todays temperature should equal 14");
}

- (void)testLocationCanHaveAYesterdayTemperature
{
    _location.yesterdaysTemperature = 13;
    
    GHAssertEquals(_location.yesterdaysTemperature, 13, @"yesterdays temperature should be equal to 13");
}

- (void)testLocationCanHaveIsRainingStatus
{
    _location.isRaining = YES;
    
    GHAssertTrue(_location.isRaining, @"it should be raining in this location today");
}

@end
