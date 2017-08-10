//
//  ViewController.m
//  StoneNHorizontalTableView
//
//  Created by StoneNan on 2017/8/1.
//  Copyright © 2017年 StoneNan. All rights reserved.
//

#import "ViewController.h"
#import "SWRLabelTableView.h"

@interface ViewController () 

@property(nonatomic,strong)SWRLabelTableView *labelTableView;
@property (strong, nonatomic) IBOutlet UIStepper *stepper;
@property(nonatomic,strong)NSTimer *timer;
@property (strong, nonatomic) IBOutlet UISwitch *mySwitch;


@end

@implementation ViewController
{
    NSMutableArray *data;
    NSInteger x;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.labelTableView = [[SWRLabelTableView alloc]initWithFrame:CGRectMake(0,100,UIScreen.mainScreen.bounds.size.width,200)];
    
    
    
    data = [[NSMutableArray alloc]init];
    x = 1;
    _labelTableView.data = data;
    _labelTableView.numberLabelText = @"序号";
    _labelTableView.valueLabelText = @"值";
    _mySwitch.on = false;
    
    
    
    [self.view addSubview:_labelTableView];
    
}

- (IBAction)stepperValueChanged:(UIStepper *)sender {
    NSLog(@"value here is:   %f",sender.value - 1);
    [data addObject:[NSString stringWithFormat:@"%li",(long)x]];
    ++x;
    if (sender.value == 0) {
        _labelTableView.endIndex = -1;
    } else {
        _labelTableView.endIndex = (sender.value - 1);
    }
}

-(void)addData
{
    [data addObject:[NSString stringWithFormat:@"%li",(long)x]];
    ++x;
}

- (IBAction)switchValueChanged:(UISwitch *)sender
{
    if (sender.on) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval: 0.01 target: self selector: @selector(addData) userInfo: nil repeats: YES];
    } else {
        [_timer invalidate];
    }
}

@end
