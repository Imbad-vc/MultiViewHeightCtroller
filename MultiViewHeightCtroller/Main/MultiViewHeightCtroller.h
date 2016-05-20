//
//  MultiViewHeightCtroller.h
//  MultiViewHeihtCtroller
//
//  Created by LuChen on 16/5/17.
//  Copyright © 2016年 Bad Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeightChangerBar.h"

@interface MultiViewHeightCtroller : UIView <HeightChangerDelegate >
{
    HeightChangerBar *_ctrollerView;
    CGFloat _firstViewHeight;
    CGFloat _secondViewHeight;
    CGFloat _secondViewY;
}

@property (nonatomic,copy)NSMutableArray<__kindof UIView *> *subViews;



@end
