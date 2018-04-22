//
//  myTableViewCell.h
//  YLPressEffectButton
//
//  Created by 杨磊 on 2018/4/20.
//  Copyright © 2018年 csda_Chinadance. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLPressEffectButton.h"

@interface myTableViewCell : UITableViewCell<YLPressEffectButtonDelegate>

@property (nonatomic, strong) YLPressEffectButton *myBtn;
@end
