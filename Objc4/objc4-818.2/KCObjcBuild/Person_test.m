//
//  Person_test.m
//  KCObjcBuild
//
//  Created by ss on 2021/1/8.
//

#import "Person_test.h"

@implementation Person_test

- (id)init {
    self =  [super init];
    if (self) {
        NSLog(@"person_init");
    }
    return self;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [super allocWithZone:zone];
}
@end
