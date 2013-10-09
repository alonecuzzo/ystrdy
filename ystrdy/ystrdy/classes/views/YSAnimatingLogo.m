//
//  YSAnimatingLogo.m
//  ystrdy
//
//  Created by Jabari on 10/8/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSAnimatingLogo.h"
#import "YSAnimatingLetter.h"
#import "YSFontHelper.h"
#import "UIView+GCLibrary.h"

@interface YSAnimatingLogo()

@property(strong, nonatomic) YSAnimatingLetter *y1Letter;
@property(strong, nonatomic) YSAnimatingLetter *sLetter;
@property(strong, nonatomic) YSAnimatingLetter *tLetter;
@property(strong, nonatomic) YSAnimatingLetter *rLetter;
@property(strong, nonatomic) YSAnimatingLetter *dLetter;
@property(strong, nonatomic) YSAnimatingLetter *y2Letter;

@end

@implementation YSAnimatingLogo {
}

CGFloat topMargin     = 413.0f;
CGFloat charDimension = 170.0f;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _y1Letter = [[YSAnimatingLetter alloc] init];
        _y1Letter.letter = @"y";
        [self addSubview:_y1Letter];
        _sLetter = [[YSAnimatingLetter alloc] init];
        _sLetter.letter = @"s";
        [self addSubview:_sLetter];
        _tLetter = [[YSAnimatingLetter alloc] init];
        _tLetter.letter = @"t";
        [self addSubview:_tLetter];
        _rLetter = [[YSAnimatingLetter alloc] init];
        _rLetter.letter = @"r";
        [self addSubview:_rLetter];
        _dLetter = [[YSAnimatingLetter alloc] init];
        _dLetter.letter = @"d";
        [self addSubview:_dLetter];
        _y2Letter = [[YSAnimatingLetter alloc] init];
        _y2Letter.letter = @"y";
        [self addSubview:_y2Letter];
        
        [_y1Letter setFrame:CGRectMake(7.0f, topMargin, charDimension, charDimension)];
        [_sLetter setFrame:CGRectMake(44.0f, topMargin, charDimension, charDimension)];
        [_tLetter setFrame:CGRectMake(73.0f, topMargin, charDimension, charDimension)];
        [_rLetter setFrame:CGRectMake(96.0f, topMargin, charDimension, charDimension)];
        [_dLetter setFrame:CGRectMake(128.0f, topMargin, charDimension, charDimension)];
        [_y2Letter setFrame:CGRectMake(170.0f, topMargin, charDimension, charDimension)];
    }
    return self;
}

- (void)animateLetters
{
    // had to set this arbitrary delay when the app starts up... only way i can get it to work when phone is unplugged
    [UIView animateWithDuration:1.0f delay:0.8f options:UIViewAnimationOptionAllowAnimatedContent animations:^{
        [_y1Letter setY:680];
        [_sLetter setY:720];
        [_tLetter setY:600];
        [_rLetter setY:680];
        [_dLetter setY:650];
        [_y2Letter setY:600];
    }completion:^(BOOL completed){
        
    }];
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
