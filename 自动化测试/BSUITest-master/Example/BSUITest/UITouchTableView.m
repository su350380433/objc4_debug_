//
//  UITouchTableView.m
//  BSUITest_Example
//
//  Created by ss on 2021/4/6.
//  Copyright © 2021 vviicc. All rights reserved.
//

#import "UITouchTableView.h"

@implementation UITouchTableView

//一根或者多根手指开始触摸view（手指按下）
-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    UITouch * touch = touches.anyObject;//获取触摸对象
    NSLog(@" touchesBegan = %@",@(touch.tapCount));//短时间内的点击次数
}

//一根或者多根手指在view上移动（随着手指的移动，会持续调用该方法）
-(void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
    UITouch * touch = touches.anyObject;//获取触摸对象
    NSLog(@" touchesMoved = %@ touch = %@",@(touch.tapCount),touch);//短时间内的点击次数
}

//一根或者多根手指离开view（手指抬起）
-(void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
    UITouch * touch = touches.anyObject;//获取触摸对象
    NSLog(@" touchesEnded = %@",@(touch.tapCount));//短时间内的点击次数
}

//某个系统事件(例如电话呼入)打断触摸过程
-(void)touchesCancelled:(NSSet*)touches withEvent:(UIEvent*)event {
    UITouch * touch = touches.anyObject;//获取触摸对象
    NSLog(@" touchesCancelled = %@",@(touch.tapCount));//短时间内的点击次数
}

@end
