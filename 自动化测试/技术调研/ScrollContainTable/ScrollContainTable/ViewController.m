//
//  ViewController.m
//  ScrollContainTable
//
//  Created by RLY on 2018/11/6.
//  Copyright © 2018年 RLY. All rights reserved.
//

#import "ViewController.h"
#import "UIView+UIScreenDisplaying.h"
#import "UIView+UTLifecycle.h"

/// 这三个值根据实际情况设置。
static const CGFloat kSectionHeaderViewHeight = 70;
static const CGFloat kTableOriginY = 191;
CGFloat kTableHeaderHeight = kTableOriginY - kSectionHeaderViewHeight;

@interface ViewController () <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) EGOTableHeaderView *tableHeaderView;

@property (nonatomic, strong) NSMapTable * mapTable;
@property (nonatomic, strong) NSTimer * timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableHeaderView = [[EGOTableHeaderView alloc] initWithFrame:CGRectMake(0, 0, _scroll.frame.size.width, kTableHeaderHeight)];
    [_scroll insertSubview:_tableHeaderView atIndex:0];
}

- (void)viewDidAppear:(BOOL)animated {
    self.mapTable = [NSMapTable weakToStrongObjectsMapTable];

    dispatch_async(dispatch_get_main_queue(), ^{
        [self listSubviewsOfView:self.view];
        [self startScroll];
    });
}

- (void)listSubviewsOfView:(UIView *)view {

    // Get the subviews of the view
    NSArray *subviews = [view subviews];

    // Return if there are no subviews
    if ([subviews count] == 0) return; // COUNT CHECK LINE

    //查找出第一层的scrollview
    for (UIView *subview in subviews) {

        // Do what you want to do with the subview
        NSLog(@"%@", subview);

        if ([subview isKindOfClass:[UIScrollView class]]) {
            NSMutableArray *dataArray = [self.mapTable objectForKey:self];
            if (dataArray == nil) {
                dataArray = [[NSMutableArray alloc] init];
                [dataArray addObject:subview];
                [self.mapTable setObject:dataArray forKey:self];
            } else {
                [dataArray addObject:subview];
            }
            NSLog(@"add = %@", subview);
        }
        // List the subviews of subview
        [self listSubviewsOfView:subview];
    }
}
//
- (void)autoScroll {
    NSMutableArray *dataSource = [self.mapTable objectForKey:self];
    UIScrollView *removeScrollView = nil;//带移除的视图
    UIScrollView *targetScrollView = nil;//待滚动的视图

    for (UIScrollView *scrollView in dataSource) {
        float scrollViewHeight = scrollView.frame.size.height;
        float scrollContentSizeHeight = scrollView.contentSize.height;
        float scrollOffset = scrollView.contentOffset.y;
        if (scrollOffset + scrollViewHeight >= scrollContentSizeHeight) {// 滚动到了底部
            removeScrollView = scrollView;
            break;
        } else {
            targetScrollView = scrollView;
            break;
        }
    }
    //移除滚动到底部的视图
    if (removeScrollView) {
        //如果是最后一条，就暂停滚动
        [dataSource removeObject:removeScrollView];
        if (dataSource.count == 0) {
            [self stopScroll];
        }
        return;
    }
    if (targetScrollView) {//待滚动的视图
        if ([targetScrollView ut_isDisplayedInScreen]) {//展示在屏幕上
            NSLog(@"在当前屏幕上 = %@",targetScrollView);
        } else {
            UIWindow * window = [UIApplication sharedApplication].keyWindow;
            CGRect rect=[self.view convertRect: targetScrollView.bounds toView:window];
            NSLog(@"❎window 不在屏幕上 = %@ ❎rect = %@",targetScrollView,NSStringFromCGRect(rect));

            [targetScrollView ut_scrollToScreen:targetScrollView andSuperView:targetScrollView.superview];

        }
        //判断滚动的方向，竖的优先，Y轴
        if (targetScrollView.contentSize.height > targetScrollView.frame.size.height) {
            CGFloat pointY = targetScrollView.contentOffset.y + targetScrollView.frame.size.height/3.0;
            if (pointY > targetScrollView.contentSize.height) {
                pointY = targetScrollView.contentSize.height;
            }
            [UIView animateWithDuration:(float)1.25f
                                 animations:^{
                                    targetScrollView.contentOffset = CGPointMake(targetScrollView.contentOffset.x, pointY);
                                 }
                             completion:^(BOOL finished) {
                //滚动结束后，获取当前视图的子 subviews，查看是否有scrollView类型，加入带滚动Map，以当前正在滚动的subview作为
            }];
        } else if (targetScrollView.contentSize.width > targetScrollView.frame.size.width) {
            
        }
    }


}

-(void)startScroll {
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(autoScroll) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer;
    NSLog(@"开始 ‼️😁");
}

-(void)stopScroll {
    [self.timer invalidate];
    self.timer = nil;
    NSLog(@"结束 ‼️");
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    _layoutContainerScrollViewHeight.constant = _scroll.frame.size.height - kSectionHeaderViewHeight;
    NSAssert(kTableHeaderHeight >= 0,  @"kHeaderViewHeight必须小于等于kTableOriginY");
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == _scroll) {
        if (_table.contentOffset.y > 0) {
            // header已经消失，开始滚动下面的_table，并让_scroll不动
            _scroll.contentOffset = CGPointMake(0, kTableHeaderHeight);
        }
        if (_scroll.contentOffset.y < kTableHeaderHeight) {
            // header已经显示出来，重置_table.contentOffset为0
            _table.contentOffset = CGPointZero;
        }
        [_tableHeaderView scrollViewDidScroll:scrollView.contentOffset.y];
    }
    else if (scrollView == _table) {
        if (_scroll.contentOffset.y < kTableHeaderHeight) {
            // header还没有消失，那么_table.contentOffset一直为0
            _table.contentOffset = CGPointZero;
            _table.showsVerticalScrollIndicator = NO;
        }
        else {
            // header已经消失
            _scroll.contentOffset = CGPointMake(0, kTableHeaderHeight);
            _table.showsVerticalScrollIndicator = YES;
        }
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end


@implementation EGOScrollView

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return [gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]];
}

@end


@implementation EGOTableHeaderView {
    UIImageView *_imageView;
    CGRect _imageViewFrame;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _imageViewFrame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"风景图.jpg"]];
        _imageView.frame = _imageViewFrame;
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
        [self addSubview:_imageView];
    }
    return self;
}

- (void)scrollViewDidScroll:(CGFloat)contentOffsetY {
    CGRect frame = _imageViewFrame;
    frame.size.height -= contentOffsetY;
    frame.origin.y = contentOffsetY;
    _imageView.frame = frame;
}

@end


