//
//  YSMockLocationManagerDelegate.m
//  ystrdy
//
//  Created by Jabari on 9/2/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSMockLocationManagerDelegate.h"

@implementation YSMockLocationManagerDelegate 

- (void)fetchingLocationFailedWithError:(NSError*)error
{
    _fetchError = error;
}

- (void)didReceiveLocation:(YSLocation*)location;
{
    _receivedLocation = location;
}

@end
