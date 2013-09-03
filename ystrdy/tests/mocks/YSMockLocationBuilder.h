//
//  YSMockLocationBuilder.h
//  ystrdy
//
//  Created by Jabari on 9/3/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSLocationBuilder.h"
#import "YSLocation.h"

@interface YSMockLocationBuilder : YSLocationBuilder

@property(copy) NSString *JSON;

- (YSLocation*)weatherDataForLocationFromJSON:(NSString*)json;

@end
