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
    
    NSLog(@"current parsed location %@", parsedLocation);
    
    if (parsedLocation == nil || parsedLocation == NULL) {
        if (error != NULL) {
            *error = [NSError errorWithDomain:YSLocationBuilderErrorDomain code:YSLocationBuilderWeatherDataInvalidJSONError userInfo:nil];
        }
        return nil;
    }
    
    YSLocation *locationToReturn = [[YSLocation alloc] init];
    
    NSDictionary *currentObservationDictionary = [parsedLocation objectForKey:@"current_observation"];
    NSDictionary *currentDisplayLocationDictionary = [currentObservationDictionary objectForKey:@"display_location"];
    
    NSDictionary *forecastDictionary = [parsedLocation objectForKey:@"forecast"];
    
    if (!forecastDictionary) {
        if (error != NULL) {
             *error = [NSError errorWithDomain:YSLocationBuilderErrorDomain code:YSLocationBuilderMissingForecastDataError userInfo:nil];
        }
        return  nil;
    }
    
    if ([currentDisplayLocationDictionary objectForKey:@"city"]) {
        locationToReturn.city = [currentDisplayLocationDictionary objectForKey:@"city"];
    }
    
    if ([currentDisplayLocationDictionary objectForKey:@"latitude"]) {
        locationToReturn.latitude = [[currentDisplayLocationDictionary objectForKey:@"latitude"] floatValue];
    }

    if ([currentDisplayLocationDictionary objectForKey:@"longitude"]) {
        locationToReturn.longitude = [[currentDisplayLocationDictionary objectForKey:@"longitude"] floatValue];
    }
    
    if ([currentDisplayLocationDictionary objectForKey:@"temp_f"]) {
        locationToReturn.todaysTemperatureF = [[currentDisplayLocationDictionary objectForKey:@"temp_f"] floatValue];
    }
    
    if ([currentDisplayLocationDictionary objectForKey:@"temp_c"]) {
        locationToReturn.todaysTemperatureC = [[currentDisplayLocationDictionary objectForKey:@"temp_c"] floatValue];
    }
    
    if ([currentDisplayLocationDictionary objectForKey:@""]) {
        
    }
    
    return locationToReturn;
}


@end
