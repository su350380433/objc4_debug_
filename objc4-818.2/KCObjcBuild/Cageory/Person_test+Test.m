//
//  Person_test+Test.m
//  KCObjcBuild
//
//  Created by ss on 2021/1/12.
//

#import "Person_test+Test.h"
#import <objc/runtime.h>

@implementation Person_test(Test)

- (void)setSecondName:(NSString *)secondName {
    /**
    参数一：id object : 给哪个对象添加属性，这里要给自己添加属性，用self。
    参数二：void * == id key : 属性名，根据key获取关联对象的属性的值，在objc_getAssociatedObject中通过次key获得属性的值并返回。
    参数三：id value : 关联的值，也就是set方法传入的值给属性去保存。
    参数四：objc_AssociationPolicy policy : 策略，属性以什么形式保存。
    */
    objc_setAssociatedObject(self, @"secondName", secondName, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)secondName {
    /**
    参数一：id object : 获取哪个对象里面的关联的属性。
    参数二：void * == id key : 什么属性，与objc_setAssociatedObject中的key相对应，即通过key值取出value。
    */
    return objc_getAssociatedObject(self, @"secondName");
}


@end
