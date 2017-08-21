# StoneHorizontalTableView

![1-StoneHorizontalTableViewDemo](https://github.com/StoneN/OC-Demos/blob/master/PicturesForREADME/1-StoneHorizontalTableViewDemo.gif)

### 说明：
最近在测试项目里的一个水平表格时发现一个问题：
模仿`UITableView`实现的`HorizontalTableView`在遇到 *短时间内需展示的数据量过大* 的情况时，会因为性能问题导致整个页面卡住。不幸的是该项目不可避免的会频繁遇到这种状况，也就只能被迫寻找其他解决方案。

其实需求非常简单：
如上`gif`所示，只需用水平的表格动态展示实时更新的数据(*数据量以千位记*)，并可以通过左右滑动来查看所有数据。

分析了需求之后，我想到了之前写过的[轮播器：0-StoneView](https://github.com/StoneN/OC-Demos/blob/master/0-StoneView/README-0.md)，就想尝试用类似的原理实现一个“`HorizontalTableView`”，便有了这个`View`。

实现之后经过测试，发现它恰好可以满足项目的需求，以此记之。

### 使用方法：
- 拷贝以下文件到你的项目中:
     ~~~
      SWRLabelTableView.h
      SWRLabelTableView.m
      STNHorizontalTableView.h
      STNHorizontalTableView.m
     ~~~
- 导入头文件并使用 initWithFrame: 初始化 view ：

      #import "SWRLabelTableView.h"
      //......
      //......
      @property(nonatomic, strong)SWRLabelTableView *labelTableView;
      //......
      //......
      _labelTableView = [[SWRLabelTableView alloc]initWithFrame:CGRectMake(0,100,UIScreen.mainScreen.bounds.size.width,200)];
- 通过 点操作 或 设值方法 来自定义 view 的一些属性，可定义的属性如下：

      @property(nonatomic,weak)NSArray *data;
      //数据源指针，指向一个可变数组

      @property(nonatomic,assign)NSInteger endIndex;
      //显示的最后一个数据在data数组中的下标
- 使用时只需指定好数据源，若有需要可通过更新`endIndex`属性来手动刷新表格  
> 有兴趣的朋友们可自行下载源码。


