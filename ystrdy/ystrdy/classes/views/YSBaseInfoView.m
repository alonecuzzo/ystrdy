//
//  YSBaseInfoView.m
//  ystrdy
//
//  Created by Jabari on 10/10/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSBaseInfoView.h"
#import "UIView+GCLibrary.h"
#import "YSFontHelper.h"
#import "YSColorHelper.h"

@implementation YSBaseInfoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat iconViewHeight = [UIImage imageNamed:@"wifi-icon"].size.height / 2;
        CGFloat iconViewOffset = 75.0f;
        
        _iconView = [[UIView alloc] initWithFrame:CGRectMake(0, (self.height / 2) - (iconViewHeight / 2) - iconViewOffset, self.width, iconViewHeight)];
        [_iconView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_iconView];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _iconView.y + 70.0f, self.width, 50.0f)];
        [_titleLabel setBackgroundColor:[UIColor clearColor]];
        [_titleLabel setFont:[YSFontHelper getFont:YSFontRalewayMedium withSize:YSFontSizeSmall]];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [_titleLabel setTextColor:[YSColorHelper ystrdayWhite]];
        [self addSubview:_titleLabel];
        
        _messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _iconView.y + 90.0f, self.width, 200.0f)];
        [_messageLabel setBackgroundColor:[UIColor clearColor]];
        [_messageLabel setFont:[YSFontHelper getFont:YSFontRalewayExtraLight withSize:YSFontSizeSmall-3]];
        _messageLabel.numberOfLines = 8;
        [_messageLabel setTextColor:[YSColorHelper ystrdayWhite]];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_messageLabel];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
