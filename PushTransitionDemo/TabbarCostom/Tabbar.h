//
//  Tabbar.h
//  TabBarControllerCustomDemo
//
//  Created by sjimac01 on 2018/1/24.
//  Copyright © 2018年 sjimac01. All rights reserved.
//
#define RGB_S(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import <UIKit/UIKit.h>

@interface Tabbar : UITabBar
@property (strong, nonatomic) UIButton *centerButton;

- (instancetype)initWithCenterImage:(NSString *)centerImage selectImage:(NSString *)selectImage target:(id)target action:(SEL)action;



@end
