//
//  BinarySearch.m
//  LeetCode
//
//  Created by ss on 2021/1/26.
//

#import "BinarySearch.h"

@implementation BinarySearch

- (void)main {
    
}

- (NSInteger)binarySearch:(NSArray *)array begin:(NSInteger)begin end:(NSInteger)end target:(NSInteger)target{
    if (!array || array.count < 2 || begin > end) {
        return -1;
    }
  
    NSInteger middle = begin + (end - begin)/2;
    NSInteger middleValue = [array[middle] integerValue];

    if (middleValue == target) {
        return middle;
    }
    
    if (target < middleValue) {
        return [self binarySearch:array begin:begin end:middle target:target];
    } else {
        return [self binarySearch:array begin:middle end:end target:target];
    }
}
@end
