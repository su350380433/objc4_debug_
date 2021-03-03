//
//  ViewController.m
//  Demo
//
//  Created by tripleCC on 5/22/19.
//  Copyright © 2019 tripleCC. All rights reserved.
//

#import "ViewController.h"
#import "YYClassInfo.h"
#import "YYDiskCache.h"
//#import <YYCache/YYDiskCache.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YYClassInfo *classInfo = [YYClassInfo new];
    NSString *nameString = classInfo.name;
    NSLog(@"%@",nameString);
    
    YYDiskCache *diskCache = [[YYDiskCache alloc] initWithPath:@""];
    if (!diskCache) {
        diskCache.name;
    }
}


@end
