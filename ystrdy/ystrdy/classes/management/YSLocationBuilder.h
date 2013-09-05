//
//  YSLocationBuilder.h
//  ystrdy
//
//  Created by Jabari on 9/2/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YSLocation.h"

enum {
    YSLocationBuilderCurrentWeatherDataInvalidJSONError,
    YSLocationBuilderYesterdaysWeatherDataInvalidJSONError,
    YSLocationBuilderMissingDataError
};

@interface YSLocationBuilder : NSObject

@property(strong, nonatomic) NSError *errorToSet;

- (YSLocation*)currentWeatherDataForLocationFromJSON:(NSString*)currentJSON andYesterdaysWeatherDataForLocationFromJSON:(NSString*)yesterdayJSON error:(NSError**)error;

@end
