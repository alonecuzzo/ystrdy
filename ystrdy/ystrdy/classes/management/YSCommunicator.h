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

@interface YSCommunicator : NSObject {
    @protected
    NSURL *fetchingURL;
}

- (void)searchForWeatherDataWithLocation:(YSLocation*)location;

@end
