//
//  UIView+UIScreenDisplaying.m
//  ScrollContainTable
//
//  Created by ss on 2021/3/4.
//  Copyright © 2021 RLY. All rights reserved.
//

#import "UIView+UIScreenDisplaying.h"

@implementation UIView(UIScreenDisplaying)

// 判断View是否显示在屏幕上
- (BOOL)ut_isDisplayedInScreen {
    if (self == nil) {
        return FALSE;
    }
    
    CGRect screenRect = [UIScreen mainScreen].bounds;
    UIWindow * window = [UIApplication sharedApplication].keyWindow;

    // 转换view对应window的Rect
    CGRect rect = [self convertRect:self.frame fromView:window];
    if (CGRectIsEmpty(rect) || CGRectIsNull(rect)) {
        return FALSE;
    }
    
    // 若view 隐藏
    if (self.hidden) {
        return FALSE;
    }
    
    // 若没有superview
    if (self.superview == nil) {
        return FALSE;
    }
    
    // 若size为CGrectZero
    if (CGSizeEqualToSize(rect.size, CGSizeZero)) {
        return  FALSE;
    }
    
    // 获取 该view与window 交叉的 Rect
    CGRect intersectionRect = CGRectIntersection(rect, screenRect);
    if (CGRectIsEmpty(intersectionRect) || CGRectIsNull(intersectionRect)) {
        return FALSE;
    }
    return TRUE;
}

/// 滑动到屏幕中间
/// @param view 当前View
/// @param superView 上层view，可能是父视图的父视图
- (void)ut_scrollToScreen:(UIView *)view andSuperView:(UIView *)superView {
    if (!view || !view.superview) {
        return;
    }
    // 若view 隐藏
    if (view.hidden) {
        return;
    }
    //如果父类是 UIScrollView 才能滚动
    if ([superView isKindOfClass:UIScrollView.class]) {
        CGRect rect_superView = [view convertRect: view.bounds toView:superView];
        NSLog(@"❎superView 不在屏幕上 = %@ ❎rect = %@",view,NSStringFromCGRect(rect_superView));
        if (rect_superView.origin.x > 0 || rect_superView.origin.y > 0) {//大于X轴
            UIScrollView *targetScrollView = (UIScrollView *)superView;
            [UIView animateWithDuration:(float)1.25f
                                 animations:^{
                                    targetScrollView.contentOffset = rect_superView.origin;
                                 }
                             completion:^(BOOL finished) {
                //滚动结束后，获取当前视图的子 subviews，查看是否有scrollView类型，加入带滚动Map，以当前正在滚动的subview作为
            }];
            
        } 
    } else {
        //递归 调用
        [self ut_scrollToScreen:view andSuperView:superView.superview];
    }
}
@end
