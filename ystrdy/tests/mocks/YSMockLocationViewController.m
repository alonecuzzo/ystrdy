//
//  YSMockLocationViewController.m
//  ystrdy
//
//  Created by Jabari on 9/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSMockLocationViewController.h"
#import "YSColorHelper.h"

@interface YSMockLocationViewController ()

@end

@implementation YSMockLocationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.objectConfiguration = [[YSObjectConfiguration alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.manager = [self.objectConfiguration locationManager];
    self.manager.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)animateBackgroundWithTemperatureDelta:(CGFloat)tempDelta
{
    if (tempDelta > 0) {
        self.view.backgroundColor = [YSColorHelper ystrdayOrange];
    } else if (tempDelta < 0) {
        self.view.backgroundColor = [YSColorHelper ystrdayBlue];
    } else if (tempDelta == 0) {
        self.view.backgroundColor = [YSColorHelper ystrdayGreen];
    }
}

@end
