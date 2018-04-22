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


/**
 按下效果展示时间 YlPressDuration(0.3f)
 */
@property (nonatomic,  copy) YLPressDuration              YlPressDuration;

/**
 圆角
 */
@property (nonatomic,  copy) YLPressLayerCornerRadius     YlPressLayerCornerRadius;

/**
 普通状态下的颜色 YlPressBackgroundColorNormal([UIcolor redColor])
 */
@property (nonatomic,  copy) YLPressBackgroundColorNormal YlPressBackgroundColorNormal;

/**
 按下状态下的颜色 YlPressBackgroundColorSelect([UIcolor whiteColor])
 */
@property (nonatomic,  copy) YLPressBackgroundColorSelect YlPressBackgroundColorSelect;

@property (nonatomic,strong) UIButton *button;

@end
