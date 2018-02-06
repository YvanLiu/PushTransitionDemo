//
//  UILabel+Size.h
//  EasyPoints
//
//  Created by 马克鑫 on 16/8/1.
//  Copyright © 2016年 L. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Size)
+(CGSize)withString:(NSString *)string font:(UIFont *)font;

+(CGSize)withString:(NSString *)string font:(UIFont *)font ViewWidth:(float)Width;

@end
