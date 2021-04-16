//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@class NSArray, NSMutableArray;

@interface XCPointerEventPath : NSObject <NSSecureCoding>
{
    NSMutableArray *_pointerEvents;
    BOOL _immutable;
    unsigned long long _pathType;
    unsigned long long _index;
}
@property BOOL immutable; // @synthesize immutable=_immutable;
@property unsigned long long index; // @synthesize index=_index;
@property(readonly) unsigned long long pathType; // @synthesize pathType=_pathType;
@property(readonly) NSArray *pointerEvents;

- (id)firstEventAfterOffset:(double)arg1;
- (id)lastEventBeforeOffset:(double)arg1;
- (void)_addPointerEvent:(id)arg1;
- (void)releaseButton:(unsigned long long)arg1 atOffset:(double)arg2;
- (void)pressButton:(unsigned long long)arg1 atOffset:(double)arg2;
- (void)liftUpAtOffset:(double)arg1;
- (void)moveToPoint:(struct CGPoint)arg1 atOffset:(double)arg2;
- (void)pressDownWithPressure:(double)arg1 atOffset:(double)arg2;
- (void)pressDownAtOffset:(double)arg1;
- (id)initForMouseAtPoint:(struct CGPoint)arg1 offset:(double)arg2;
- (id)initForTouchAtPoint:(struct CGPoint)arg1 offset:(double)arg2;
- (id)init;

@end
