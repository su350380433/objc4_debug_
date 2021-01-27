//
//  LISRecursion.m
//  LeetCode
//
//  Created by ss on 2021/1/25.
//

#import "LISRecursion.h"

/// <#Description#>
@implementation LISRecursion

/*
 题目描述：给定一个无序的整数数组num，找到其中最长上升子序列的长度。

 示例:

 输入：[10，9，2，5，3，7，101，18]

 输出：4

 解释：最长的上升子序列是[2，3，7，101]，它的长度是4
 */


// 动态
static NSInteger maxLength = 1;
- (void)main {
    NSMutableDictionary *cacheDic = [[NSMutableDictionary alloc] init];
    NSArray *nums = @[@10,@9,@2,@5,@3,@7,@101,@18];
    NSInteger result = [self lengthOfLIS:nums andEnd:nums.count cacheDic:cacheDic];
    NSLog(@"%ld",result);
}

/*  时间复杂度
 笔记链接 ： http://note.youdao.com/s/TPYG2BL9
 1、未使用cache缓存数据时
 T2 = T1 + T0
 T3 = T1 + T2
 T(n) = T1 +T2 + ...+ T(n-1)
 
 T(n) = 2 * T(n-1)
 O(n) = O(2^n)  2的n次方
 
+++++++++++++++++++++++++++++++++++
 2、使用了cache缓存数据后
 O(Tn)  = O(T1+T2+T3+。。。T()n-1)
        = O(1+2+3+...+ (n-1))
        = O(n *(n-1)/2) = O(n * n)
 */

/// 递归算法
/// @param nums 数组
/// @param end 计算结束时间，不是数组总的个数
/// @param cacheDic 缓存
- (NSInteger)lengthOfLIS:(NSArray *)nums andEnd:(NSInteger)end cacheDic:(NSMutableDictionary *)cacheDic{
    if (!nums || nums.count <= 1) {
        return nums.count;
    }
    NSInteger cacheValue = [[cacheDic objectForKey:[NSString stringWithFormat:@"%ld",end]] integerValue];
    if (cacheValue > 0) {
        NSLog(@"命中缓存 end = %ld",end);
        return cacheValue;
    }
    NSInteger maxLengthTem = 1;
    NSInteger result = 0;
    for (NSInteger index = 1; index < end; index++) {
#warning 重点，递归调用
        result = [self lengthOfLIS:nums andEnd:index cacheDic:cacheDic];
        
        //小于当前 队列中最后一个
        if ([nums[index-1] integerValue] <[nums[end -1] integerValue]) {
            if (result+ 1 > maxLengthTem) {
                maxLengthTem = result + 1;
            }
        }
    }
    // 循环遍历结束后，更新
    if (maxLengthTem > maxLength) {
        maxLength = maxLengthTem;
    }
    [cacheDic setValue:@(maxLengthTem) forKey:[NSString stringWithFormat:@"%ld",end]];
    return maxLengthTem;
}
@end
