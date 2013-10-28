//
//  YSCommunicator.h
//  ystrdy
//
//  Created by Jabari on 9/2/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YSLocation.h"
#import "YSCommunicatorDelegate.h"

extern NSString* const kWundergroundAPIKey;

@interface YSCommunicator : NSObject <NSURLConnectionDataDelegate, NSURLConnectionDelegate> {
    
@protected
    NSURL *_fetchingURL;
    BOOL _isOpen;
    NSURLConnection *_fetchingConnection;
    NSMutableData *_receivedData;
    
@private
    void (^errorHandler)(NSError*);
    void (^successHandler)(NSString*);
}

@property (weak) id <YSCommunicatorDelegate> delegate;

- (void)searchForWeatherDataWithLocation:(YSLocation*)location;
- (BOOL)hasOpenConnection;
- (void)cancelAndDiscardConnection;
- (NSURLConnection*)currentURLConnection;

@end
