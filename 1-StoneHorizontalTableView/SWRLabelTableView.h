//
//  SWRLabelTableView.h
//  StoneNHorizontalTableView
//
//  Created by StoneNan on 2017/8/5.
//  Copyright © 2017年 StoneNan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWRLabelTableView : UIView

@property(nonatomic,weak)NSArray *data;
@property(nonatomic,assign)NSInteger endIndex; //显示的最后一个数据在data数组中的下标
@property(nonatomic,strong)NSString *numberLabelText;
@property(nonatomic,strong)NSString *valueLabelText;

@end
