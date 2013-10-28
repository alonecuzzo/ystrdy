//
//  YSWelcomeScreenTwoInfoView.m
//  ystrdy
//
//  Created by Jabari on 10/12/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSWelcomeScreenTwoInfoView.h"

@implementation YSWelcomeScreenTwoInfoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *wifiIconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"welcome-screen-two-thermometers"]];
        [wifiIconImageView setX:(self.width / 2) - (wifiIconImageView.width / 2)];
        [self.iconView addSubview:wifiIconImageView];
        
        self.titleLabel.text = NSLocalizedString(@"How Does it Feel Today Versus Yesterday?", @"welcome screen one title");
        self.titleLabel.numberOfLines = 2;
        self.titleLabel.height = 100.0f;
        [self.titleLabel setY:self.titleLabel.y - 10.0f];
        
        self.messageLabel.text = NSLocalizedString(@"YCurabitur a facilisis neque. Sed viverra dolor non metus mattis venenatis. Mauris eget orci egestas nibh auctor varius a velarcu.", @"no internets error message");
        [self.messageLabel setY:self.titleLabel.y + self.titleLabel.height - 45];
    }
    return self;
}

@end