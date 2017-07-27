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

@property (strong, nonatomic) IBOutlet UITextField *textField1;
@property (strong, nonatomic) IBOutlet UITextField *textField2;
@property (strong, nonatomic) IBOutlet UIButton *btn;

@end


@implementation ViewController


-(void)viewDidLoad {
    [super viewDidLoad];
    self.stoneView = [[StoneView alloc]initWithFrame:UIScreen.mainScreen.bounds andPageIndex:1];
    [self.view addSubview:_stoneView];
    [self.view bringSubviewToFront:_textField1];
    [self.view bringSubviewToFront:_textField2];
    [self.view bringSubviewToFront:_btn];
}

- (IBAction)submit:(UIButton *)sender {
    [_stoneView changeButton:[_textField1.text integerValue] andName:_textField2.text];
}

@end
