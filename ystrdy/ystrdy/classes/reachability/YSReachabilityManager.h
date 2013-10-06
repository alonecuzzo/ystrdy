//
//  YSReachabilityManager.h
//  ystrdy
//
//  Created by Jabari on 10/5/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Reachability/Reachability.h>

@class Reachability;

@interface YSReachabilityManager : NSObject

@property (strong, nonatomic) Reachability *reachability;

+ (YSReachabilityManager*)sharedInstance;

+ (BOOL)isReachable;
+ (BOOL)isUnReachable;
+ (BOOL)isReachableViaWWAN;
+ (BOOL)isReachableViaWifi;

@end
