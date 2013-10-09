//
//  YSAnimatingLogo.m
//  ystrdy
//
//  Created by Jabari on 10/8/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSAnimatingLogo.h"
#import "YSFontHelper.h"

@interface YSAnimatingLogo()

@property(strong, nonatomic) UILabel *y1Letter;
@property(strong, nonatomic) UILabel *sLetter;
@property(strong, nonatomic) UILabel *tLetter;
@property(strong, nonatomic) UILabel *rLetter;
@property(strong, nonatomic) UILabel *dLetter;
@property(strong, nonatomic) UILabel *y2Letter;

@end

@implementation YSAnimatingLogo

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _y1Letter = [[UILabel alloc] init];
        _temperatureLabel.font = [YSFontHelper getFont:YSFontRalewayThin withSize:YSFontSizeTemperatureReadingHuge];
        _temperatureLabel.textAlignment = NSTextAlignmentCenter;
        _temperatureLabel.backgroundColor = [UIColor clearColor];
        _temperatureLabel.textColor = [YSColorHelper ystrdayWhite];
        
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
