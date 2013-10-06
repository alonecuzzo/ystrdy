//
//  YSReachabilityManager.m
//  ystrdy
//
//  Created by Jabari on 10/5/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSReachabilityManager.h"

@implementation YSReachabilityManager

+ (YSReachabilityManager*)sharedInstance
{
    static YSReachabilityManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[self alloc] init];
    });
    return _sharedManager;
}

+ (BOOL)isReachable
{
    return [[[YSReachabilityManager sharedInstance] reachability] isReachable];
}

+ (BOOL)isUnReachable
{
    return ![[[YSReachabilityManager sharedInstance] reachability] isReachable];
}

+ (BOOL)isReachableViaWWAN
{
    return [[[YSReachabilityManager sharedInstance] reachability] isReachableViaWWAN];
}

+ (BOOL)isReachableViaWifi
{
    return [[[YSReachabilityManager sharedInstance] reachability] isReachableViaWiFi];
}

- (id)init
{
    self = [super init];
    
    if (self) {
        self.reachability = [Reachability reachabilityWithHostname:@"www.google.com"];
        [self.reachability startNotifier];
    }
    return self;
}

@end
