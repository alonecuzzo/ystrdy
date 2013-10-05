//
//  YSReachabilityManagerTest.m
//  ystrdy
//
//  Created by Jabari on 10/5/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSReachabilityManagerTest.h"
#import "YSReachabilityManager.h"
#import <objc/runtime.h>

@interface YSReachabilityManagerTest()

@property(nonatomic, strong) YSReachabilityManager *reachabilityManger;

@end

@implementation YSReachabilityManagerTest

#pragma mark - setupz stuff

- (void)setUp
{
    [super setUp];
    _reachabilityManger = [YSReachabilityManager sharedInstance];
}

- (void)tearDown
{
    _reachabilityManger = nil;
    [super tearDown];
}

#pragma mark - singleton tesstsss

- (void)testThatReachabilitySharedInstanceIsYSReachabilityManager
{
    GHAssertEqualObjects([_reachabilityManger class], [YSReachabilityManager class], @"The reachability manager should be of ysreachabilitymanager type.");
}

- (void)testThatReachabilitySharedInstanceIsNotEqualToNewlyInitializedManager
{
    YSReachabilityManager *manager = [[YSReachabilityManager alloc] init];

    GHAssertNotEqualObjects(_reachabilityManger, manager, @"The reachability manager should not be equal to a locally created manager.");
}

- (void)testThatReachabilitySharedInstanceIsEqualToManagerCreatedFromSameSingleton
{
    YSReachabilityManager *manager = [YSReachabilityManager sharedInstance];
    
    GHAssertEqualObjects(_reachabilityManger, manager, @"The reachability manager should be equal to a locally created manager using singleton.");
}

#pragma mark - reachability method tessts
- (void)testThatManagerHasReachabilityProperty
{
    objc_property_t reachabilityProperty = class_getProperty([_reachabilityManger class], "reachability");
    
    GHAssertTrue(reachabilityProperty != NULL, @"Reachability manager should have a reachability property.");
}

@end
