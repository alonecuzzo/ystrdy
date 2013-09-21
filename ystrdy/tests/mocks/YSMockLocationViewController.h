//
//  YSMockLocationViewController.h
//  ystrdy
//
//  Created by Jabari on 9/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSLocationViewController.h"
#import "YSLocationManager.h"

@interface YSMockLocationViewController : YSLocationViewController

@property(strong, nonatomic) YSLocationManager *manager;

- (void)animateBackgroundWithTemperatureDelta:(CGFloat)tempDelta;

@end
