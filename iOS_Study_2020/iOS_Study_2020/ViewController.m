//
//  ViewController.m
//  iOS_Study_2020
//
//  Created by ss on 2020/12/31.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>
#import <objc/objc.h>
#import <objc/message.h>
#import "GCDDemo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
#warning runtime demo
//    Person *p = [Person new];
////    objc_msgSend(void /* id self, SEL op, ... */ )
//
//    ((void (*)(id, SEL, Class))(void *) objc_msgSend)((id)p, @selector(sendMessage:), @"我是测试");
//    ((void (*)(id, SEL, Class))(void *) objc_msgSend )((id)p, @selector(sendMessage:),@"234");
////    objc_msgSend(p , @selector(sendMessage:) ,@"我是测试");
//    /** 1、获取元类对象 */
//    Class metaClass = object_getClass([Person class]);
//    /** 2、获取元类属性列表 */
//    unsigned int count = 0;
//    objc_property_t *propertList = class_copyPropertyList(metaClass, &count);
//    for (int i = 0; i < count; i++) {
//        NSLog(@"%s",property_getName(propertList[i]));
//    }
    
#warning GCD demo
    GCDDemo *demo = [GCDDemo new];
//    [GCDDemo gcd_print];
    [demo gcd_block];
}


@end
