//
//  HeightChangerBar.h
//  MultiViewHeightCtroller
//
//  Created by LuChen on 16/5/19.
//  Copyright © 2016年 Bad Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HeightChangerBar;
@protocol HeightChangerDelegate <NSObject>

@required
- (BOOL)heightChangerBar:(HeightChangerBar *)heightChangerBar translatedPointOfY:(CGFloat)y;
- (void)barWillMove:(HeightChangerBar *)heightChangerBar;

@end

@interface HeightChangerBar : UIView
{
    UIPanGestureRecognizer *_dragGestureRecognizer;
    CGFloat _firstY;
}

@property (nonatomic,strong)UIView *superView;
@property (nonatomic, assign) id <HeightChangerDelegate> delegate;

@end

