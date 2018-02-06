//
//  Tabbar.m
//  TabBarControllerCustomDemo
//
//  Created by sjimac01 on 2018/1/24.
//  Copyright © 2018年 sjimac01. All rights reserved.
//

#import "Tabbar.h"

@implementation Tabbar

- (instancetype)initWithCenterImage:(NSString *)centerImage selectImage:(NSString *)selectImage target:(id)target action:(SEL)action {
    if (self = [super init]) {
        self.userInteractionEnabled = YES;
        self.tintColor = RGB_S(0x0FB5BA);
        self.translucent = YES;
        [self.centerButton setBackgroundImage:[UIImage imageNamed:centerImage] forState:UIControlStateNormal];
        [self.centerButton setBackgroundImage:[UIImage imageNamed:selectImage] forState:UIControlStateHighlighted];
        [self.centerButton setBackgroundImage:[UIImage imageNamed:selectImage] forState:UIControlStateSelected];
        [self.centerButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.centerButton];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat centerW = self.centerButton.currentBackgroundImage.size.width;
    CGFloat centerH = self.centerButton.currentBackgroundImage.size.height;
    
    self.centerButton.frame = CGRectMake((self.frame.size.width-centerW)/2, 0, centerW, centerH);
    CGFloat itemW  = self.frame.size.width / 5;
    CGFloat itemIndex = 0;
    // 计算每个item位置
    for (UIView *child in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            child.frame = CGRectMake(itemIndex *itemW, child.frame.origin.y, itemW, child.frame.size.height);
            itemIndex ++;
            if (itemIndex == 2) {
                itemIndex ++;
            }
        }
    }
}


#pragma mark - 重写hitTest方法
// TODO: 如果不重写此方法，centerButton超出tabbar的部分点击无效
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
   // 1. isHidden==NO 表示当前在tabbar页面
    if (self.isHidden == NO) {
        // 1.1 获取触摸点坐标系转化到centerButton上的CGPoint
        CGPoint newPoint = [self convertPoint:point toView:self.centerButton];
        // 1.2 判断point是否在centerButton上，如果在，centerButton来处理点击事件
        if ( [self.centerButton pointInside:newPoint withEvent:event]) {
            return self.centerButton;
        }
        // 1.3 如不在，系统自行处理
        else{
            return [super hitTest:point withEvent:event];
        }
    }
    // 2. 不在tabbar页面，系统自行处理点击事件
    else {
        return [super hitTest:point withEvent:event];
    }
}


- (UIButton *)centerButton {
    if (_centerButton == nil) {
        _centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _centerButton;
}

@end
