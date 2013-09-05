//
//  YSLocationViewController.m
//  ystrdy
//
//  Created by Jabari on 8/30/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSLocationViewController.h"

@interface YSLocationViewController ()

@property(strong, nonatomic) UILabel *temperatureLabel;
@property(strong, nonatomic) UILabel *locationLabel;
@property(strong, nonatomic) UILabel *umbrellaLabel;

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
    _temperatureLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, 100.0f)];
    _temperatureLabel.text = [NSString stringWithFormat:@"%@ %@ %@", NSLocalizedString(@"Today will be ", @""), [self temperatureDifference], NSLocalizedString(@"degrees hotter than yesterday", @"")];
    _temperatureLabel.backgroundColor = [UIColor clearColor];
    _temperatureLabel.numberOfLines = 2;
    [self.view addSubview:_temperatureLabel];
}

- (void)populateLocation
{
    _locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 105.0f, self.view.frame.size.width, 100)];
    _locationLabel.text = [NSString stringWithFormat:@"Location: %@", _location.city];
    _locationLabel.backgroundColor = [UIColor clearColor];
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
    // Do any additional setup after loading the view from its nib.
    [self setupLocation];
    [self populateTemperature];
    [self populateLocation];
    [self populateUmbrella];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
