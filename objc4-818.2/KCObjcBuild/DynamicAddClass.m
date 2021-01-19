//
//  DynamicAddClass.m
//  KCObjcBuild
//
//  Created by ss on 2021/1/12.
//

#import "DynamicAddClass.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation DynamicAddClass

// hobby的setter-IMP
void fxSetter(NSString *value) {
    printf("%s/n",__func__);
}

// hobby的getter-IMP
NSString *fxHobby() {
    return @"iOS";
}

// 添加属性变量的封装方法
void fx_class_addProperty(Class targetClass, const char *propertyName) {
    objc_property_attribute_t type = { "T", [[NSString stringWithFormat:@"@\"%@\"",NSStringFromClass([NSString class])] UTF8String] }; //type
    objc_property_attribute_t ownership0 = { "C", "" }; // C = copy
    objc_property_attribute_t ownership = { "N", "" }; //N = nonatomic
    objc_property_attribute_t backingivar  = { "V", [NSString stringWithFormat:@"_%@",[NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding]].UTF8String };  //variable name
    objc_property_attribute_t attrs[] = {type, ownership0, ownership, backingivar};
    class_addProperty(targetClass, propertyName, attrs, 4);
}

// 打印属性变量的封装方法
void fx_printerProperty(Class targetClass){
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList(targetClass, &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        fprintf(stdout, "%s %s\n", property_getName(property), property_getAttributes(property));
    }
}

+ (void)dynamicAddClass {
    // 动态创建类
    Class FXPerson = objc_allocateClassPair([NSObject class], "FXPerson", 0);
    // 添加成员变量
    // 添加成员变量class_addIvar必须在objc_registerClassPair前，因为注册到内存时ro已经确定了，不能再往ivars添加（同第四个面试题）
    class_addIvar(FXPerson, "name", sizeof(NSString *), log2(sizeof(NSString *)), "@");
    // 注册到内存
    objc_registerClassPair(FXPerson);
    // 添加属性变量
    fx_class_addProperty(FXPerson, "hobby");
    fx_printerProperty(FXPerson);
    // 添加方法（为属性方法添加setter、getter方法）
    class_addMethod(FXPerson, @selector(setHobby:), (IMP)fxSetter, "v@:@");
    class_addMethod(FXPerson, @selector(hobby), (IMP)fxHobby, "@@:");

    // 开始使用
    id person = [FXPerson alloc];
    [person setValue:@"Felix" forKey:@"name"];
    NSLog(@"FXPerson的名字是：%@ 爱好是：%@", [person valueForKey:@"name"], [person valueForKey:@"hobby"]);
}
#warning 注意事项
/*
 3.注意事项

 记得导入<objc/runtime.h>
 添加成员变量class_addIvar必须在objc_registerClassPair前，因为注册到内存时ro已经确定了，不能再往ivars添加（同第四个面试题）
 添加属性变量class_addProperty可以在注册内存前后，因为是往rw中添加的
 class_addProperty中“属性的属性”——nonatomic/copy是根据属性的类型变化而变化的
 class_addProperty不会自动生成setter和getter方法，因此直接调用KVC会崩溃

 作者：我是好宝宝
 链接：https://juejin.cn/post/6844904079957688328
 来源：掘金
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */
@end
