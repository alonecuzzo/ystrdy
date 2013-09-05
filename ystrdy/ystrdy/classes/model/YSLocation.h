//
//  YSLocation.h
//  ystrdy
//
//  Created by Jabari on 8/30/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YSLocation : NSObject

@property(nonatomic, strong) NSString *city;
@property(readwrite, assign) NSInteger todaysTemperatureF;
@property(readwrite, assign) NSInteger todaysTemperatureC;
@property(readwrite, assign) NSInteger yesterdaysTemperatureF;
@property(readwrite, assign) NSInteger yesterdaysTemperatureC;
@property(readwrite, assign) CGFloat latitude;
@property(readwrite, assign) CGFloat longitude;
@property(readwrite, assign) BOOL isRaining;

- (id)initWithLatitude:(CGFloat)latitude andLongitude:(CGFloat)longitude;

@end
