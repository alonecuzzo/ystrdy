//
//  YSLocationManagerDelegate.h
//  ystrdy
//
//  Created by Jabari on 9/9/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YSLocation.h"

@protocol YSLocationManagerDelegate <NSObject>

- (void)fetchingLocationsFailedWithError:(NSError*)error;
- (void)didReceiveLocation:(YSLocation*)location;

@end
