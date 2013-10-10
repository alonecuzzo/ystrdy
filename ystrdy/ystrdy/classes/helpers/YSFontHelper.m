//
//  YSFontHelper.m
//  ystrdy
//
//  Created by Jabari on 9/12/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSFontHelper.h"

@implementation YSFontHelper

+ (NSString*)getFontString:(YSFont)font
{
    NSString *fontName;
    
    switch (font) {
        case YSFontRalewayThin:
            fontName = @"Raleway-Thin";
            break;
            
        case YSFontRalewayExtraLight:
            fontName = @"Raleway-ExtraLight";
            break;
            
        case YSFontRalewayMedium:
            fontName = @"Raleway-Medium";
            break;
    }
    
    return fontName;
}

+ (UIFont*)getFont:(YSFont)font withSize:(YSFontSize)size
{
    return [UIFont fontWithName:[self getFontString:font] size:size];
}

@end
