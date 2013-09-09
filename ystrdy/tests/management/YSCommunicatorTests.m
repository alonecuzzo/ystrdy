//
//  YSCommunicatrTests.m
//  ystrdy
//
//  Created by Jabari on 9/7/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSCommunicatorTests.h"
#import "YSInspectableCommunicator.h"
#import "YSMockLocationManager.h"
#import "YSNonNetworkedCommunicator.h"
#import "YSFakeURLResponse.h"

@interface YSCommunicatorTests()

@property YSInspectableCommunicator *communicator;
@property YSLocation *location;
@property YSNonNetworkedCommunicator *nnCommunicator;
@property YSMockLocationManager *manager;
@property YSFakeURLResponse *fourOhFourResponse;
@property NSData *receivedData;

@end

@implementation YSCommunicatorTests

- (void)setUp
{
    [super setUp];
    
    _location = [[YSLocation alloc] initWithLatitude:@40.75013351 andLongitude:@-73.99700928];
    _communicator = [[YSInspectableCommunicator alloc] init];
    _nnCommunicator = [[YSNonNetworkedCommunicator alloc] init];
    _manager = [[YSMockLocationManager alloc] init];
    _nnCommunicator.delegate = _manager;
    _fourOhFourResponse = [[YSFakeURLResponse alloc] initWithStatusCode:404];
    _receivedData = [@"Weather" dataUsingEncoding:NSUTF8StringEncoding];
}

- (void)tearDown
{
    [super tearDown];
    
    _location = nil;
    _communicator = nil;
    _nnCommunicator = nil;
    _manager = nil;
    _fourOhFourResponse = nil;
    _receivedData = nil;
}

#pragma mark - tesssstttzzz

- (void)testForSearchingForWeatherDataOnWundergroundAPI
{
    [_communicator searchForWeatherDataWithLocation:_location];
    GHAssertEqualObjects([[_communicator URLToFetch] absoluteString], @"http://api.wunderground.com/api/9caa09c5d1399971/forecast/yesterday/conditions/q/40.75013351,-73.99700928.json", @"Search should be used on the Wunderground API using the Location's latitude and longitude properties");
}

- (void)testSearchingForWeatherDataCreatesNSURLConnection
{
    [_communicator searchForWeatherDataWithLocation:_location];
    GHAssertNotNil([_communicator currentURLConnection], @"Searching for data should create an active url connection.");
    [_communicator cancelAndDiscardConnection];
}

- (void)testThatActiveConnectionIsCancelledWhenNewSearchMade
{
    [_communicator searchForWeatherDataWithLocation:_location];
    NSURLConnection *firstConnection = [_communicator currentURLConnection];
    YSLocation *secondLocation = [[YSLocation alloc] initWithLatitude:@34.33 andLongitude:@123.333];
    [_communicator searchForWeatherDataWithLocation:secondLocation];
    GHAssertFalse(firstConnection == [_communicator currentURLConnection], @"Communicator should cancel current url connection before searching again.");
    [_communicator cancelAndDiscardConnection];
}

- (void)testThatReceivingResponseDiscardsExistingData
{
    _nnCommunicator.receivedData = [@"LOLZ" dataUsingEncoding:NSUTF8StringEncoding];
    [_nnCommunicator searchForWeatherDataWithLocation:_location];
    [_nnCommunicator connection:nil didFailWithError:nil];
    GHAssertEquals([_nnCommunicator.receivedData length], (NSUInteger)0, @"Old received data should be cleared out.");
}

- (void)testThatReceiving404ErrorPassesErrorToDelegate
{
    [_nnCommunicator searchForWeatherDataWithLocation:_location];
    [_nnCommunicator connection:nil didReceiveResponse:(NSURLResponse*)_fourOhFourResponse];
    GHAssertEquals([_manager weatherFailureErrorCode], (NSInteger)404, @"Delegate should know about 404 error.");
}

@end
