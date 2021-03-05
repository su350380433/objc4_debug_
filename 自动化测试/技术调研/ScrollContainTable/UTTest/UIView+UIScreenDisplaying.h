//
//  UIView+UIScreenDisplaying.h
//  ScrollContainTable
//
//  Created by ss on 2021/3/4.
//  Copyright © 2021 RLY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView(UIScreenDisplaying)
// 判断View是否显示在屏幕上
- (BOOL)ut_isDisplayedInScreen;


/// 滑动到屏幕中间
/// @param view 当前View
/// @param superView 上层view，可能是父视图的父视图
- (void)ut_scrollToScreen:(UIView *)view andSuperView:(UIView *)superView;
@end

NS_ASSUME_NONNULL_END
