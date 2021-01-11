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

int main(int argc, const char * argv[]) {
    Person_test *objc = [[Person_test alloc] init];
    objc.name = @"what is your name xx=";
    objc.age = 101;
    
    NSLog(@"%@",objc.name);
    NSLog(@"%ld",objc.age);
    return 0;
}
