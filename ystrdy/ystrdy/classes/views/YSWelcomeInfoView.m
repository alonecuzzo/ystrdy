//
//  YSWelcomeInfoView.m
//  ystrdy
//
//  Created by Jabari on 10/11/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSWelcomeInfoView.h"
#import "YSInfoScrollView.h"
#import "YSInfoScrollProgressView.h"

@interface YSWelcomeInfoView()

@property(nonatomic, strong) YSInfoScrollView *infoScrollView;
@property(nonatomic, strong) YSInfoScrollProgressView *progressView;

@end

@implementation YSWelcomeInfoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _infoScrollView = [[YSInfoScrollView alloc] initWithFrame:frame];
        _infoScrollView.delegate = self;
        [self addSubview:_infoScrollView];
        
        CGFloat progressViewHeight = 55;
        
        _progressView = [[YSInfoScrollProgressView alloc] initWithFrame:CGRectMake(0, (self.height / 2) - (progressViewHeight / 2) + 210, self.width, progressViewHeight)];
        [self addSubview:_progressView];
        
    }
    return self;
}

#pragma mark - uiscrollviewdelegate stuff

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (_infoScrollView.contentOffset.x == 0) {
        _progressView.circleOne.alpha = 1.0;
        _progressView.circleTwo.alpha = 0.4;
        _progressView.circleThree.alpha = 0.4;
    } else if (_infoScrollView.contentOffset.x == 320) {
        _progressView.circleOne.alpha = 0.4;
        _progressView.circleTwo.alpha = 1.0;
        _progressView.circleThree.alpha = 0.4;
    } else if (_infoScrollView.contentOffset.x == 640) {
       _progressView.circleOne.alpha = 0.4;
        _progressView.circleTwo.alpha = 0.4;
        _progressView.circleThree.alpha = 1.0;
    }
}

@end
