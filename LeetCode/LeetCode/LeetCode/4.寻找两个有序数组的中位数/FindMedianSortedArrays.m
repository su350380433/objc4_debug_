//
//  FindMedianSortedArrays.m
//  LeetCode
//
//  Created by ss on 2021/1/26.
//

#import "FindMedianSortedArrays.h"

@implementation FindMedianSortedArrays

/*
 题目描述：

 给定两个大小为 m 和 n 的有序数组 nums1 和 nums2。

 请你找出这两个有序数组的中位数，并且要求算法的时间复杂度为 O(log(m + n))。

 你可以假设 nums1 和 nums2 不会同时为空。

 示例 1:

 nums1 = [1, 3]
 nums2 = [2]

 则中位数是 2.0
 示例 2:

 nums1 = [1, 2]
 nums2 = [3, 4]

 则中位数是 (2 + 3)/2 = 2.5
 
 */
- (void)main {
//    NSInteger res = [self findMedianSortedArray:@[@1,@4,@6,@7] secArray:@[@1,@10]];
    NSArray *firstArray = @[@1,@4,@6,@7];
    NSArray *secondArray = @[@1,@10];
    NSInteger res= [self binarySearch:firstArray
                              f_begin:0
                                f_end:firstArray.count
                          secondArray:secondArray
                              s_begin:0
                                s_end:secondArray.count
                          targetIndex:3];
    NSLog(@"res = %ld",res);
}


/// 递归的原则， target会变化变小， begin和end 也随之变化
/// @param firstArray <#firstArray description#>
/// @param f_begin <#f_begin description#>
/// @param f_end <#f_end description#>
/// @param secondArray <#secondArray description#>
/// @param s_begin <#s_begin description#>
/// @param s_end <#s_end description#>
/// @param targetIndex <#targetIndex description#>
- (NSInteger)binarySearch:(NSArray *)firstArray
                  f_begin:(NSInteger)f_begin
                  f_end:(NSInteger)f_end

              secondArray:(NSArray *)secondArray
                  s_begin:(NSInteger)s_begin
                    s_end:(NSInteger)s_end

              targetIndex:(NSInteger)targetIndex {
    
    if ((f_end - f_begin) < (s_end - s_begin)) {
        return [self binarySearch:secondArray
                          f_begin:s_begin
                            f_end:s_end
                      secondArray:firstArray
                          s_begin:f_begin
                            s_end:f_end
                      targetIndex:targetIndex];
    }

    if (f_end == 0) return [secondArray[f_end] integerValue];
    if (s_end == 0) return [firstArray[s_end] integerValue];
    if (targetIndex == 0) {
        return MIN(firstArray[f_begin], secondArray[s_begin]);
    }
    if ((s_end - s_begin) <= 1)   //第二数组长度为1的情况
     {
         if (firstArray[f_begin + targetIndex] <= secondArray[s_begin]) return firstArray[s_begin + targetIndex];

         return MAX(firstArray[s_begin + targetIndex - 1], secondArray[s_begin]);
     }
    
    NSInteger idx1 = MAX(f_end - f_begin + 1, targetIndex)/2;
    NSInteger idx2 = MAX(s_end - s_begin + 1, targetIndex)/2;
    
    NSInteger f_value = [firstArray[idx1 + f_begin] integerValue];
    NSInteger s_value = [secondArray[idx2 + s_begin] integerValue];

    if (f_value == s_value) {
        return f_value;
    } else if (f_value < s_value) {
        return [self binarySearch:firstArray
                          f_begin:f_begin + idx1
                            f_end:f_end
                      secondArray:secondArray
                          s_begin:s_begin
                            s_end:s_end
                      targetIndex:targetIndex - idx1];

    } else {
        return [self binarySearch:firstArray
                          f_begin:f_begin
                            f_end:f_end
                      secondArray:secondArray
                          s_begin:s_begin + idx2
                            s_end:s_end
                      targetIndex:targetIndex-idx2];
    }
    return -1;
}



/// 时间复杂度 O(m+n)
/// @param firstArray firstArray description
/// @param secArray secArray description
- (NSInteger)findMedianSortedArray:(NSArray *)firstArray secArray:(NSArray *)secArray {
    if (firstArray.count < secArray.count) {
        NSArray *tempArray = secArray;
        secArray = firstArray;
        firstArray = tempArray;
    }
    NSInteger firstIndex = 0;
    NSInteger secondIndex = 0;
    NSInteger targetIndex = (firstArray.count + secArray.count + 1)/2;
    NSInteger secondValue = [secArray[secondIndex] integerValue];
    NSInteger firstValue = [firstArray[0] integerValue];

    for (firstIndex = 0; firstIndex < firstArray.count; ) {
        firstValue = [firstArray[firstIndex] integerValue];
        while (secondIndex <= secArray.count &&
               secondValue < firstValue &&
               firstIndex + secondIndex < targetIndex) {//从第二个数组中寻找
            secondIndex++;
        }
        if (firstIndex + secondIndex >= targetIndex) {
            break;
        }
        firstIndex++;
    }
    if (firstValue > secondValue) {
        return firstValue;
    }
    return secondValue;
}




@end
