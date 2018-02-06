//
//  WBTool.h
//  WILLB
//
//  Created by sjimac01 on 2017/11/29.
//  Copyright © 2017年 sjimac01. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sys/utsname.h>
#import <UIKit/UIKit.h>
@interface WBTool : NSObject


/**
 验证手机号是否合法
 
 @param mobileNum 手机号
 @return YES NO
 */
+ (BOOL)isMobileNumber:(NSString *)mobileNum;

/**
 检查是否含有大写字母
 
 @param capital 检查字符串
 @return YES 有 NO 没有
 */
+ (BOOL)isCapital:(NSString *)capital;

/**
 检查时候含有小写字母
 
 @param letter 检查字符串
 @return YES 有 NO 没有
 */
+ (BOOL)isLetter:(NSString *)letter;

/**
 检查是否含有数字
 
 @param number 检查字符串
 @return YES 有 NO 没有
 */
+ (BOOL)isNumber:(NSString *)number;

/**
 检查是否含有特殊字符
 
 @param character 检查字符串
 @return YES 有 NO 没有
 */
+ (BOOL)isCharacter:(NSString *)character;

/**
 检查密码是否合法
 
 @param passwordLength 密码字符串
 @return YES 通过 NO 不通过
 */
+ (BOOL)isPasswordLength:(NSString *)passwordLength;

/**
 检查用户名是否合法
 
 @param nickname 用户名
 @return YES 合法 NO 不合法
 */
+ (BOOL)isNickname:(NSString *)nickname;

/**
 检查邮箱是否合法
 
 @param email 邮箱字符串
 @return YES 合法 NO 不合法
 */
+ (BOOL)isValidateEmail:(NSString *)email;


/**
 判断手机版本

 @return 手机版本号
 */
+ (NSString*)iphoneType;


/**
 获取wifi名字

 @return wifi名字
 */
+ (NSString *)getWifiName;

/**
 时间戳转换时间 mm:ss

 @param time 时间戳
 @return 返回hh:kk
 */
+ (NSString *)getTimeWithTimeInterval:(NSString *)time;


/**
 时间戳转换日期 yyyy.mm.ss

 @param time 时间戳
 @return 返回yyyy.mm.ss
 */
+ (NSString *)getDateWithTimeInterval:(NSString *)time;

/**
 时间戳转换日期 yyyy-MM-dd HH:mm:ss
 
 @param time 时间戳
 @return 返回yyyy.mm.ss
 */
+ (NSString *)getDateWithTimeInterval2:(NSString *)time;


/**
 截取图片

 @param imgSize 尺寸
 @param view 要截取的view
 @return 图片
 */
+ (UIImage *)screenImageWithSize:(CGSize )imgSize View:(UIView *)view;


/**
 多少天前

 @param oldTime 过去时间
 @param newTime 当前时间
 @return 多少天前
 */
+ (NSString *)timeConversionWithOldTime:(NSString *)oldTime NewTime:(NSString *)newTime;

/**
 多少天前
 
 @param time 时间戳
 @return 多少天前
 */
+ (NSString *)timeConversionWithTime:(NSString *)time;

/**
 两个时间戳（234231342314）计算时间差 （int）xxxx 分钟

 @param startDate 开始时间 时间戳
 @param endDate 结束时间 时间戳
 @return 时间差
 */
+ (int)minutesWithStartDate:(NSString *)startDate endDate:(NSString *)endDate;


/**
 两个时间（hh:mm）计算时间差 xxxx分钟

 @param startDate 开始时间 hh:mm
 @param endDate 结束时间 hh:mm
 @return 时间差
 */
+ (int)minutesWithStartTime:(NSString *)startDate endTime:(NSString *)endDate;

/**
 两个时间计算时间差 xx小时xx分钟

 @param startDate xx:xx
 @param endDate xx:xx
 @return xx小时xx分钟
 */
+ (NSString *)hoursWithStartDate:(NSString *)startDate endDate:(NSString *)endDate;



/**
 日期加星期 xxxx-xx-xx(xxx)

 @param timeInterval 时间戳
 @return xxxx-xx-xx(xxx)
 */
+ (NSString *)getWeekDateWithTimeInterval:(NSString *)timeInterval;


/**
 获取当前时间戳

 @return 时间戳
 */
+ (NSString *)getNowTimeTimestamp;


/**
 字符串去(null)

 @param str 输入
 @return 输出
 */
+ (NSString *)stringWithString:(id)str;


/**
 颜色转图片

 @param color 颜色
 @return 图片
 */
+ (UIImage*)createImageWithColor:(UIColor*)color;


/**
 颜色转图片带size

 @param color 颜色
 @param size size
 @return 图片
 */
+ (UIImage*)createImageWithColor:(UIColor*)color size:(CGSize)size;

@end
