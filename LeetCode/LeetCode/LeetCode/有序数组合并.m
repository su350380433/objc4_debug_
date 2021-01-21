//
//  有序数组合并.m
//  LeetCode
//
//  Created by ss on 2021/1/20.
//

#import "有序数组合并.h"

@implementation MergeList

+ (void)mergeList:(NSArray *)firstArray andSecondArray:(NSArray *)secondArray {
    NSMutableArray *mArray = [[NSMutableArray array] initWithCapacity:(firstArray.count + secondArray.count)];
    NSArray *minArray = (firstArray.count > secondArray.count)? secondArray : firstArray;
    NSArray *maxArray = (firstArray.count < secondArray.count)? secondArray : firstArray;

    NSInteger maxIndex = 0;
    for (NSInteger index = 0; index < minArray.count; ) {
        if (minArray[index] < maxArray[maxIndex]) {
            [mArray addObject:minArray[index]];
            index++;
        } else {
            [mArray addObject:maxArray[maxIndex]];
            maxIndex++;
        }
    }
    for (NSInteger index = maxIndex; maxIndex < minArray.count; index++) {
        [mArray addObject:maxArray[index]];
    }
}
@end
