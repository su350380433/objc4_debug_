//
//  GCDDemo.m
//  iOS_Study_2020
//
//  Created by ss on 2021/1/5.
//

#import "GCDDemo.h"

@implementation GCDDemo


/// 测试打印 并行队列打印顺序
- (void)gcd_print {
    dispatch_queue_t queue = dispatch_queue_create("com.wang.MyConcurrentDispatchQueue",DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"1");
    dispatch_async(queue, ^{
        NSLog(@"2");
        dispatch_async(queue, ^{
            NSLog(@"3");
    
        });
        NSLog(@"4");
     
    });
    NSInteger count = 100;
    for (NSInteger index = 200; index < 1200000; index++) {
        count ++;
    }
    NSLog(@"5");
   
}
//开辟了多个线程
- (void)gcd_block {
    __block NSInteger a = 0;
    while (a < 1) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            a++;
            NSLog(@"a = %ld current thread =",a );
        });
    }
    
    NSLog(@"最后 a= %ld",a);
}
@end
