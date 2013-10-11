//
//  YSInfoScrollView.m
//  ystrdy
//
//  Created by Jabari on 10/10/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSInfoScrollView.h"
#import "YSOfflineErrorInfoView.h"

@implementation YSInfoScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        YSOfflineErrorInfoView *offlineViewOne = [[YSOfflineErrorInfoView alloc] initWithFrame:self.frame];
        YSOfflineErrorInfoView *offlineViewTwo = [[YSOfflineErrorInfoView alloc] initWithFrame:self.frame];
        YSOfflineErrorInfoView *offlineViewThree = [[YSOfflineErrorInfoView alloc] initWithFrame:self.frame];
       
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
