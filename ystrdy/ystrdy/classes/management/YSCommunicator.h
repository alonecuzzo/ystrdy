//
//  YSCommunicator.h
//  ystrdy
//
//  Created by Jabari on 9/2/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YSLocation.h"

extern NSString* const kWundergroundAPIKey;

@interface YSCommunicator : NSObject <NSURLConnectionDelegate>{
    @protected
    NSURL *_fetchingURL;
    BOOL _isOpen;
    NSURLConnection *_fetchingConnection;
    NSMutableData *_receivedData;
}

- (void)searchForWeatherDataWithLocation:(YSLocation*)location;
- (BOOL)hasOpenConnection;
- (void)cancelAndDiscardConnection;
- (NSURLConnection*)currentURLConnection;

@end
