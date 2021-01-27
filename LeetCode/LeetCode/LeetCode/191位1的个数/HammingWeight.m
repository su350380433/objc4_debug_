//
//  HammingWeight.m
//  LeetCode
//
//  Created by ss on 2021/1/26.
//

#import "HammingWeight.h"

@implementation HammingWeight

- (void)main {
    [self hammingWeight:7];
}

- (int)hammingWeight:(int)n {
    int sum = 0;
    while (n != 0) {
        sum++;
        n &= (n-1);
    }
    return sum;
}
@end
