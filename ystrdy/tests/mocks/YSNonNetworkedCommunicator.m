//
//  YSNonNetworkedCommunicator.m
//  ystrdy
//
//  Created by Jabari on 9/7/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSNonNetworkedCommunicator.h"

@implementation YSNonNetworkedCommunicator

- (void)setReceivedData:(NSData *)data
{
    _receivedData = [data mutableCopy];
}

- (NSData*)receivedData
{
    return [_receivedData copy];
}

@end
