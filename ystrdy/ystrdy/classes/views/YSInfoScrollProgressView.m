//
//  YSInfoScrollProgressView.m
//  ystrdy
//
//  Created by Jabari on 10/11/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "YSInfoScrollProgressView.h"

@interface YSInfoScrollProgressView()

@end

@implementation YSInfoScrollProgressView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        UIImage *circleImage = [UIImage imageNamed:@"welcome-progress-circle"];
       
        _circleOne = [[UIImageView alloc] initWithImage:circleImage];
        _circleTwo = [[UIImageView alloc] initWithImage:circleImage];
        _circleThree = [[UIImageView alloc] initWithImage:circleImage];
        
        [self addSubview:_circleOne];
        [self addSubview:_circleTwo];
        [self addSubview:_circleThree];
        
        CGFloat circleXOffsetFromCenter = 25.0f;
        
        [_circleTwo setX:(self.width / 2) - (_circleTwo.width / 2)];
        [_circleOne setX:_circleTwo.x - circleXOffsetFromCenter];
        [_circleThree setX:_circleTwo.x + circleXOffsetFromCenter];
        
        _circleOne.alpha = 0.4f;
    }
    return self;
}

@end
