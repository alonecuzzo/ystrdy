//
//  YSWelcomeScreenThree.m
//  ystrdy
//
//  Created by Jabari on 10/12/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSWelcomeScreenThreeInfoView.h"
#import "YSGetStartedButton.h"

@implementation YSWelcomeScreenThreeInfoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *wifiIconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"globe-icon"]];
        [wifiIconImageView setX:(self.width / 2) - (wifiIconImageView.width / 2)];
        [self.iconView addSubview:wifiIconImageView];
        
        self.titleLabel.text = NSLocalizedString(@"Tap to Refresh", @"welcome screen three title");
        self.titleLabel.numberOfLines = 2;
        self.titleLabel.height = 100.0f;
        [self.titleLabel setY:self.titleLabel.y - 20.0f];
        
        self.messageLabel.text = NSLocalizedString(@"YCurabitur a facilisis neque. Blah Blah Blah something else?", @"no internets error message");
        [self.messageLabel setY:self.titleLabel.y + 15];
        
        YSGetStartedButton *getStartedButton = [[YSGetStartedButton alloc] initWithFrame:CGRectMake(60, self.messageLabel.y + self.messageLabel.height - 10, self.width - 120, 55)];
        [getStartedButton addTarget:self action:@selector(getStarted) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:getStartedButton];
    }
    return self;
}

//[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onWelcomeScreenClose:) name:@"WELCOME_SCREEN_CLOSED" object:nil];
- (void)getStarted
{
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"WELCOME_SCREEN_CLOSED" object:nil]];
}

@end