//
//  YSLocationViewControllerTest.m
//  ystrdy
//
//  Created by Jabari on 8/30/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSLocationViewControllerTest.h"
#import "YSLocationViewController.h"
#import "YSMockLocationManager.h"
#import "YSLocationManagerDelegate.h"
#import "YSLocationViewController.h"
#import "YSLocation.h"
#import <objc/runtime.h>

@interface YSLocationViewControllerTest()

@property(strong, nonatomic) YSLocationViewController *locationViewController;
@property(strong, nonatomic) YSMockLocationManager *manager;

@end

@implementation YSLocationViewControllerTest

- (void)setUp
{
    [super setUp];
    
    _locationViewController = [[YSLocationViewController alloc] init];
}

- (void)tearDown
{
    [super tearDown];
}

#pragma mark - teeessttszz

- (void)testThatLocationViewControllerHasLocationProperty
{
    objc_property_t locationProperty = class_getProperty([_locationViewController class], "location");
    
    GHAssertTrue(locationProperty != NULL, @"Location View Controller needs location property.");
}

- (void)testThatLocationViewControllerHasLocationLabelProperty
{
    objc_property_t locationLabelProperty = class_getProperty([_locationViewController class], "locationLabel");
    
    GHAssertTrue(locationLabelProperty != NULL, @"Location View Controller needs location label property.");
}

- (void)testThatLocationViewControllerHasTemperatureLabelProperty
{
    objc_property_t temperatureLabelProperty = class_getProperty([_locationViewController class], "temperatureLabel");
    
    GHAssertTrue(temperatureLabelProperty != NULL, @"Location View Controller needs temperature label property.");
}

- (void)testThatLocationViewControllerHasUmbrellaIconImageViewProperty
{
    objc_property_t umbrellaIconImageViewProperty = class_getProperty([_locationViewController class], "umbrellaIconImageView");
    
    GHAssertTrue(umbrellaIconImageViewProperty != NULL, @"Location View Controller should have an umbrella icon image view.");
}

- (void)testViewWillAppearCreatesAYSLocationManager
{
    [_locationViewController viewWillAppear:YES];
    
    GHAssertNotNil(_locationViewController.manager, @"Location View Controller should create a manager on viewwillappear");
}

- (void)testViewControllerConformsToYSLocationManagerProtocol
{
    GHAssertTrue([_locationViewController conformsToProtocol:@protocol(YSLocationManagerDelegate)], @"Location View Controller should conform to YSLocationManager protocol.");
}

- (void)testThatLocationManagerDelegateIsYSLocationViewController
{
    [_locationViewController viewWillAppear:YES];
    
    GHAssertEqualObjects(_locationViewController.manager.delegate, _locationViewController, @"Location View Controller should be its manager's delegate.");
}

- (void)testThatViewControllerHasLocationToSend
{
    [_locationViewController viewWillAppear:YES];
    
    GHAssertNotNil(_locationViewController.location, @"Location View Controller should have a Location to send to get weather data for.");
}

- (void)testThatLocationIsSearchedOnYSLocationViewControllerViewWillAppear
{
    
}

@end
