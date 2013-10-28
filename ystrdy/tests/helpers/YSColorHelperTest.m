//
//  YSColorHelperTest.m
//  ystrdy
//
//  Created by Jabari on 9/11/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSColorHelperTest.h"
#import "YSColorHelper.h"

@implementation YSColorHelperTest

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (NSString *)getHexStringForColor:(UIColor *)color
{
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    NSString *hexString=[NSString stringWithFormat:@"%02X%02X%02X", (int)(r * 255), (int)(g * 255), (int)(b * 255)];
    return hexString;
}

#pragma mark - tessts

- (void)testThatYSTRDYBlueHasExpectedColor
{
    GHAssertEqualStrings([self getHexStringForColor:[YSColorHelper ystrdayBlue]], @"5E98AF", @"ystrdyBlue should be equal to expected hex color");
}

- (void)testThatYSTRDYWhiteHasExpectedColor
{
    GHAssertEqualStrings([self getHexStringForColor:[YSColorHelper ystrdayWhite]], @"F8FBFC", @"ystrdyWhite should be equal to expected hex color");
}

- (void)testThatYSTRDYOrangeHasExpectedColor
{
    GHAssertEqualStrings([self getHexStringForColor:[YSColorHelper ystrdayOrange]], @"F47167", @"ystrdyOrange should be equal to expected hex color");
}

@end
