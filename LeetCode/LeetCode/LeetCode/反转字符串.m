//
//  反转字符串.m
//  LeetCode
//
//  Created by ss on 2021/1/20.
//

#import "反转字符串.h"

@implementation StrReverseWithArray

+(NSString *)strReverseWithString_1:(NSString *)string {
    if (!string || ![string isKindOfClass:NSString.class] || string.length == 0) {
        return string;
    }
    NSUInteger length = string.length -1;
    for (NSUInteger index = 0; index <length; index++,length--) {
        
    }
    return string;
}
@end
