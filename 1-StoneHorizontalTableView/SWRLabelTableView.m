//
//  SWRLabelTableView.m
//  StoneNHorizontalTableView
//
//  Created by StoneNan on 2017/8/5.
//  Copyright © 2017年 StoneNan. All rights reserved.
//

#import "SWRLabelTableView.h"
#import "STNHorizontalTableView.h"

@interface SWRLabelTableView () <UIScrollViewDelegate>

@property(nonatomic,strong)STNHorizontalTableView *horizontalTableView;
@property(nonatomic,strong)UILabel *lable1;
@property(nonatomic,strong)UILabel *lable2;

@property(nonatomic,assign)CGFloat labelWidth;
@property(nonatomic,assign)CGFloat labelHeight;

@property(nonatomic,assign)NSInteger startIndex; //显示的第一个数据在data数组中的下标

@end



@implementation SWRLabelTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = true;
        
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height;
        
        self.labelWidth = (width + STNHorizontalTableView_labelNumber) / (STNHorizontalTableView_labelNumber + 1);
        self.labelHeight = height / 2;
        
        self.lable1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, _labelWidth, _labelHeight)];
        self.lable2 = [[UILabel alloc]initWithFrame:CGRectMake(0, _labelHeight, _labelWidth, _labelHeight)];
        _lable1.layer.borderColor = [[UIColor blackColor]CGColor];
        _lable2.layer.borderColor = [[UIColor blackColor]CGColor];
        _lable1.layer.borderWidth = 1.0;
        _lable2.layer.borderWidth = 1.0;
        _lable1.backgroundColor = [UIColor grayColor];
        _lable2.backgroundColor = [UIColor grayColor];
        _lable1.tag = 1111;
        _lable2.tag = 2222;
        _lable1.adjustsFontSizeToFitWidth = true;
        _lable2.adjustsFontSizeToFitWidth = true;
        _lable1.textAlignment = NSTextAlignmentCenter;
        _lable2.textAlignment = NSTextAlignmentCenter;
        
        
        self.horizontalTableView = [[STNHorizontalTableView alloc]initWithFrame:CGRectMake(_labelWidth, 0, width - _labelWidth, height)];
        _horizontalTableView.delegate = self;
        _horizontalTableView.backgroundColor = UIColor.whiteColor;
        _horizontalTableView.bounces = false;

        [self addSubview:_lable1];
        [self addSubview:_lable2];
        [self addSubview:_horizontalTableView];
        
        self.endIndex = -1;
        
        NSLog(@"%li",(long)_endIndex);
    }
    return self;
}

// MARK: Setter:
-(void)setStartIndex:(NSInteger)startIndex
{
    _startIndex = startIndex;
    if (_startIndex >= (NSInteger)_data.count - (STNHorizontalTableView_labelNumber * 3) - 1) {
        _endIndex = (NSInteger)_data.count - 1;
    } else {
        _endIndex = _startIndex + (STNHorizontalTableView_labelNumber * 3);
    }
}

-(void)setEndIndex:(NSInteger)endIndex
{
    
    NSLog(@"Set EndIndex=%li",(long)endIndex);
    if (endIndex >= (NSInteger)_data.count) {
        _endIndex = (NSInteger)_data.count - 1;
        NSLog(@"come in here and _endIndex==%li",(long)_endIndex);
    } else {
        _endIndex = endIndex;
    }
    if (_endIndex == -1) {
        _startIndex = -1;
    } else if (_endIndex >= 0 && _endIndex < STNHorizontalTableView_labelNumber * 3) {
        _startIndex = 0;
    } else if (_endIndex >= STNHorizontalTableView_labelNumber * 3) {
        _startIndex = _endIndex - (STNHorizontalTableView_labelNumber * 3) + 1;
    }
    [self updateLabelViews];
}

-(void)setNumberLabelText:(NSString *)numberLabelText
{
    _numberLabelText = numberLabelText;
    UILabel *numberLable = (UILabel *)[self viewWithTag:1111];
    UILabel *valueLable = (UILabel *)[self viewWithTag:2222];
    numberLable.text = _numberLabelText;
    valueLable.text = _valueLabelText;
}

-(void)setValueLabelText:(NSString *)valueLabelText
{
    _valueLabelText = valueLabelText;
    UILabel *numberLable = (UILabel *)[self viewWithTag:1111];
    UILabel *valueLable = (UILabel *)[self viewWithTag:2222];
    numberLable.text = _numberLabelText;
    valueLable.text = _valueLabelText;
}


