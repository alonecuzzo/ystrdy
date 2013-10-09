//
//  YSFontHelper.h
//  ystrdy
//
//  Created by Jabari on 9/12/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>

enum {
    YSFontRalewayThin,
    YSFontRalewayExtraLight
};
typedef NSInteger YSFont;

enum {
    YSFontSizeSmall                  = 12,
    YSFontSizeCityNameLarge          = 40,
    YSFontSizeTemperatureReadingHuge = 220
};
typedef NSInteger YSFontSize;

@interface YSFontHelper : NSObject

+ (UIFont*)getFont:(YSFont)font withSize:(YSFontSize)size;
+ (NSString*)getFontString:(YSFont)font;

@end
