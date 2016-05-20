//
//  HeightChangerBar.m
//  MultiViewHeightCtroller
//
//  Created by LuChen on 16/5/19.
//  Copyright © 2016年 Bad Chen. All rights reserved.
//

#import "HeightChangerBar.h"

@implementation HeightChangerBar 

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _dragGestureRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
        _dragGestureRecognizer.minimumNumberOfTouches = 1;
        _dragGestureRecognizer.maximumNumberOfTouches = 1;
        [self addGestureRecognizer:_dragGestureRecognizer];
        
        
    }
    return self;
}

- (void)handlePan:(UIPanGestureRecognizer *)recognizer{
    CGPoint translatedPoint = [recognizer translationInView:_superView];
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        _firstY = recognizer.view.center.y;
        if ([_delegate respondsToSelector:@selector(barWillMove:)]) {
            [_delegate barWillMove:self];
        }
    }
    
    if (recognizer.state == UIGestureRecognizerStateChanged) {
        CGFloat y = _firstY + translatedPoint.y;
        if (y < recognizer.view.frame.size.height / 2.0) {
            y = recognizer.view.frame.size.height / 2.0;
        } else if (y + recognizer.view.frame.size.height / 2.0 > _superView.frame.size.height) {
            y = _superView.frame.size.height - recognizer.view.frame.size.height / 2.0;
        }

        if ([_delegate respondsToSelector:@selector(heightChangerBar:translatedPointOfY:)]) {
            BOOL isOutOfFrame = [_delegate heightChangerBar:self translatedPointOfY:translatedPoint.y];
            if (!isOutOfFrame) {
                recognizer.view.center = CGPointMake(self.center.x, y);
            }
            
        }else{
            recognizer.view.center = CGPointMake(self.center.x, y);
        }
    }
    
}


@end
