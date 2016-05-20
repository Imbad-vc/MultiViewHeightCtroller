//
//  ViewController.m
//  MultiViewHeightCtroller
//
//  Created by LuChen on 16/5/20.
//  Copyright © 2016年 Bad Chen. All rights reserved.
//

#import "ViewController.h"
#import "MultiViewHeightCtroller.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MultiViewHeightCtroller *ctroller = [[MultiViewHeightCtroller alloc]initWithFrame:CGRectMake(0, 50, 320,500)];
    UIView *firstView = [[UIView alloc]init];
    UIView *secondView = [[UIView alloc]init];
    UIView *san = [[UIView alloc]init];
    san.backgroundColor = [UIColor greenColor];
    firstView.backgroundColor = [UIColor yellowColor];
    secondView.backgroundColor = [UIColor blueColor];
    ctroller.subViews = @[firstView,secondView,san].mutableCopy;
    [self.view addSubview:ctroller];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
