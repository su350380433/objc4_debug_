//
//  main.m
//  KCObjcBuild
//
//  Created by cooci on 2021/1/5.


// KC 重磅提示 调试工程很重要 源码直观就是爽
// ⚠️编译调试不能过: 请你检查以下几小点⚠️
// ①: enable hardened runtime -> NO
// ②: build phase -> denpendenice -> objc
// 爽了之后,还来一个 👍

#import <Foundation/Foundation.h>
#import "Person_test.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "DynamicAddClass.h"
#import "Person_test+Test.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //动态添加 类
//        [DynamicAddClass dynamicAddClass];
        
        // cagetory 管理对象
        Person_test *person = [[Person_test alloc] init];
//        person.secondName = @"良锦";
        person.name = @"苏";
        person.age = 31;
        
        //weak置空原理
        id __weak object = person;
        
        id __weak object2 = person;

    }
    return 0;
}
