//
//  YSCommunicator.m
//  ystrdy
//
//  Created by Jabari on 9/2/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSCommunicator.h"

NSString *const kWundergroundAPIKey = @"9caa09c5d1399971";
static NSString *APIURLBase = @"http://api.wunderground.com/api/";
static NSString *APIURLConditions = @"forecast/yesterday/conditions/";
static NSString *APIURLQueryPrefix = @"q/";
static NSString *YSCommunicatorErrorDomain = @"YSCommunicatorErrorDomain";

@implementation YSCommunicator

- (void)fetchContentAtURL:(NSURL *)url errorHandler:(void (^)(NSError *))errorBlock successHandler:(void (^)(NSString *))successBlock {
    _fetchingURL = url;
    errorHandler = errorBlock;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self cancelAndDiscardConnection];
    _fetchingConnection = [NSURLConnection connectionWithRequest:request delegate:self];
}

- (void)searchForWeatherDataWithLocation:(YSLocation*)location
{
    NSString *fetchingURLString = [NSString stringWithFormat:@"%@%@/%@%@%@,%@.json", APIURLBase, kWundergroundAPIKey, APIURLConditions, APIURLQueryPrefix, location.latitude, location.longitude];
    [self fetchContentAtURL:[NSURL URLWithString:fetchingURLString] errorHandler:^(NSError *error) {
        [_delegate searchingForWeatherDataFailedWithError:error];
    } successHandler:^(NSString *json) {
//        [delegate ]
    }];
}

- (BOOL)hasOpenConnection
{
    return _isOpen;
}

- (void)cancelAndDiscardConnection
{
    [_fetchingConnection cancel];
    _fetchingConnection = nil;
}

- (NSURLConnection*)currentURLConnection
{
    return _fetchingConnection;
}

#pragma mark - NSURLConnection delegate stuff

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    _receivedData = nil;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    _receivedData = nil;
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
    if ([httpResponse statusCode] != 200) {
        NSError *reportableError = [NSError errorWithDomain:YSCommunicatorErrorDomain code:[httpResponse statusCode] userInfo:nil];
        errorHandler(reportableError);
    }
}

@end
