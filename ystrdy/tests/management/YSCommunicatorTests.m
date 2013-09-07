//
//  YSCommunicatrTests.m
//  ystrdy
//
//  Created by Jabari on 9/7/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSCommunicatorTests.h"
#import "YSInspectableCommunicator.h"

@implementation YSCommunicatorTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testForSearchingForWeatherDataOnWundergroundAPI
{
    YSInspectableCommunicator *communicator = [[YSInspectableCommunicator alloc] init];
    YSLocation *location = [[YSLocation alloc] initWithLatitude:@40.75013351 andLongitude:@-73.99700928];
    [communicator searchForWeatherDataWithLocation:location];
    GHAssertEqualObjects([[communicator URLToFetch] absoluteString], @"http://api.wunderground.com/api/9caa09c5d1399971/forecast/yesterday/conditions/q/40.75013351,-73.99700928.json", @"Search should be used on the Wunderground API using the Location's latitude and longitude properties");
}

@end
