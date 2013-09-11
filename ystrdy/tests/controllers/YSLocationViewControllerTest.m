//
//  YSLocationViewControllerTest.m
//  ystrdy
//
//  Created by Jabari on 8/30/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSLocationViewControllerTest.h"
#import "YSLocation.h"
#import <objc/runtime.h>

@interface YSLocationViewControllerTest()

@property(strong, nonatomic) YSLocationViewController *locationViewController;

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
    objc_property_t umbrellaIconProperty = class_getProperty([_locationViewController class], "umbrellaIconImageView");
    
    GHAssertTrue(umbrellaIconProperty != NULL, @"Location View Controller should have an umbrella icon image view.");
}

@end
