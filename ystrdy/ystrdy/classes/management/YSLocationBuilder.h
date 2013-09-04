//
//  YSLocationBuilder.h
//  ystrdy
//
//  Created by Jabari on 9/2/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YSLocation.h"

@interface YSLocationBuilder : NSObject

@property(strong, nonatomic) NSError *errorToSet;

- (YSLocation*)weatherDataForLocationFromJSON:(NSString*)json error:(NSError**)error;

@end
