//
//  YSLocationManager.m
//  ystrdy
//
//  Created by Jabari on 9/2/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSLocationManager.h"

NSString *YSManagerError = @"YSManagerError";
NSString *YSManagerSearchFailedError = @"YSManagerSearchFailedError";

@interface YSLocationManager() {
    struct {
        unsigned int fetchingLocationFailedWithError : 1;
        unsigned int didReceiveLocation              : 1;
    } _delegateFlags;
}

@end

@implementation YSLocationManager

- (void)setDelegate:(id<YSLocationManagerDelegate>)delegate
{
    if (delegate && ![delegate conformsToProtocol:@protocol(YSLocationManagerDelegate)]) {
        [[NSException exceptionWithName:NSInvalidArgumentException reason:@"Delegate object does not conform to it's protocol." userInfo:nil] raise];
    }
    
    _delegateFlags.fetchingLocationFailedWithError = [delegate respondsToSelector:@selector(fetchingLocationFailedWithError:)];
    
    _delegateFlags.didReceiveLocation = [delegate respondsToSelector:@selector(didReceiveLocation:)];
    
    _delegate = delegate;
}

- (void)fetchWeatherDataForLocation:(YSLocation*)location
{
    [_communicator searchForWeatherDataWithLocation:location];
}

- (void)searchForWeatherDataFailedWithError:(NSError*)error
{
    NSDictionary *errorInfo = [NSDictionary dictionaryWithObject:error forKey:NSUnderlyingErrorKey];
    NSError *reportableError = [NSError errorWithDomain:YSManagerError code:YSErrorLocationSearchCode userInfo:errorInfo];
    if (_delegateFlags.fetchingLocationFailedWithError) {
        [_delegate fetchingLocationFailedWithError:reportableError];
    }
}

- (void)tellDelegateAboutLocationSearchError:(NSError*)error
{
    NSError *reportableError;
    
    if (error) {
        reportableError = [NSError errorWithDomain:YSManagerSearchFailedError code:YSErrorLocationSearchCode userInfo:[NSDictionary dictionaryWithObject:error forKey:NSUnderlyingErrorKey]];
    } else {
        reportableError = [NSError errorWithDomain:YSManagerSearchFailedError code:YSErrorLocationSearchCode userInfo:nil];
    }
    
    if (_delegateFlags.fetchingLocationFailedWithError) {
        [_delegate fetchingLocationFailedWithError:reportableError];
    }
}

- (void)receivedWeatherDataFromJSON:(NSString*)json
{
    NSError *error = nil;
    YSLocation *locationData = [_locationBuilder currentWeatherDataForLocationFromJSON:json error:&error];
    if (!locationData) {
        [self tellDelegateAboutLocationSearchError:error];
    } else {
        if (_delegateFlags.didReceiveLocation) {
            [_delegate didReceiveLocation:locationData];
        }
    }
}

- (void)fetchingLocationFailedWithError:(NSError *)error
{
    
}

- (void)searchingForWeatherDataFailedWithError:(NSError *)error
{
    
}

- (void)didReceiveLocation:(YSLocation *)location
{
    
}

@end
