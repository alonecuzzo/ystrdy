//
//  YSAnimatingLetter.m
//  ystrdy
//
//  Created by Jabari on 10/8/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSAnimatingLetter.h"
#import "YSFontHelper.h"
#import "YSColorHelper.h"

@interface YSAnimatingLetter()

@property(strong, nonatomic) UILabel *letterLabel;

@end

@implementation YSAnimatingLetter

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _letterLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
        _letterLabel.font = [YSFontHelper getFont:YSFontRalewayThin withSize:YSfontSizeLogoLarge];
        _letterLabel.textAlignment = NSTextAlignmentCenter;
        _letterLabel.backgroundColor = [UIColor clearColor];
        _letterLabel.textColor = [YSColorHelper ystrdayWhite];
        _letterLabel.text = @"?";
        [self addSubview:_letterLabel];
    }
    return self;
}

- (void)setLetter:(NSString *)letter
{
    _letterLabel.text = letter;
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
