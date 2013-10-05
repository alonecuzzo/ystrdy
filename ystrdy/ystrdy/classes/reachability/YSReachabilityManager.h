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

+ (YSReachabilityManager*)sharedInstance;

@end
