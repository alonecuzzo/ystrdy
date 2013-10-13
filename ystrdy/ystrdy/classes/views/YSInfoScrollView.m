//
//  YSInfoScrollView.m
//  ystrdy
//
//  Created by Jabari on 10/10/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSInfoScrollView.h"
#import "YSWelcomeScreenOneInfoView.h"
#import "YSWelcomeScreenTwoInfoView.h"
#import "YSWelcomeScreenThreeInfoView.h"

@implementation YSInfoScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        YSWelcomeScreenOneInfoView *offlineViewOne = [[YSWelcomeScreenOneInfoView alloc] initWithFrame:self.frame];
        YSWelcomeScreenTwoInfoView *offlineViewTwo = [[YSWelcomeScreenTwoInfoView alloc] initWithFrame:self.frame];
        YSWelcomeScreenThreeInfoView *offlineViewThree = [[YSWelcomeScreenThreeInfoView alloc] initWithFrame:self.frame];
       
        [offlineViewTwo setX:self.width];
        [offlineViewThree setX:offlineViewTwo.x + offlineViewTwo.width];
        
        [self addSubview:offlineViewOne];
        [self addSubview:offlineViewTwo];
        [self addSubview:offlineViewThree];
        
        [self setContentSize:CGSizeMake(offlineViewThree.width*3, 0)];
        [self setScrollEnabled:YES];
        [self setPagingEnabled:YES];
        [self setShowsHorizontalScrollIndicator:NO];
    }
    return self;
}

@end
