//
//  YSRefreshButton.m
//  ystrdy
//
//  Created by Jabari on 10/10/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSRefreshButton.h"
#import "YSColorHelper.h"

@implementation YSRefreshButton

- (id)initWithBackgroundColor:(UIColor*)color
{
    CGRect buttonFrame = CGRectMake(0, 0, [UIImage imageNamed:@"refresh-button-blue"].size.width / 2, [UIImage imageNamed:@"refresh-button-blue"].size.height / 2);
    self = [super initWithFrame:buttonFrame];
    if (self) {
       
        if ([color isEqual:[YSColorHelper ystrdayBlue]]) {
            [self setBackgroundImage:[UIImage imageNamed:@"refresh-button-blue"] forState:UIControlStateNormal];
        } else if([color isEqual:[YSColorHelper ystrdayOrange]]) {
            [self setBackgroundImage:[UIImage imageNamed:@"refresh-button-orange"] forState:UIControlStateNormal];
        } else if([color isEqual:[YSColorHelper ystrdayGreen]]) {
            [self setBackgroundImage:[UIImage imageNamed:@"refresh-button-green"] forState:UIControlStateNormal];
        }
    }
    return self;
}

@end