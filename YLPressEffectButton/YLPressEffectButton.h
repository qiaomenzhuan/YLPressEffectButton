//
//  YLPressEffectButton.h
//  YLPressEffectButton
//
//  Created by 杨磊 on 2018/4/20.
//  Copyright © 2018年 csda_Chinadance. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  YLPressEffectButton;

typedef YLPressEffectButton *(^YLPressDuration)(float value);
typedef YLPressEffectButton *(^YLPressLayerCornerRadius)(float value);
typedef YLPressEffectButton *(^YLPressBackgroundColorNormal)(UIColor *value);
typedef YLPressEffectButton *(^YLPressBackgroundColorSelect)(UIColor *value);

@protocol YLPressEffectButtonDelegate<NSObject>

- (void)buttonTouchUpInside;

@end

@interface YLPressEffectButton : UIView

@property (nonatomic,weak) id<YLPressEffectButtonDelegate> delegate;

@property (nonatomic,  copy) YLPressDuration              YlPressDuration;
@property (nonatomic,  copy) YLPressLayerCornerRadius     YlPressLayerCornerRadius;
@property (nonatomic,  copy) YLPressBackgroundColorNormal YlPressBackgroundColorNormal;
@property (nonatomic,  copy) YLPressBackgroundColorSelect YlPressBackgroundColorSelect;

@property (nonatomic,strong) UIButton *button;

@end
