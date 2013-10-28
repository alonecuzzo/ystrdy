//
//  YSGetStartedButton.m
//  ystrdy
//
//  Created by Jabari on 10/12/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSGetStartedButton.h"
#import "YSColorHelper.h"
#import "YSFontHelper.h"

@implementation YSGetStartedButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[YSColorHelper ystrdayWhite]];
        [self setTitle:@"Get Started!" forState:UIControlStateNormal];
        [self setTitleColor:[YSColorHelper ystrdayBlue] forState:UIControlStateNormal];
        self.titleLabel.font = [YSFontHelper getFont:YSFontRalewayHeavy withSize:YSFontSizeSmall-10];
    }
    return self;
}

@end
