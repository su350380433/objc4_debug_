//
//  LengthOfSubstring.m
//  LeetCode
//
//  Created by ss on 2021/1/26.
//

#import "LengthOfSubstring.h"

@implementation LengthOfSubstring
/*
 题目描述：

 给定一个字符串，找出不含有重复字符的 最长子串 的长度。

  

 示例：

 给定 "abcabcbb" ，没有重复字符的最长子串是 "abc" ，那么长度就是3。

 给定 "bbbbb" ，最长的子串就是 "b" ，长度是1。

 给定 "pwwkew" ，最长子串是 "wke" ，长度是3。请注意答案必须是一个子串，"pwke" 是 子序列 而不是子串
 
 */
- (void)main {
    NSString *str = @"abcabcbb";
    NSArray *strArray = @[@"abcabcbb",@"bbbbbbb",@"pwwkew"];
    for (NSString *str in strArray) {
        NSInteger length = [self lengthOfSubstring:str];
        NSLog(@"输入字符串 = %@  输出最长字符串 = %ld",str,length);
    }
    
}

/// 时间复杂度 O(n)
/// @param str str description
- (NSInteger)lengthOfSubstring:(NSString *)str {
    //设置一个 set来放置字符串
    NSMutableSet *set = [[NSMutableSet alloc] init];// set哈希的时间复杂度是 O(1)
    NSInteger maxLength = 1;
    NSInteger quickIndex = 0;//快指针
    for (NSInteger slowIndex = 0; slowIndex < str.length; slowIndex++) {
        NSString *ch = [str substringWithRange:NSMakeRange(slowIndex, 1)];
        while ([set containsObject:ch]) { // set哈希的时间复杂度是 O(1)
            NSString *removeCh = [str substringWithRange:NSMakeRange(quickIndex, 1)];
            [set removeObject:removeCh]; //去除哈希set头部的值
            quickIndex ++;//快指针
        }
        [set addObject:ch];//插入数据
        
        maxLength = MAX(maxLength, set.count);
    }
    return maxLength;
}

/// 优化版本  set中存储对应字符下标
/// @param str str description
- (NSInteger)lengthOfSubstring_optimization:(NSString *)str {
    //设置一个 set来放置字符串
    NSMutableSet *set = [[NSMutableSet alloc] init];// set哈希的时间复杂度是 O(1)
    NSInteger maxLength = 1;
    NSInteger quickIndex = 0;//快指针
    for (NSInteger slowIndex = 0; slowIndex < str.length; slowIndex++) {
        NSString *ch = [str substringWithRange:NSMakeRange(slowIndex, 1)];
        while ([set containsObject:ch]) { // set哈希的时间复杂度是 O(1)
            NSString *removeCh = [str substringWithRange:NSMakeRange(quickIndex, 1)];
            [set removeObject:removeCh]; //去除哈希set头部的值
            quickIndex ++;//快指针
        }
        [set addObject:ch];//插入数据
        
        maxLength = MAX(maxLength, set.count);
    }
    return maxLength;
}
@end
