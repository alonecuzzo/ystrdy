//
//  YSLocation.h
//  ystrdy
//
//  Created by Jabari on 8/30/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YSLocation : NSObject

@property(nonatomic, strong) NSString *name;
@property(readwrite, assign) NSInteger todaysTemperature;
@property(readwrite, assign) NSInteger yesterdaysTemperature;
@property(readwrite, assign) CGFloat latitude;
@property(readwrite, assign) CGFloat longitude;
@property(readwrite, assign) BOOL isRaining;

- (id)initWithLatitude:(CGFloat)latitude andLongitude:(CGFloat)longitude;

@end
