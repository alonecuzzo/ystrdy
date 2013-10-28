//
//  YSCommunicatorDelegate.h
//  ystrdy
//
//  Created by Jabari on 9/9/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YSLocation.h"

@protocol YSCommunicatorDelegate <NSObject>

- (void)searchingForWeatherDataFailedWithError:(NSError*)error;

- (void)fetchingLocationFailedWithError:(NSError*)error;

- (void)receivedWeatherDataFromJSON:(NSString*)json;

@end
