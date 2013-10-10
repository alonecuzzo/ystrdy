//
//  YSOfflineErrorView.m
//  ystrdy
//
//  Created by Jabari on 10/10/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSOfflineErrorView.h"
#import "UIView+GCLibrary.h"
#import "YSFontHelper.h"
#import "YSColorHelper.h"

@interface YSOfflineErrorView()

@property(nonatomic, strong) UIImageView *wifiIcon;
@property(nonatomic, strong) UILabel *messageLabel;
@property(nonatomic, strong) UILabel *titleLabel;

@end

@implementation YSOfflineErrorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _wifiIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wifi-icon"]];
        [_wifiIcon setWidth:[UIImage imageNamed:@"wifi-icon"].size.width / 2];
        [_wifiIcon setHeight:[UIImage imageNamed:@"wifi-icon"].size.height / 2];
        [_wifiIcon setX:(self.width / 2) - (_wifiIcon.width / 2)];
        [_wifiIcon setY:(self.height / 2) - (_wifiIcon.height / 2) - 75.0f];
        [self addSubview:_wifiIcon];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _wifiIcon.y + 70.0f, self.width, 50.0f)];
        [_titleLabel setBackgroundColor:[UIColor clearColor]];
        [_titleLabel setFont:[YSFontHelper getFont:YSFontRalewayMedium withSize:YSFontSizeSmall]];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [_titleLabel setTextColor:[YSColorHelper ystrdayWhite]];
        _titleLabel.text = NSLocalizedString(@"Whoops!", @"no internets title");
        [self addSubview:_titleLabel];
        
        _messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _wifiIcon.y + 90.0f, self.width, 200.0f)];
        [_messageLabel setBackgroundColor:[UIColor clearColor]];
        [_messageLabel setFont:[YSFontHelper getFont:YSFontRalewayExtraLight withSize:YSFontSizeSmall-3]];
        _messageLabel.numberOfLines = 8;
        [_messageLabel setTextColor:[YSColorHelper ystrdayWhite]];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.text = NSLocalizedString(@"You need an internet connection to get the current temperature.  Please connect and try again!", @"no internets error message");
        [self addSubview:_messageLabel];
    }
    return self;
}

@end
