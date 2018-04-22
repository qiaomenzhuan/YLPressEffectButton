# YLPressEffectButton
YLPressEffectButton
相信很多人都遇到这样的烦恼，各种交互按钮没有点击效果，也就失去了交互的灵魂，这样点击一个按钮给人一种很生硬的感觉，奈何系统的button满足不了我们的要求，而且本来有的轻点按钮效果经常在UItableview等控件上显示不出来，这时候YLPressEffectButton就出现啦🤣
![ezgif.com-resize-2.gif](https://upload-images.jianshu.io/upload_images/6206716-26b754e17ebeff86.gif?imageMogr2/auto-orient/strip)


实现部分主要是给button添加了四个事件
```
    [btn addTarget:self action:@selector(pressTouchUpInside) forControlEvents:UIControlEventTouchUpInside];//点击并在button区域内松开
    [btn addTarget:self action:@selector(pressTouchDown) forControlEvents:UIControlEventTouchDown];//点击 包括长按不松开
    [btn addTarget:self action:@selector(pressUIControlEventTouchDragExit) forControlEvents:UIControlEventTouchDragExit];//按下并拖到button区域之外松开
    [btn addTarget:self action:@selector(pressUIControlEventTouchDragExit) forControlEvents:UIControlEventTouchCancel];//取消点击 主要应对在UItableview上多个按钮点击时出现点击效果错乱
```

创建部分
```
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
```

以上。
