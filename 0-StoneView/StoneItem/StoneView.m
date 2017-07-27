//
//  StoneView.m
//  StoneItem
//
//  Created by StoneNan on 2017/7/6.
//  Copyright © 2017年 StoneNan. All rights reserved.
//

#import "StoneView.h"

@interface StoneView ()

@property(nonatomic,strong)UIImageView *backgroundImageView;
@property(nonatomic,strong)UIButton *button1;
@property(nonatomic,strong)UIButton *button2;
@property(nonatomic,strong)UIButton *button3;
@property(nonatomic,strong)UILabel *lable1; //方案1
@property(nonatomic,strong)UILabel *lable2; //方案2
@property(nonatomic,strong)UILabel *textLable;
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)SliderGalleryView *sliderGallery;

@property(nonatomic,assign)NSInteger pageIndex;

@property(nonatomic,weak)id<StoneViewDelegate> delegate;

@end


@implementation StoneView

-(instancetype)initWithFrame:(CGRect)frame andPageIndex:(NSInteger)pageIndex
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = true;
        self.pageIndex = pageIndex;
        [self configureElement];
    }
    return self;
}

-(void)clickButton:(UIButton *)btn
{
    if (_delegate && [_delegate respondsToSelector:@selector(buttonEvent:)]) {
        [_delegate buttonEvent:btn.tag];
    }
}

-(void)configureElement
{
    self.button1 = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - 300, 123, 120, 90)];
    self.button2 = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - 60, 123, 120, 90)];
    self.button3 = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 2 + 180, 123, 120, 90)];
    
    self.button1.tag = 1;
    self.button2.tag = 2;
    self.button3.tag = 3;
    _button1.enabled = false;
    _button2.enabled = false;
    _button3.enabled = false;
    [_button1 setBackgroundImage:[UIImage imageNamed:@"StoneButton"] forState:UIControlStateNormal];
    [_button2 setBackgroundImage:[UIImage imageNamed:@"StoneButton"] forState:UIControlStateNormal];
    [_button3 setBackgroundImage:[UIImage imageNamed:@"StoneButton"] forState:UIControlStateNormal];
    [_button1 setTitle:@"传感器1" forState:UIControlStateDisabled];
    [_button2 setTitle:@"传感器2" forState:UIControlStateDisabled];
    [_button3 setTitle:@"传感器3" forState:UIControlStateDisabled];
    [_button1 setTintColor:UIColor.whiteColor];
    [_button2 setTintColor:UIColor.whiteColor];
    [_button3 setTintColor:UIColor.whiteColor];
    _button1.titleLabel.font = [UIFont systemFontOfSize:22.0];
    _button2.titleLabel.font = [UIFont systemFontOfSize:22.0];
    _button3.titleLabel.font = [UIFont systemFontOfSize:22.0];
    [_button1 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [_button2 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [_button3 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    if (_pageIndex == 1) {
        self.backgroundImageView = [[UIImageView alloc]initWithFrame:self.frame];
        _backgroundImageView.image = [UIImage imageNamed:@"StoneBackground.png"];
        _backgroundImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        self.lable1 = [[UILabel alloc]initWithFrame:CGRectMake(226, 300, 100, 30)];
        self.lable2 = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 226 - 100, 300, 100, 30)];
        _lable1.text = @"方案一";
        _lable2.text = @"方案二";
        _lable1.font = [UIFont systemFontOfSize:26.0];
        _lable2.font = [UIFont systemFontOfSize:26.0];
        _lable1.textAlignment = NSTextAlignmentCenter;
        _lable2.textAlignment = NSTextAlignmentCenter;
        
        self.sliderGallery = [[SliderGalleryView alloc]initWithFrame:CGRectMake(135, 394, 282, 282)];
        
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 135 - 282, 394, 282, 282)];
        _imageView.image = [UIImage imageNamed: @"StoneiPad-Air-Silver"];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addSubview:_backgroundImageView];
        [self addSubview:_lable1];
        [self addSubview:_lable2];
        [self addSubview:_sliderGallery];
        [self addSubview:_imageView];
    }
    if (_pageIndex == 2) {
        //setBackgroundImage...
        
        self.textLable = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - 300, 410, 600, 50)];
        _textLable.text = @"请点击你要选择的实验";
        _textLable.textColor = UIColor.blackColor;
        _textLable.backgroundColor = UIColor.redColor;
        _textLable.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_textLable];
    }
    
    [self addSubview:_button1];
    [self addSubview:_button2];
    [self addSubview:_button3];
}


-(void)changeButton:(NSInteger)index andName:(NSString *)name
{
    switch (index) {
        case 1:
            if ([name isEqualToString: @"无传感器"]) {
                _button1.enabled = false;
                [_button1 setTitle:name forState:UIControlStateDisabled];
            } else {
                _button1.enabled = true;
                [_button1 setTitle:name forState:UIControlStateNormal];

            }
            break;
        case 2:
            if ([name isEqualToString:@"无传感器"]) {
                _button2.enabled = false;
                [_button2 setTitle:name forState:UIControlStateDisabled];
            } else {
                _button2.enabled = true;
                [_button2 setTitle:name forState:UIControlStateNormal];
            }
            break;
        case 3:
            if ([name isEqualToString:@"无传感器"]) {
                _button3.enabled = false;
                [_button3 setTitle:name forState:UIControlStateDisabled];
            } else {
                _button3.enabled = true;
                [_button3 setTitle:name forState:UIControlStateNormal];
            }
            break;
        default:
            NSLog(@"Can not find the button!");
            break;
    }
}


@end
