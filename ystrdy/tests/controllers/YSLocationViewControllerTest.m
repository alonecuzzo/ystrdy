//
//  YSLocationViewControllerTest.m
//  ystrdy
//
//  Created by Jabari on 8/30/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSLocationViewControllerTest.h"
#import "YSLocation.h"

@interface YSLocationViewControllerTest()

@property(strong, nonatomic) YSLocationViewController *locationViewController;

@end

@implementation YSLocationViewControllerTest

- (void)setUp
{
    [super setUp];
    
    _locationViewController = [[YSLocationViewController alloc] initWithNibName:@"YSLocationViewController" bundle:nil];
}

- (void)tearDown
{
    [super tearDown];
}

#pragma mark - teeessttszz

- (void)testLocationViewControllerHasLocation
{
    YSLocation *location = [[YSLocation alloc] init];
    _locationViewController.location = location;
    
    GHAssertNotNil(_locationViewController.location, @"location view controller should have a location");
    
}

@end
