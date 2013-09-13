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

@end

@implementation YSLocationViewController

#pragma mark - builder stuff

- (NSString*)temperatureDifference
{
//    return [NSString stringWithFormat:@"%i", _location.todaysTemperature - _location.yesterdaysTemperature];
    return 0;
}

- (void)setupLocation
{
    //this will get set outside of vc eventually
    _location = [[YSLocation alloc] init];
    _location.city = NSLocalizedString(@"Santiago, Chile", @"location name");
//    _location.yesterdaysTemperature = 17;
//    _location.todaysTemperature = 19;
    _location.isRaining = YES;
}

- (void)populateTemperature
{
    _temperatureLabel = [[UILabel alloc] initWithFrame:CGRectMake(-8.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height)];
    _temperatureLabel.font = [YSFontHelper getFont:YSFontAvenirLight withSize:YSFontSizeTemperatureReadingHuge];
    _temperatureLabel.textAlignment = NSTextAlignmentCenter;
    _temperatureLabel.backgroundColor = [UIColor clearColor];
    _temperatureLabel.textColor = [YSColorHelper ystrdayWhite];
    [self.view addSubview:_temperatureLabel];
}

- (void)populateLocation
{
    _locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(-30.0f, self.view.frame.size.height - 80, self.view.frame.size.width, 100)];
    _locationLabel.text = [NSString stringWithFormat:@"Location: %@", _location.city];
    _locationLabel.backgroundColor = [UIColor clearColor];
    _locationLabel.font = [YSFontHelper getFont:YSFontAvenirRoman withSize:YSFontSizeCityNameLarge];
    _locationLabel.textAlignment = NSTextAlignmentRight;
    _locationLabel.textColor = [YSColorHelper ystrdayWhite];
    [self.view addSubview:_locationLabel];
}

- (void)populateUmbrella
{
    _umbrellaLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 205.0f, self.view.frame.size.width, 100)];
    _umbrellaLabel.text = [NSString stringWithFormat:@"IS IT GONNA RAIN?: %@", _location.isRaining ? @"YEP" : @"NOPE"];
    _umbrellaLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_umbrellaLabel];
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
//    [self setupLocation];
    [self populateTemperature];
    [self populateLocation];
//    [self populateUmbrella];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    //TODO: put in real location
    _location = [[YSLocation alloc] initWithLatitude:[NSNumber numberWithDouble:40.75013351] andLongitude:[NSNumber numberWithDouble:-73.99700928]];
    _manager = [_objectConfiguration locationManager];
    _manager.delegate = self;
    [_manager fetchWeatherDataForLocation:_location];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    NSLog(@"got a location! %@", location.city);
    NSLog(@"tempz today %f", location.todaysTemperatureF);
    NSLog(@"tempz yesterday %f", location.yesterdaysTemperatureF);
    NSLog(@"is rain? %d", location.isRaining);
    _locationLabel.text = [location.city lowercaseString];
    _temperatureLabel.text = [self formatTemperature:[self findDifferenceBetweenTodaysTemperature:location.todaysTemperatureF andYesterdaysTemperature:location.yesterdaysTemperatureF]];
}

@end
