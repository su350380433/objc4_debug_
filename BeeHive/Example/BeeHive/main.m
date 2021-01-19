//
//  main.m
//  BeeHive
//
//  Created by 一渡 on 07/10/2015.
//  Copyright (c) 2015 一渡. All rights reserved.
//

@import UIKit;
#import "TestAppDelegate.h"

__attribute__((constructor))
static void beforeMain(void) {
    NSLog(@"beforeMain");
}
__attribute__((destructor))
static void afterMain(void) {
    NSLog(@"afterMain");
}
int main(int argc, char * argv[])
{
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([TestAppDelegate class]));
    }
}
