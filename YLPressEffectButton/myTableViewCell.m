//
//  myTableViewCell.m
//  YLPressEffectButton
//
//  Created by 杨磊 on 2018/4/20.
//  Copyright © 2018年 csda_Chinadance. All rights reserved.
//

#import "myTableViewCell.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@implementation myTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creatUI];
    }
    return self;
}

- (void)creatUI
{
    self.myBtn = [[YLPressEffectButton alloc] initWithFrame
                  :CGRectMake((SCREEN_WIDTH - 300)/2, 5, 300, 50)];
    self.myBtn.delegate = self;
    [self.contentView addSubview:self.myBtn];
    UIColor *color1 = [UIColor colorWithRed:arc4random()%256/255.f green:arc4random()%256/255.f blue:arc4random()%256/255.f alpha:1.f];
    UIColor *color2 = [UIColor colorWithRed:arc4random()%256/255.f green:arc4random()%256/255.f blue:arc4random()%256/255.f alpha:1.f];
    self.myBtn
    .YlPressDuration(0.5)
    .YlPressBackgroundColorNormal(color1)
    .YlPressBackgroundColorSelect(color2)
    .YlPressLayerCornerRadius(25);
}

- (void)buttonTouchUpInside
{
    NSLog(@"你点到我了");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
