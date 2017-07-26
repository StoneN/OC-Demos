//
//  SliderGalleryView.m
//  StoneItem
//
//  Created by StoneNan on 2017/7/25.
//  Copyright © 2017年 StoneNan. All rights reserved.
//

#import "SliderGalleryView.h"

@interface SliderGalleryView ()

@property(nonatomic,strong)UIScrollView *scrollerView;
@property(nonatomic,strong)UIImageView *leftImageView;
@property(nonatomic,strong)UIImageView *middleImageView;
@property(nonatomic,strong)UIImageView *rightImageView;
@property(nonatomic,strong)UIPageControl *pageControl;

@property(nonatomic,assign)NSInteger currentIndex;
@property(nonatomic,strong)NSArray *images;

//自动滚动计时器
@property(nonatomic,strong)NSTimer *autoScrollTimer;




@end


@implementation SliderGalleryView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        
        [self configureImages];
        [self configureElement];
        [self updateImageViews];
        [self configureAutoScrollTimer];
        
        _pageControl.hidden = true;
    }
    return self;
}

-(void)configureElement
{
    CGFloat width = self.frame.size.width;
    CGFloat height =self.frame.size.height;
    
    self.leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    self.middleImageView = [[UIImageView alloc]initWithFrame:CGRectMake(width, 0, width, height)];
    self.rightImageView = [[UIImageView alloc]initWithFrame:CGRectMake(width * 2, 0, width, height)];
    _leftImageView.contentMode = UIViewContentModeScaleAspectFit;
    _middleImageView.contentMode = UIViewContentModeScaleAspectFit;
    _rightImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.scrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    _scrollerView.contentSize = CGSizeMake(width * 3, height);
    _scrollerView.contentOffset = CGPointMake(width, 0);
    _scrollerView.pagingEnabled = true;
    _scrollerView.bounces = false;
    _scrollerView.showsHorizontalScrollIndicator = false;
    _scrollerView.delegate = self;
    
    self.pageControl = [[UIPageControl alloc]init];
    _pageControl.numberOfPages = _images.count;
    _pageControl.userInteractionEnabled = false;
    _pageControl.center = CGPointMake(_scrollerView.center.x, _scrollerView.frame.size.height - _pageControl.frame.size.height);
    _pageControl.currentPage = _currentIndex;
       
    [_scrollerView addSubview:_leftImageView];
    [_scrollerView addSubview:_middleImageView];
    [_scrollerView addSubview:_rightImageView];
    
    [self addSubview:_scrollerView];
    [self addSubview:_pageControl];
}

-(void)configureImages
{
    self.currentIndex = 0;
    self.images = [NSArray arrayWithObjects:
               [UIImage imageNamed: @"StoneSensor1.png"],
               [UIImage imageNamed: @"StoneSensor2.png"],
               [UIImage imageNamed: @"StoneSensor3.png"],
               nil];
}

-(void)updateImageViews
{
    _pageControl.currentPage = _currentIndex;
    if (_currentIndex == 0) {
        _leftImageView.image = _images.lastObject;
        _middleImageView.image = _images.firstObject;
        int rightImageIndex = _images.count > 1 ? 1 : 0;
        _rightImageView.image = _images[rightImageIndex];
    }
    else if (_currentIndex == _images.count - 1) {
        _leftImageView.image = _images[_currentIndex - 1];
        _middleImageView.image = _images.lastObject;
        _rightImageView.image = _images.firstObject;
    }
    else {
        _leftImageView.image = _images[_currentIndex - 1];
        _middleImageView.image = _images[_currentIndex];
        _rightImageView.image = _images[_currentIndex + 1];
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_images.count != 0) {
        NSInteger offsetX = scrollView.contentOffset.x;
        NSInteger width = _scrollerView.frame.size.width;
        if (offsetX >= width * 2) {
            scrollView.contentOffset = CGPointMake(width, 0);
            self.currentIndex += 1;
            if (_currentIndex == _images.count) {
                self.currentIndex = 0;
            }
        }
        if (offsetX <= 0) {
            scrollView.contentOffset = CGPointMake(width, 0);
            self.currentIndex -= 1;
            if (_currentIndex == -1) {
                self.currentIndex = _images.count - 1;
            }
        }
        [self updateImageViews];
    }
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [_autoScrollTimer invalidate];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self configureAutoScrollTimer];
}

-(void)configureAutoScrollTimer
{
    self.autoScrollTimer = [NSTimer scheduledTimerWithTimeInterval: 1 target: self selector: @selector(letItScroll) userInfo: nil repeats: YES];
}

-(void)letItScroll
{
    CGPoint offset = CGPointMake(self.frame.size.width * 2, 0);
    [_scrollerView setContentOffset: offset animated: YES];
}



@end
