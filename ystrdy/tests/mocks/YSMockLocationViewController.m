//
//  YSMockLocationViewController.m
//  ystrdy
//
//  Created by Jabari on 9/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSMockLocationViewController.h"

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
