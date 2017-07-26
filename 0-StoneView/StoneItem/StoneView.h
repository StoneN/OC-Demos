//
//  StoneView.h
//  StoneItem
//
//  Created by StoneNan on 2017/7/6.
//  Copyright © 2017年 StoneNan. All rights reserved.
//

#define SCREEN_WIDTH UIScreen.mainScreen.bounds.size.width
#define SCREEN_HEIGHT UIScreen.mainScreen.bounds.size.height

#import <UIKit/UIKit.h>
#import "SliderGalleryView.h"

@protocol StoneViewDelegate <NSObject>

-(void)buttonEvent:(NSInteger)index;//处理按钮点击事件

@end


@interface StoneView : UIView

-(instancetype)initWithFrame:(CGRect)frame andPageIndex:(NSInteger)pageIndex;
-(void)sendButtonName1:(NSString *)name1 andName2:(NSString *)name2 andName3:(NSString *)name3;

@end
