//
//  YLPressEffectButton.m
//  YLPressEffectButton
//
//  Created by 杨磊 on 2018/4/20.
//  Copyright © 2018年 csda_Chinadance. All rights reserved.
//

#import "YLPressEffectButton.h"

@interface YLPressEffectButton()

@property (nonatomic, strong) UIColor *clolorSelect;
@property (nonatomic, strong) UIColor *clolorNormal;
@property (nonatomic, assign) float   duration;
@property (nonatomic, assign) float   cornerRadius;

@end

@implementation YLPressEffectButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self subViews];
    }
    return self;
}

- (void)subViews
{
    self.backgroundColor = [UIColor clearColor];
    self.duration = 0.15;
    self.clolorSelect = [UIColor groupTableViewBackgroundColor];
    self.clolorNormal = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = self.bounds;
    btn.backgroundColor = [UIColor whiteColor];
    btn.exclusiveTouch = YES;
    [btn addTarget:self action:@selector(pressTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
    [btn addTarget:self action:@selector(pressTouchDown) forControlEvents:UIControlEventTouchDown];
    [btn addTarget:self action:@selector(pressUIControlEventTouchDragExit) forControlEvents:UIControlEventTouchDragExit];
    [btn addTarget:self action:@selector(pressUIControlEventTouchDragExit) forControlEvents:UIControlEventTouchCancel];
    [self addSubview:btn];
    self.button = btn;
}

- (void)pressTouchUpInside
{
    self.button.backgroundColor = self.clolorSelect;

    [UIView animateWithDuration:self.duration animations:^{
        self.button.backgroundColor = self.clolorNormal;
    } completion:^(BOOL finished) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(buttonTouchUpInside)])
        {
            [self.delegate buttonTouchUpInside];
        }
    }];
}

- (void)pressTouchDown
{
    [UIView animateWithDuration:0.01 animations:^{
        self.button.backgroundColor = self.clolorSelect;
    }];
}

- (void)pressUIControlEventTouchDragExit
{
    [UIView animateWithDuration:0.01 animations:^{
        self.button.backgroundColor = self.clolorNormal;
    }];
}

#pragma mark - getter

- (YLPressDuration)YlPressDuration
{
    __weak typeof(self) weakSelf = self;
    return ^(float value)
    {
        if (value >= 0) {
            self.duration = value;
        }
        return weakSelf;
    };
}

- (YLPressDuration)YlPressLayerCornerRadius
{
    __weak typeof(self) weakSelf = self;
    return ^(float value)
    {
        if (value >= 0) {
            self.cornerRadius = value;
            self.button.layer.cornerRadius = value;
            self.button.clipsToBounds = YES;
        }
        return weakSelf;
    };
}

- (YLPressBackgroundColorNormal)YlPressBackgroundColorNormal
{
    __weak typeof(self) weakSelf = self;
    return ^(UIColor * value)
    {
        self.clolorNormal = value ? value : [UIColor whiteColor];
        self.button.backgroundColor = self.clolorNormal;
        return weakSelf;
    };
}

- (YLPressBackgroundColorSelect)YlPressBackgroundColorSelect
{
    __weak typeof(self) weakSelf = self;
    return ^(UIColor * value)
    {
        self.clolorSelect = value ? value : [UIColor groupTableViewBackgroundColor];
        return weakSelf;
    };
}

@end
