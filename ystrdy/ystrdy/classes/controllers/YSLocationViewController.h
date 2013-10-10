//
//  YSLocationViewController.h
//  ystrdy
//
//  Created by Jabari on 8/30/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSLocation.h"
#import "YSLocationManagerDelegate.h"
#import "YSLocationManager.h"
#import "YSObjectConfiguration.h"
#import <CoreLocation/CoreLocation.h>

@interface YSLocationViewController : UIViewController <YSLocationManagerDelegate, CLLocationManagerDelegate>
    
@property(strong, nonatomic) YSLocation *location;
@property(strong, nonatomic) UILabel *temperatureLabel;
@property(strong, nonatomic) UILabel *umbrellaLabel;
@property(strong, nonatomic) UILabel *locationLabel;
@property(strong, nonatomic) YSLocationManager *manager;
@property(strong, nonatomic) YSObjectConfiguration *objectConfiguration;
@property(strong, nonatomic) UILabel *preloader;

- (void)hideRefreshButtonOnEnterBackground;

@end
