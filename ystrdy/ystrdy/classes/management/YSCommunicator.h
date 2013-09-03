//
//  YSCommunicator.h
//  ystrdy
//
//  Created by Jabari on 9/2/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YSLocation.h"

@interface YSCommunicator : NSObject

- (void)searchForWeatherDataWithLocation:(YSLocation*)location;

@end
