//
//  YSLocationViewController.m
//  ystrdy
//
//  Created by Jabari on 8/30/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSLocationViewController.h"
#import "YSColorHelper.h"
#import "YSFontHelper.h"

@interface YSLocationViewController ()

@property(strong, nonatomic) UIImageView *umbrellaIconImageView;
@property(strong, nonatomic) CLLocationManager *coreLocationManager;

@end

CGFloat kBackgroundAnimationTime = 1.0f;

@implementation YSLocationViewController {
    CLLocationManager *_coreLocationManager;
}

#pragma mark - builder stuff

- (void)populateTemperatureLabel
{
    _temperatureLabel = [[UILabel alloc] initWithFrame:CGRectMake(-8.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height)];
    _temperatureLabel.font = [YSFontHelper getFont:YSFontAvenirLight withSize:YSFontSizeTemperatureReadingHuge];
    _temperatureLabel.textAlignment = NSTextAlignmentCenter;
    _temperatureLabel.backgroundColor = [UIColor clearColor];
    _temperatureLabel.textColor = [YSColorHelper ystrdayWhite];
    _temperatureLabel.alpha = 0.0f;
    [self.view addSubview:_temperatureLabel];
}

- (void)populateLocationLabel
{
    _locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(-30.0f, self.view.frame.size.height - 80, self.view.frame.size.width, 100)];
    _locationLabel.backgroundColor = [UIColor clearColor];
    _locationLabel.font = [YSFontHelper getFont:YSFontAvenirRoman withSize:YSFontSizeCityNameLarge];
    _locationLabel.textAlignment = NSTextAlignmentRight;
    _locationLabel.textColor = [YSColorHelper ystrdayWhite];
    _locationLabel.alpha = 0.0f;
    [self.view addSubview:_locationLabel];
}

- (void)populatePreloader
{
    _preloader = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height)];
    _preloader.backgroundColor = [UIColor clearColor];
    _preloader.font = [YSFontHelper getFont:YSFontAvenirRoman withSize:YSFontSizeCityNameLarge];
    _preloader.textAlignment = NSTextAlignmentCenter;
    _preloader.textColor = [YSColorHelper ystrdayWhite];
    _preloader.text = NSLocalizedString(@"loading...", @"locationvc preloader text");
    [self.view addSubview:_preloader];
}

- (void)populateUmbrella
{
    _umbrellaLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 205.0f, self.view.frame.size.width, 100)];
    _umbrellaLabel.text = [NSString stringWithFormat:@"IS IT GONNA RAIN?: %@", _location.isRaining ? @"YEP" : @"NOPE"];
    _umbrellaLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_umbrellaLabel];
}

- (void)fadeTemperatureLabelIn
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.8f];
    [UIView setAnimationDelegate:self];
    _temperatureLabel.alpha = 1.0f;
    [UIView commitAnimations];
}

- (void)fadeLocationLabelIn
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3f];
    [UIView setAnimationDelegate:self];
    _locationLabel.alpha = 1.0f;
    [UIView commitAnimations];
}

#pragma mark - init stuff

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[YSColorHelper ystrdayBlue]];
    [self populateTemperatureLabel];
    [self populateLocationLabel];
    [self populatePreloader];
    
    _coreLocationManager = [[CLLocationManager alloc] init];
    _coreLocationManager.delegate = self;
    _coreLocationManager.desiredAccuracy = kCLLocationAccuracyBest;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    _manager = [_objectConfiguration locationManager];
    _manager.delegate = self;
    [_manager fetchWeatherDataForLocation:_location];
    
    [self startLocationServicesManager];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)animateBackgroundWithTemperatureDelta:(CGFloat)tempDelta
{
    if (tempDelta > 0) {
        [UIView animateWithDuration:kBackgroundAnimationTime animations:^{
            self.view.backgroundColor = [YSColorHelper ystrdayOrange];
        }];
    } else if (tempDelta < 0) {
       [UIView animateWithDuration:kBackgroundAnimationTime animations:^{
            self.view.backgroundColor = [YSColorHelper ystrdayBlue];
       }];
    } else if (tempDelta == 0) {
      [UIView animateWithDuration:kBackgroundAnimationTime animations:^{
            self.view.backgroundColor = [YSColorHelper ystrdayGreen];
      }];
    }
}

- (CGFloat)findDifferenceBetweenTodaysTemperature:(CGFloat)todaysTemperature andYesterdaysTemperature:(CGFloat)yesterdaysTemperature
{
    return todaysTemperature - yesterdaysTemperature;
}

- (NSString*)formatTemperature:(CGFloat)temperature
{
    return [NSString stringWithFormat:@"%d", abs(floorf(temperature))];
}

#pragma mark - locationmanager delegate stuff

- (void)fetchingLocationFailedWithError:(NSError *)error
{
    NSLog(@"ERROR: %@", error);
}

- (void)didReceiveLocation:(YSLocation *)location
{
    [UIView animateWithDuration:kBackgroundAnimationTime / 2 animations:^{
        _preloader.alpha = 0;
    }];
    _locationLabel.text = [location.city lowercaseString];
    [self animateBackgroundWithTemperatureDelta:[self findDifferenceBetweenTodaysTemperature:location.todaysTemperatureF andYesterdaysTemperature:location.yesterdaysTemperatureF]];
    _temperatureLabel.text = [self formatTemperature:[self findDifferenceBetweenTodaysTemperature:location.todaysTemperatureF andYesterdaysTemperature:location.yesterdaysTemperatureF]];
    [self fadeTemperatureLabelIn];
    [self fadeLocationLabelIn];
}

#pragma mark - corelocation

- (void)startLocationServicesManager
{
    [_coreLocationManager startUpdatingLocation];
}

- (void)stopLocationManager
{
    [_coreLocationManager stopUpdatingLocation];
}

#pragma mark - corelocation delegate stuff

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"CORELOCATIONMANAGERERROR: %@", error);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *currentLocation = [locations lastObject];
    
    _location = [[YSLocation alloc] initWithLatitude:[NSNumber numberWithFloat:currentLocation.coordinate.latitude] andLongitude:[NSNumber numberWithFloat:currentLocation.coordinate.longitude]];
    [_manager fetchWeatherDataForLocation:_location];
    [self stopLocationManager];
}

#pragma mark - ios7 stuff

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
