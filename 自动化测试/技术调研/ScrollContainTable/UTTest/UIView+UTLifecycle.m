//
//  UIView+UTTest.m
//  ScrollContainTable
//
//  Created by ss on 2021/3/4.
//  Copyright © 2021 RLY. All rights reserved.
//

#import "UIView+UTLifecycle.h"
#import <objc/runtime.h>

@implementation UIView(UTLifecycle)

+ (void)load {
    Method systemMethod = class_getInstanceMethod(self, @selector(addSubview:));
    Method my_Method = class_getInstanceMethod(self, @selector(ut_addSubview:));
    method_exchangeImplementations(systemMethod, my_Method);
}

- (void)ut_addSubview:(UIView *)view {
    [self ut_addSubview:view];
    NSLog(@"+🚗 self =%@ addView = %@",NSStringFromClass(self.class),NSStringFromClass(view.class));
}

@end
