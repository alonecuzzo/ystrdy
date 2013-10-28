//
//  YSOfflineErrorView.m
//  ystrdy
//
//  Created by Jabari on 10/10/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSOfflineErrorInfoView.h"
#import "UIView+GCLibrary.h"

@implementation YSOfflineErrorInfoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *wifiIconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wifi-icon"]];
        [wifiIconImageView setWidth:wifiIconImageView.width / 2];
        [wifiIconImageView setHeight:wifiIconImageView.height / 2];
        [wifiIconImageView setX:(self.width / 2) - (wifiIconImageView.width / 2)];
        [self.iconView addSubview:wifiIconImageView];
        
        self.titleLabel.text = NSLocalizedString(@"Whoops!", @"no internets title");
        
        self.messageLabel.text = NSLocalizedString(@"You need an internet connection to get the current temperature.  Please connect and try again!", @"no internets error message");
    }
    return self;
}

@end
