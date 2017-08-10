//
//  STNHorizontalTableView.m
//  StoneNHorizontalTableView
//
//  Created by StoneNan on 2017/8/1.
//  Copyright © 2017年 StoneNan. All rights reserved.
//

#import "STNHorizontalTableView.h"

@interface STNHorizontalTableView ()

-(void)configureLabels;

@end



@implementation STNHorizontalTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = true;
        
        self.contentSize = CGSizeMake(frame.size.width * 3, frame.size.height);
        self.contentOffset = CGPointMake(0, 0);
        
        [self configureLabels];
    }
    return self;
}


-(void)configureLabels
{
    CGFloat labelWidth = (self.frame.size.width + STNHorizontalTableView_labelNumber - 1) / STNHorizontalTableView_labelNumber;
    CGFloat labelHeight = self.frame.size.height / 2;
    CGRect rect1, rect2;
    for (NSInteger i = 0; i < STNHorizontalTableView_labelNumber * 3; ++i) {
        rect1 = CGRectMake((labelWidth - 1) * i, 0, labelWidth, labelHeight);
        UILabel *label1 = [[UILabel alloc]initWithFrame:rect1];
        label1.text = [[NSString alloc]initWithFormat:@"%li",(long)i + 1];
        label1.textAlignment = NSTextAlignmentCenter;
        label1.layer.borderWidth = 1.0;
        label1.layer.borderColor = [[UIColor blackColor] CGColor];
        label1.tag = i + 1;
        
        rect2 = CGRectMake((labelWidth - 1) * i, labelHeight, labelWidth, labelHeight);
        UILabel *label2 = [[UILabel alloc]initWithFrame:rect2];
        label2.text = [[NSString alloc]initWithFormat:@"%li",(long)i + 1];
        label2.textAlignment = NSTextAlignmentCenter;
        label2.layer.borderWidth = 1.0;
        label2.layer.borderColor = [[UIColor blackColor] CGColor];
        label2.tag = i + 100;
        
        [self addSubview:label1];
        [self addSubview:label2];
    }
}




@end
