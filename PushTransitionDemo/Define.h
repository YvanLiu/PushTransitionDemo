//
//  Define.h
//  WILLB
//
//  Created by sjimac01 on 2017/11/24.
//  Copyright © 2017年 sjimac01. All rights reserved.
//

#import "UIColor+ConvertColor.h"
#import "UILabel+Size.h"
#import "WBTool.h"


#pragma mark - 坐标

#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height
#define SCREEN_BOUNDS   [UIScreen mainScreen].bounds
#define SCREEN_RATIO(x) (x*(SCREEN_WIDTH/375.0))

#define LINE_WIDTH 0.5

#define INDUSTRY_RATIO 0.34

#define VIEW_BORDER_RADIUS(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

#pragma mark - 字体

#define FONT_12 [UIFont systemFontOfSize:12.0f]
#define FONT_13 [UIFont systemFontOfSize:13.0f]
#define FONT_14 [UIFont systemFontOfSize:14.0f]
#define FONT_15 [UIFont systemFontOfSize:15.0f]
#define FONT_16 [UIFont systemFontOfSize:16.0f]
#define FONT_17 [UIFont systemFontOfSize:17.0f]
#define FONT_18 [UIFont systemFontOfSize:18.0f]
#define FONT_19 [UIFont systemFontOfSize:19.0f]
#define FONT_20 [UIFont systemFontOfSize:20.0f]
#define FONT_21 [UIFont systemFontOfSize:21.0f]
#define FONT_22 [UIFont systemFontOfSize:22.0f]
#define FONT_23 [UIFont systemFontOfSize:23.0f]

#define FONT_S(x)   [UIFont systemFontOfSize:x]
#define FONT_B(x)   [UIFont boldSystemFontOfSize:x]
#define FONT_S_R(x) [UIFont systemFontOfSize:(x*(SCREEN_WIDTH/375.0))]
#define FONT_B_R(x) [UIFont boldSystemFontOfSize:(x*(SCREEN_WIDTH/375.0))]

#define FONT_PF(x)      [UIFont fontWithName:@"PingFangSC-Light" size:x]
#define FONT_PF_R(x)    [UIFont fontWithName:@"PingFangSC-Light" size:(x*(SCREEN_WIDTH/375.0))]


#pragma mark - 颜色

#define RGB(r,g,b)      [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1]
#define RGB_A(r,g,b,a)  [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:a]
#define COLOR_STR(str)  [UIColor colorWithHexString:str]
#define COLOR_WHITE [UIColor whiteColor]
#define COLOR_BLACK [UIColor blackColor]
#define COLOR_CLEAR [UIColor clearColor]
#define COLOR_GRAY  [UIColor colorWithHexString:@"B2B2B2"]

#define COLOR_APP   [UIColor colorWithHexString:@"0FB5BA"]
#define COLOR_BG    [UIColor colorWithHexString:@"F3F3F3"]
#define COLOR_LINE  [UIColor colorWithHexString:@"DFDFDF"]
#define COLOR_3     [UIColor colorWithHexString:@"333333"]
#define COLOR_6     [UIColor colorWithHexString:@"666666"]
#define COLOR_9     [UIColor colorWithHexString:@"999999"]
#define COLOR_57A   [UIColor colorWithHexString:@"57575A"]
#define COLOR_1A9   [UIColor colorWithHexString:@"1A1919"]
#define COLOR_F7    [UIColor colorWithHexString:@"F7F7F7"]
#define COLOR_45    [UIColor colorWithHexString:@"454545"]

#define IPHONE_X ([[WBTool iphoneType] isEqualToString:@"iPhone X"] || [[WBTool iphoneType] isEqualToString:@"iPhone Simulator"])


#define HOME_TITLE          @"Today"


