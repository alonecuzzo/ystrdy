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

- (YSLocation*)currentWeatherDataForLocationFromJSON:(NSString*)currentJSON andYesterdaysWeatherDataForLocationFromJSON:(NSString*)yesterdayJSON error:(NSError**)error
{
    NSParameterAssert(currentJSON != nil);
    NSParameterAssert(yesterdayJSON != nil);
    
    NSData *currentUnicodeNotation = [currentJSON dataUsingEncoding:NSUTF8StringEncoding];
    NSData *yesterdaysUnicodeNotation = [yesterdayJSON dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *localError = nil;
    
    id currentJSONObject = [NSJSONSerialization JSONObjectWithData:currentUnicodeNotation options:0 error:&localError];
    id yesterdayJSONObject = [NSJSONSerialization JSONObjectWithData:yesterdaysUnicodeNotation options:0 error:&localError];
    
    NSDictionary *parsedCurrentLocation = (id)currentJSONObject;
    NSDictionary *parsedYesterdayLocation = (id)yesterdayJSONObject;
    
    NSLog(@"current parsed location %@", parsedCurrentLocation);
    NSLog(@"yesterday parsed location %@", parsedYesterdayLocation);
    
    if (parsedCurrentLocation == nil || parsedCurrentLocation == NULL) {
        if (error != NULL) {
            *error = [NSError errorWithDomain:YSLocationBuilderErrorDomain code:YSLocationBuilderCurrentWeatherDataInvalidJSONError userInfo:nil];
        }
        return nil;
    }
    
    if (parsedYesterdayLocation == nil || parsedYesterdayLocation == NULL) {
        if (error != NULL) {
            *error = [NSError errorWithDomain:YSLocationBuilderErrorDomain code:YSLocationBuilderYesterdaysWeatherDataInvalidJSONError userInfo:nil];
        }
        return nil;
    }
    
    YSLocation *locationToReturn = [[YSLocation alloc] init];
    
    NSDictionary *currentObservationDictionary = [parsedCurrentLocation objectForKey:@"current_observation"];
    NSDictionary *currentDisplayLocationDictionary = [currentObservationDictionary objectForKey:@"display_location"];
    
    if ([currentDisplayLocationDictionary objectForKey:@"city"]) {
        locationToReturn.city = [currentDisplayLocationDictionary objectForKey:@"city"];
    }
    
    if ([currentDisplayLocationDictionary objectForKey:@"latitude"]) {
        locationToReturn.latitude = [[currentDisplayLocationDictionary objectForKey:@"latitude"] floatValue];
    }

    if ([currentDisplayLocationDictionary objectForKey:@"longitude"]) {
        locationToReturn.longitude = [[currentDisplayLocationDictionary objectForKey:@"longitude"] floatValue];
    }
    
    return locationToReturn;
}


@end
