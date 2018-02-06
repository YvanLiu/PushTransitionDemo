//
//  WBTool.m
//  WILLB
//
//  Created by sjimac01 on 2017/11/29.
//  Copyright © 2017年 sjimac01. All rights reserved.
//

#import "WBTool.h"
#import <SystemConfiguration/CaptiveNetwork.h>
@implementation WBTool

#pragma mark - 检测是否是手机号码
+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    NSString *MOBILE = @"^1(3[0-9]|4[579]|5[0-35-9]|7[0135-8]|8[0-9])\\d{8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    return [regextestmobile evaluateWithObject:mobileNum];
}

#pragma mark - 检验是否含有大写字母
+ (BOOL)isCapital:(NSString *)capital
{
    NSString *CAPITAL = @"[A-Z]+";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CAPITAL];
    
    BOOL isyes = [regextestmobile evaluateWithObject:capital];
    
    return isyes;
}

#pragma mark - 检验是否含有小写字母
+ (BOOL)isLetter:(NSString *)letter
{
    NSString *LETTER = @"[a-z]+";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", LETTER];
    
    return [regextestmobile evaluateWithObject:letter];
}

#pragma mark - 检验是否含有数字
+ (BOOL)isNumber:(NSString *)number
{
    NSString *NUMBER = @"[0-9]+";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", NUMBER];
    
    return [regextestmobile evaluateWithObject:number];
}

#pragma mark - 检验是否含有特殊字符
+ (BOOL)isCharacter:(NSString *)character
{
    NSString *CHARACTER = @"[^%&',;=?$\x22]+";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CHARACTER];
    
    return [regextestmobile evaluateWithObject:character];
}

#pragma mark - 检验密码长度
+ (BOOL)isPasswordLength:(NSString *)passwordLength
{
    //NSString *PASSWORD = @"^(?=.*[0-9].*)(?=.*[A-Z].*)(?=.*[a-z].*).{8,12}$";
    NSString *PASSWORD = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{8,12}";

    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PASSWORD];
    
    
    return [regextestmobile evaluateWithObject:passwordLength];
}

#pragma mark - 检验用户名
+ (BOOL)isNickname:(NSString *)nickname
{
    NSString *NICKNAME = @"^[a-zA-Z0-9\u4e00-\u9fa5][a-zA-Z0-9\u4e00-\u9fa5]{1,16}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", NICKNAME];
    
    
    return [regextestmobile evaluateWithObject:nickname];
}

#pragma mark - 检验邮箱
+ (BOOL)isValidateEmail:(NSString *)email{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}


