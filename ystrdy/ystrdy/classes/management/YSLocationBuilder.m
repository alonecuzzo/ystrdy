//
//  YSLocationBuilder.m
//  ystrdy
//
//  Created by Jabari on 9/2/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSLocationBuilder.h"

@implementation YSLocationBuilder

static NSString *YSLocationBuilderErrorDomain = @"YSLocationBuilderErrorDomain";

- (YSLocation*)currentWeatherDataForLocationFromJSON:(NSString*)json error:(NSError**)error
{
    NSParameterAssert(json != nil);
    
    NSData *unicodeNotation = [json dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *localError = nil;
    
    id currentJSONObject = [NSJSONSerialization JSONObjectWithData:unicodeNotation options:0 error:&localError];
    
    NSDictionary *parsedLocation = (id)currentJSONObject;
    
    if (parsedLocation == nil || parsedLocation == NULL) {
        if (error != NULL) {
            *error = [NSError errorWithDomain:YSLocationBuilderErrorDomain code:YSLocationBuilderWeatherDataInvalidJSONError userInfo:nil];
        }
        return nil;
    }
    
    YSLocation *locationToReturn = [[YSLocation alloc] init];
    
    NSDictionary *forecastDictionary = [parsedLocation objectForKey:@"forecast"];
    NSDictionary *simpleForecastDictionary;
    NSArray *forecastDayArray;
    NSDictionary *forecastDayDictionary;
    if (!forecastDictionary) {
        if (error != NULL) {
             *error = [NSError errorWithDomain:YSLocationBuilderErrorDomain code:YSLocationBuilderMissingForecastDataError userInfo:nil];
        }
        return  nil;
    }
    if ([forecastDictionary respondsToSelector:@selector(objectForKey:)]) {
        simpleForecastDictionary = [forecastDictionary objectForKey:@"simpleforecast"];
    }
    if (simpleForecastDictionary) {
        forecastDayArray = [simpleForecastDictionary objectForKey:@"forecastday"];
    }
    if (forecastDayArray) {
        forecastDayDictionary = [forecastDayArray objectAtIndex:0];
    }
    
    NSDictionary *yesterdayDictionary = [parsedLocation objectForKey:@"history"];
    NSArray *dailySummaryArray;
    NSDictionary *dailySummaryDictionary;
    if (!yesterdayDictionary) {
        if (error != NULL) {
             *error = [NSError errorWithDomain:YSLocationBuilderErrorDomain code:YSLocationBuilderMissingYesterdayDataError userInfo:nil];
        }
        return nil;
    }
    
    if ([yesterdayDictionary respondsToSelector:@selector(objectForKey:)]) {
        dailySummaryArray = [yesterdayDictionary objectForKey:@"dailysummary"];
    }
    
    if (dailySummaryArray) {
        dailySummaryDictionary = [dailySummaryArray objectAtIndex:0];
    }
    
    NSDictionary *currentConditionsDictionary = [parsedLocation objectForKey:@"current_observation"];
    NSDictionary *currentDisplayLocationDictionary;
    if (!currentConditionsDictionary) {
        if (error != NULL) {
            *error = [NSError errorWithDomain:YSLocationBuilderErrorDomain code:YSLocationBuilderMissingConditionsDataError userInfo:nil];
        }
        return  nil;
    }
    if ([currentConditionsDictionary respondsToSelector:@selector(objectForKey:)]) {
        currentDisplayLocationDictionary = [currentConditionsDictionary objectForKey:@"display_location"];
    }
    
    if ([currentDisplayLocationDictionary objectForKey:@"city"]) {
        locationToReturn.city = [currentDisplayLocationDictionary objectForKey:@"city"];
    }
    
    if ([currentDisplayLocationDictionary objectForKey:@"latitude"]) {
        locationToReturn.latitude = [NSNumber numberWithDouble:[[currentDisplayLocationDictionary objectForKey:@"latitude"] doubleValue]];
    }

    if ([currentDisplayLocationDictionary objectForKey:@"longitude"]) {
        locationToReturn.longitude = [NSNumber numberWithDouble:[[currentDisplayLocationDictionary objectForKey:@"longitude"] doubleValue]];
    }
    
    if ([currentConditionsDictionary objectForKey:@"temp_f"]) {
        locationToReturn.todaysTemperatureF = [[currentConditionsDictionary objectForKey:@"temp_f"] floatValue];
    }
    
    if ([currentConditionsDictionary objectForKey:@"temp_c"]) {
        locationToReturn.todaysTemperatureC = [[currentConditionsDictionary objectForKey:@"temp_c"] floatValue];
    }
    
    if ([dailySummaryDictionary objectForKey:@"meantempm"]) {
        locationToReturn.yesterdaysTemperatureC = [[dailySummaryDictionary objectForKey:@"meantempm"] floatValue];
    }
    
    if ([dailySummaryDictionary objectForKey:@"meantempi"]) {
        locationToReturn.yesterdaysTemperatureF = [[dailySummaryDictionary objectForKey:@"meantempi"] floatValue];
    }
    
    if ([forecastDayDictionary objectForKey:@"pop"]) {
        float pop = [[forecastDayDictionary objectForKey:@"pop"] floatValue];
        if (pop > 30) {
            locationToReturn.isRaining = YES;
        } else {
            locationToReturn.isRaining = NO;
        }
    }
    
    return locationToReturn;
}


@end
