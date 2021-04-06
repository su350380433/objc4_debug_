//
//  TableViewController.m
//  ZSFakeTouchDome
//
//  Created by ss on 2021/4/6.
//  Copyright © 2021 stark. All rights reserved.
//

#import "TableViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <PTFakeTouch/PTFakeMetaTouch.h>
#import "UITouchTableView.h"

static NSInteger touchCount = 0;

@interface TableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITouchTableView *tableView;
@property(nonatomic,strong)NSTimer *timer;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self prepareUI];
    [self fakeTouch];
}

- (void)prepareUI {
    [self.view addSubview:self.tableView];
    self.tableView.frame = self.view.bounds;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"tableviewId"];
}

- (void)fakeTouch {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(timerClcik) userInfo:nil repeats:YES];
}

-(void)timerClcik{

    NSLog(@"touchCount = %ld",touchCount++);
//    [ZSFakeTouch beginTouchWithPoint:CGPointMake(100, 200)];
//    [ZSFakeTouch moveTouchWithPoint:CGPointMake(100, 190)];
//    [ZSFakeTouch endTouchWithPoint:CGPointMake(100, 190)];
    
    NSInteger pointId = [PTFakeMetaTouch fakeTouchId:[PTFakeMetaTouch getAvailablePointId] AtPoint:CGPointMake(100, 200) withTouchPhase:UITouchPhaseBegan];
    if (touchCount == 1) {
        [PTFakeMetaTouch fakeTouchId:pointId AtPoint:CGPointMake(100, 200) withTouchPhase:UITouchPhaseBegan];
    }
    [PTFakeMetaTouch fakeTouchId:pointId AtPoint:CGPointMake(100, 400) withTouchPhase:UITouchPhaseMoved];
    if (touchCount >= 10) {
        [PTFakeMetaTouch fakeTouchId:pointId AtPoint:CGPointMake(100, 100) withTouchPhase:UITouchPhaseEnded];
    }
    
    NSLog(@"touchCount end = %ld",touchCount);

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesBegan = %@",touches);
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesMoved = %@",touches);

}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesEnded = %@",touches);

}

#pragma mark - Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"scrollview = %0.2f",scrollView.contentOffset.y);
}
#pragma mark - UITableViewMethod

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableviewId" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableviewId"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 88;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [UITouchTableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView setBackgroundColor:UIColor.whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

@end