-(void)updateLabelViews
{
    
    NSInteger index = _endIndex;
    NSLog(@"index===%li",(long)index);
    if (index < 0) {
        NSLog(@"hhhhhhhhhh_1");
        for (NSInteger i = 0; i < STNHorizontalTableView_labelNumber * 3; ++i) {
            UILabel *label1 = (UILabel *)[_horizontalTableView viewWithTag:i + 1];
            label1.text = @"";
            UILabel *label2 = (UILabel *)[_horizontalTableView viewWithTag:i + 100];
            label2.text = @"";
        }
        CGPoint offset = CGPointMake(0, 0);
        [_horizontalTableView setContentOffset: offset animated: YES];
    } else if (index < STNHorizontalTableView_labelNumber * 3) {
        NSLog(@"hhhhhhhhhh_2");
        for (NSInteger i = 0; i <= index; ++i) {
            UILabel *label1 = (UILabel *)[_horizontalTableView viewWithTag:i + 1];
            label1.text = _data[i];
            UILabel *label2 = (UILabel *)[_horizontalTableView viewWithTag:i + 100];
            label2.text = _data[i];
        }
        for (NSInteger i = index + 1; i < STNHorizontalTableView_labelNumber * 3; ++i) {
            UILabel *label1 = (UILabel *)[_horizontalTableView viewWithTag:i + 1];
            label1.text = @"";
            UILabel *label2 = (UILabel *)[_horizontalTableView viewWithTag:i + 100];
            label2.text = @"";
        }
        if (index >= STNHorizontalTableView_labelNumber) {
            CGPoint offset = CGPointMake((_labelWidth-1) * (index - STNHorizontalTableView_labelNumber + 1), 0);
            [_horizontalTableView setContentOffset: offset animated: YES];
        } else {
            CGPoint offset = CGPointMake(0, 0);
            [_horizontalTableView setContentOffset: offset animated: YES];
        }
    } else {
        NSLog(@"hhhhhhhhhh_3");
        for (NSInteger i = STNHorizontalTableView_labelNumber * 3; i > 0; --i) {
            UILabel *label1 = (UILabel *)[_horizontalTableView viewWithTag:i];
            label1.text = _data[index];
            UILabel *label2 = (UILabel *)[_horizontalTableView viewWithTag:i + 99];
            label2.text = _data[index];
            index--;
        }
        CGPoint offset = CGPointMake(_horizontalTableView.contentSize.width - _horizontalTableView.frame.size.width, 0);
        [_horizontalTableView setContentOffset: offset animated: YES];
    }
}

-(void)updateAfterScroll
{
    for (NSInteger i = 0; i < STNHorizontalTableView_labelNumber * 3; ++i) {
        UILabel *label1 = (UILabel *)[_horizontalTableView viewWithTag:i + 1];
        UILabel *label2 = (UILabel *)[_horizontalTableView viewWithTag:i + 100];
        if (_startIndex + i <= _endIndex && _startIndex != -1) {
            label1.text = _data[_startIndex + i];
            label2.text = _data[_startIndex + i];
        } else {
            label1.text = @"";
            label2.text = @"";
        }
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat x = scrollView.contentOffset.x;
    
    if (x == 0) {
        if (_startIndex >= STNHorizontalTableView_labelNumber) {
            self.startIndex = _startIndex - STNHorizontalTableView_labelNumber;
            scrollView.contentOffset = CGPointMake(scrollView.frame.size.width, 0);
        } else if (_startIndex > 0){
            self.startIndex = 0;
            scrollView.contentOffset = CGPointMake(0, 0);
        }
        [self updateAfterScroll];
    }
    
    if ((NSInteger)x == (NSInteger)(scrollView.contentSize.width - scrollView.frame.size.width)) {
        if (_endIndex <= (NSInteger)_data.count - STNHorizontalTableView_labelNumber - 1) {
            self.endIndex = _endIndex + STNHorizontalTableView_labelNumber;
            scrollView.contentOffset = CGPointMake(scrollView.frame.size.width, 0);
        } else {
            self.endIndex = (NSInteger)_data.count - 1;
            scrollView.contentOffset = CGPointMake(scrollView.contentSize.width - scrollView.frame.size.width, 0);
        }
        [self updateAfterScroll];
    }
    
}

@end

