//
//  MultiViewHeightCtroller.m
//  MultiViewHeihtCtroller
//
//  Created by LuChen on 16/5/17.
//  Copyright © 2016年 Bad Chen. All rights reserved.
//

#import "MultiViewHeightCtroller.h"



@implementation MultiViewHeightCtroller

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

- (void)setSubViews:(NSMutableArray<__kindof UIView *> *)subViews{
    _subViews = subViews;
    
    self.backgroundColor = [UIColor blackColor];
    float ctrollerHeight = 30.f;
    for (int i = 0; i <_subViews.count; i++) {
        UIView *view = _subViews[i];
        CGRect frame;
        frame.size.width = self.frame.size.width;
        frame.size.height = (float)(self.frame.size.height - (ctrollerHeight *(_subViews.count-1)))/_subViews.count;
        frame.origin.x = 0;
        frame.origin.y = (frame.size.height+ctrollerHeight)*i;
        view.frame = frame;
        view.tag = i+1;
        [self addSubview:view];

        
        if (![view isEqual:[_subViews lastObject]]) {
            _ctrollerView = [[HeightChangerBar alloc]initWithFrame:CGRectMake(0, view.frame.origin.y+view.frame.size.height, 320, ctrollerHeight)];
            _ctrollerView.superView = self;
            _ctrollerView.delegate = self;
            _ctrollerView.tag = i+10;
            _ctrollerView.backgroundColor = [UIColor redColor];
            
            [self addSubview:_ctrollerView];
        }
    }
}

- (void)barWillMove:(HeightChangerBar *)heightChangerBar{
    NSInteger viewTag = heightChangerBar.tag-9;
    UIView *firstView = [self viewWithTag:viewTag];
    UIView *secondView = [self viewWithTag:viewTag+1];
    _firstViewHeight = firstView.frame.size.height;
    _secondViewHeight = secondView.frame.size.height;
    _secondViewY = secondView.frame.origin.y;

}

- (BOOL)heightChangerBar:(HeightChangerBar *)heightChangerBar translatedPointOfY:(CGFloat)y{
    NSInteger viewTag = heightChangerBar.tag-9;
    UIView *firstView = [self viewWithTag:viewTag];
    UIView *secondView = [self viewWithTag:viewTag+1];
    
    
    if (y > 0) {
        if (y >= _secondViewHeight) {
            CGRect firstFrame = firstView.frame;
            firstFrame.size.height = _firstViewHeight + _secondViewHeight;
            CGRect secondFrame = secondView.frame;
            secondFrame.size.height = 0;
            secondFrame.origin.y = _secondViewY +_secondViewHeight;
            CGRect barFrame = heightChangerBar.frame;
            barFrame.origin.y = firstFrame.origin.y+firstFrame.size.height;
            [UIView animateWithDuration:0.2 animations:^{
                firstView.frame = firstFrame;
                secondView.frame = secondFrame;
                heightChangerBar.frame = barFrame;
            }];
            return YES;
        }else{
            CGRect firstFrame = firstView.frame;
            firstFrame.size.height = _firstViewHeight + y;
            firstView.frame = firstFrame;
            CGRect secondFrame = secondView.frame;
            secondFrame.size.height = _secondViewHeight - y;
            secondFrame.origin.y = _secondViewY + y;
            secondView.frame = secondFrame;
        }
    }else if (y < 0){
        if (ABS(y) >= _firstViewHeight) {
            CGRect firstFrame = firstView.frame;
            firstFrame.size.height = 0;
            CGRect secondFrame = secondView.frame;
            secondFrame.size.height = _firstViewHeight+_secondViewHeight;
            secondFrame.origin.y = _secondViewY -_firstViewHeight;
            CGRect barFrame = heightChangerBar.frame;
            barFrame.origin.y = firstFrame.origin.y;
            [UIView animateWithDuration:0.2 animations:^{
                firstView.frame = firstFrame;
                secondView.frame = secondFrame;
                heightChangerBar.frame = barFrame;
            }];
            return YES;
        }else{
            CGRect firstFrame = firstView.frame;
            firstFrame.size.height = _firstViewHeight - ABS(y);
            firstView.frame = firstFrame;
            CGRect secondFrame = secondView.frame;
            secondFrame.size.height = _secondViewHeight + ABS(y);
            secondFrame.origin.y = _secondViewY - ABS(y);
            secondView.frame = secondFrame;
            
        }
    }

    
    return NO;
}


@end
