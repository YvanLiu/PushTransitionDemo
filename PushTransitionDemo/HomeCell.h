//
//  HomeCell.h
//  PushTransitionDemo
//
//  Created by sjimac01 on 2018/2/5.
//  Copyright © 2018年 sjimac01. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Define.h"
@interface HomeCell : UITableViewCell

@property (strong, nonatomic) UIImageView *bgimageView;         // 图片
@property (strong, nonatomic) UIView *bgView;                   // 背景
@property (strong, nonatomic) UILabel *titleLabel;              // 主标题
@property (strong, nonatomic) UILabel *contentLabel;            // 副标题

@end