+ (NSString*)iphoneType {
    
    //需要导入头文件：#import <sys/utsname.h>
    
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    NSString*platform = [NSString stringWithCString: systemInfo.machine encoding:NSASCIIStringEncoding];
    if([platform isEqualToString:@"iPhone1,1"]) return@"iPhone 2G";
    if([platform isEqualToString:@"iPhone1,2"]) return@"iPhone 3G";
    if([platform isEqualToString:@"iPhone2,1"]) return@"iPhone 3GS";
    if([platform isEqualToString:@"iPhone3,1"]) return@"iPhone 4";
    if([platform isEqualToString:@"iPhone3,2"]) return@"iPhone 4";
    if([platform isEqualToString:@"iPhone3,3"]) return@"iPhone 4";
    if([platform isEqualToString:@"iPhone4,1"]) return@"iPhone 4S";
    if([platform isEqualToString:@"iPhone5,1"]) return@"iPhone 5";
    if([platform isEqualToString:@"iPhone5,2"]) return@"iPhone 5";
    if([platform isEqualToString:@"iPhone5,3"]) return@"iPhone 5c";
    if([platform isEqualToString:@"iPhone5,4"]) return@"iPhone 5c";
    if([platform isEqualToString:@"iPhone6,1"]) return@"iPhone 5s";
    if([platform isEqualToString:@"iPhone6,2"]) return@"iPhone 5s";
    if([platform isEqualToString:@"iPhone7,1"]) return@"iPhone 6 Plus";
    if([platform isEqualToString:@"iPhone7,2"]) return@"iPhone 6";
    if([platform isEqualToString:@"iPhone8,1"]) return@"iPhone 6s";
    if([platform isEqualToString:@"iPhone8,2"]) return@"iPhone 6s Plus";
    if([platform isEqualToString:@"iPhone8,4"]) return@"iPhone SE";
    if([platform isEqualToString:@"iPhone9,1"]) return@"iPhone 7";
    if([platform isEqualToString:@"iPhone9,2"]) return@"iPhone 7 Plus";
    if([platform isEqualToString:@"iPhone10,1"]) return@"iPhone 8";
    if([platform isEqualToString:@"iPhone10,4"]) return@"iPhone 8";
    if([platform isEqualToString:@"iPhone10,2"]) return@"iPhone 8 Plus";
    if([platform isEqualToString:@"iPhone10,5"]) return@"iPhone 8 Plus";
    if([platform isEqualToString:@"iPhone10,3"]) return@"iPhone X";
    if([platform isEqualToString:@"iPhone10,6"]) return@"iPhone X";
    if([platform isEqualToString:@"iPod1,1"]) return@"iPod Touch 1G";
    if([platform isEqualToString:@"iPod2,1"]) return@"iPod Touch 2G";
    if([platform isEqualToString:@"iPod3,1"]) return@"iPod Touch 3G";
    if([platform isEqualToString:@"iPod4,1"]) return@"iPod Touch 4G";
    if([platform isEqualToString:@"iPod5,1"]) return@"iPod Touch 5G";
    if([platform isEqualToString:@"iPad1,1"]) return@"iPad 1G";
    if([platform isEqualToString:@"iPad2,1"]) return@"iPad 2";
    if([platform isEqualToString:@"iPad2,2"]) return@"iPad 2";
    if([platform isEqualToString:@"iPad2,3"]) return@"iPad 2";
    if([platform isEqualToString:@"iPad2,4"]) return@"iPad 2";
    if([platform isEqualToString:@"iPad2,5"]) return@"iPad Mini 1G";
    if([platform isEqualToString:@"iPad2,6"]) return@"iPad Mini 1G";
    if([platform isEqualToString:@"iPad2,7"]) return@"iPad Mini 1G";
    if([platform isEqualToString:@"iPad3,1"]) return@"iPad 3";
    if([platform isEqualToString:@"iPad3,2"]) return@"iPad 3";
    if([platform isEqualToString:@"iPad3,3"]) return@"iPad 3";
    if([platform isEqualToString:@"iPad3,4"]) return@"iPad 4";
    if([platform isEqualToString:@"iPad3,5"]) return@"iPad 4";
    if([platform isEqualToString:@"iPad3,6"]) return@"iPad 4";
    if([platform isEqualToString:@"iPad4,1"]) return@"iPad Air";
    if([platform isEqualToString:@"iPad4,2"]) return@"iPad Air";
    if([platform isEqualToString:@"iPad4,3"]) return@"iPad Air";
    if([platform isEqualToString:@"iPad4,4"]) return@"iPad Mini 2G";
    if([platform isEqualToString:@"iPad4,5"]) return@"iPad Mini 2G";
    if([platform isEqualToString:@"iPad4,6"]) return@"iPad Mini 2G";
    if([platform isEqualToString:@"iPad4,7"]) return@"iPad Mini 3";
    if([platform isEqualToString:@"iPad4,8"]) return@"iPad Mini 3";
    if([platform isEqualToString:@"iPad4,9"]) return@"iPad Mini 3";
    if([platform isEqualToString:@"iPad5,1"]) return@"iPad Mini 4";
    if([platform isEqualToString:@"iPad5,2"]) return@"iPad Mini 4";
    if([platform isEqualToString:@"iPad5,3"]) return@"iPad Air 2";
    if([platform isEqualToString:@"iPad5,4"]) return@"iPad Air 2";
    if([platform isEqualToString:@"iPad6,3"]) return@"iPad Pro 9.7";
    if([platform isEqualToString:@"iPad6,4"]) return@"iPad Pro 9.7";
    if([platform isEqualToString:@"iPad6,7"]) return@"iPad Pro 12.9";
    if([platform isEqualToString:@"iPad6,8"]) return@"iPad Pro 12.9";

    if([platform isEqualToString:@"i386"]) return@"iPhone Simulator";
    if([platform isEqualToString:@"x86_64"]) return@"iPhone Simulator";
    return platform;
    
}


#pragma mark - 获取wifi名字

+ (NSString *)getWifiName {
    NSString *wifiName = nil;
    CFArrayRef wifiInterfaces = CNCopySupportedInterfaces();
    if (!wifiInterfaces) {
        return nil;
    }
    NSArray *interfaces = (__bridge NSArray *)wifiInterfaces;
    for (NSString *interfaceName in interfaces) {
        CFDictionaryRef dictRef = CNCopyCurrentNetworkInfo((__bridge CFStringRef)(interfaceName));
        if (dictRef) {
            NSDictionary *networkInfo = (__bridge NSDictionary *)dictRef;
            wifiName = [networkInfo objectForKey:(__bridge NSString *)kCNNetworkInfoKeySSID];
            CFRelease(dictRef);
        }
    }
    CFRelease(wifiInterfaces);
    return wifiName;
}

+ (NSString *)getTimeWithTimeInterval:(NSString *)time {
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"beijing"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"HH:mm"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[time doubleValue]/ 1000.0];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

