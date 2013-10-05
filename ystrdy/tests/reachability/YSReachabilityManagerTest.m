//
//  YSReachabilityManagerTest.m
//  ystrdy
//
//  Created by Jabari on 10/5/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSReachabilityManagerTest.h"
#import "YSReachabilityManager.h"

@interface YSReachabilityManagerTest()

@property(nonatomic, strong) YSReachabilityManager *reachabilityManger;

@end

@implementation YSReachabilityManagerTest

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

- (void)testThatReachabilitySharedInstanceIsYSReachabilityManger
{
    GHAssertEqualObjects([_reachabilityManger class], [YSReachabilityManager class], @"The reachability manager should be of ysreachabilitymanager type.");
}

@end
