//
//  ViewController.m
//  LeetCode
//
//  Created by ss on 2021/1/20.
//

#import "ViewController.h"
#import "交互值.h"
#import "LISRecursion.h"
#import "LengthOfSubstring.h"
#import "FindMedianSortedArrays.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [Swap swap:10 b:20];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    [btn setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonAction {
//    [[LISRecursion new] performSelector:@selector(main)];
//    [[LengthOfSubstring new] performSelector:@selector(main)];
//    [[FindMedianSortedArrays new] performSelector:@selector(main)];
    [self xx:7];

    
}

- (int)xx:(int)n {
    int sum = 0;
        while (n != 0) {
            sum++;
            n &= (n - 1);
        }
    return sum;
}

@end
