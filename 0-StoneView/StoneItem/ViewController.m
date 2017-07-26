//
//  ViewController.m
//  StoneItem
//
//  Created by StoneNan on 2017/7/5.
//  Copyright © 2017年 StoneNan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong)StoneView *stoneView;

@end


@implementation ViewController


-(void)viewDidLoad {
    [super viewDidLoad];
    self.stoneView = [[StoneView alloc]initWithFrame:UIScreen.mainScreen.bounds andPageIndex:1];
    [self.view addSubview:_stoneView];
}

@end
