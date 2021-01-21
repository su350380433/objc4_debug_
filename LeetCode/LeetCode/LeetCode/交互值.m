//
//  交互值.m
//  LeetCode
//
//  Created by ss on 2021/1/20.
//

#import "交互值.h"

@implementation Swap

+ (void)swap:(NSInteger)a b:(NSInteger) b {
    a = a ^ b;
    b = a ^ b;
    a = a ^ b;
}
@end