+ (NSString *)getDateWithTimeInterval:(NSString *)time {
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"beijing"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy.MM.dd"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[time doubleValue]/ 1000.0];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

+ (NSString *)getDateWithTimeInterval2:(NSString *)time {
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"beijing"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[time doubleValue]/ 1000.0];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

+ (UIImage *)screenImageWithSize:(CGSize )imgSize View:(UIView *)view {
    UIGraphicsBeginImageContext(imgSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+ (NSString *)timeConversionWithOldTime:(NSString *)oldTime NewTime:(NSString *)newTime {
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate * lastDate = [dateFormatter dateFromString:oldTime];
    NSDate * nowDate = [dateFormatter dateFromString:newTime];
    
    NSTimeInterval time = [nowDate timeIntervalSinceDate:lastDate];
    NSTimeInterval retTime;
    if (time < 3600) {//小于一小时
        retTime = time/60;
        return (retTime<1.0)?@"刚刚":[NSString stringWithFormat:@"%.0f分钟前",retTime];
    } else if (time < 3600*24) {//小于一天
        retTime = time/3600;
        return (retTime < 1)?@"1小时前":[NSString stringWithFormat:@"%.0f小时前",retTime];
    } else if (time < 3600*24*30) {
        retTime = time/(3600*24);
        return [NSString stringWithFormat:@"%.0f天前",retTime];
    } else {
        return @"30天前";
    }
}

+ (NSString *)timeConversionWithTime:(NSString *)oldTime {

    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate * lastDate = [dateFormatter dateFromString:[self getDateWithTimeInterval2:oldTime]];
    NSDate * nowDate = [NSDate date];
    
    NSTimeInterval time = [nowDate timeIntervalSinceDate:lastDate];
    NSTimeInterval retTime;
    if (time < 3600) {//小于一小时
        retTime = time/60;
        return (retTime<1.0)?@"刚刚":[NSString stringWithFormat:@"%.0f分钟前",retTime];
    } else if (time < 3600*24) {//小于一天
        retTime = time/3600;
        return (retTime < 1)?@"1小时前":[NSString stringWithFormat:@"%.0f小时前",retTime];
    } else if (time < 3600*24*30) {
        retTime = time/(3600*24);
        return [NSString stringWithFormat:@"%.0f天前",retTime];
    } else {
        return @"30天前";
    }
}

+ (int)minutesWithStartDate:(NSString *)startDate endDate:(NSString *)endDate {
    
    NSString * start = [self getTimeWithTimeInterval: startDate];
    NSString * end = [self getTimeWithTimeInterval: endDate];
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"mm:ss";
    NSDate *date1 = [fmt dateFromString:start];
    NSDate *date2 = [fmt dateFromString:end];
    NSTimeInterval time = [date2 timeIntervalSinceDate:date1];
    
    return time;
}

+ (int)minutesWithStartTime:(NSString *)startDate endTime:(NSString *)endDate {
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"mm:ss";
    NSDate *date1 = [fmt dateFromString:startDate];
    NSDate *date2 = [fmt dateFromString:endDate];
    NSTimeInterval time = [date2 timeIntervalSinceDate:date1];
    return time;
}


+ (NSString *)getWeekDateWithTimeInterval:(NSString *)timeInterval {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeInterval doubleValue]/ 1000.0];
    NSString *dateTime = [formatter stringFromDate:date];
    NSArray*weekdays = [NSArray arrayWithObjects: [NSNull null],@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",nil];
    NSCalendar*calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone*timeZone = [[NSTimeZone alloc]initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSCalendarUnit calendarUnit =NSCalendarUnitWeekday;
    NSDateComponents*theComponents = [calendar components:calendarUnit fromDate:date];
    NSString *weekTime = [weekdays objectAtIndex:theComponents.weekday];
    return [NSString stringWithFormat:@"%@(%@)",dateTime,weekTime];
}

+ (NSString *)hoursWithStartDate:(NSString *)startDate endDate:(NSString *)endDate {
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"mm:ss";
    NSDate *date1 = [fmt dateFromString:startDate];
    NSDate *date2 = [fmt dateFromString:endDate];
    NSTimeInterval time = [date2 timeIntervalSinceDate:date1];
    int hour = time/60;
    int miunte = (int)time%60;
    if (miunte == 0 ) return [NSString stringWithFormat:@"%d小时",hour];
    return [NSString stringWithFormat:@"%d小时%d分钟",hour,miunte];
}




+ (NSString *)getNowTimeTimestamp {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    //设置时区,这个对于时间的处理有时很重要
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    return timeSp;
}

+ (NSString *)stringWithString:(id)str {
    NSString *temp = [NSString stringWithFormat:@"%@",str];
    temp = [temp stringByReplacingOccurrencesOfString:@"(null)" withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@"<null>" withString:@""];
    return temp;
}


+ (UIImage*)createImageWithColor:(UIColor*)color {
    
    CGRect rect=CGRectMake(0.0f,0.0f,1.0f,1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage*theImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    return theImage;
}

+ (UIImage*)createImageWithColor:(UIColor*)color size:(CGSize)size {
    
    UIGraphicsBeginImageContextWithOptions(size, false, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [color setFill];
    CGContextAddRect(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, size.width, size.height));
    CGContextDrawPath(context,kCGPathFill);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

@end
