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
@property(readwrite, assign) CGFloat todaysTemperatureF;
@property(readwrite, assign) CGFloat todaysTemperatureC;
@property(readwrite, assign) CGFloat yesterdaysTemperatureF;
@property(readwrite, assign) CGFloat yesterdaysTemperatureC;
@property(nonatomic, strong) NSNumber *latitude;
@property(nonatomic, strong) NSNumber *longitude;
@property(readwrite, assign) BOOL isRaining;

- (id)initWithLatitude:(NSNumber*)latitude andLongitude:(NSNumber*)longitude;

@end
