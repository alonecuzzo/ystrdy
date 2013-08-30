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

- (void)testLocationCanHaveName
{
    _location.name = @"Santiago";
    
    GHAssertTrue([_location.name isEqualToString:@"Santiago"], @"location name should equal expected value, Santiago");
}

@end
